workspace "Akhi"
	architecture "x64"
	startproject "Sandbox"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}
	
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["GLFW"] = "Akhi/vendor/GLFW/include"

include "Akhi/vendor/GLFW"

project "Akhi"
	location "Akhi"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "akhipch.h"
	pchsource "Akhi/src/akhipch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}"
	}

	links
	{
		"GLFW",
		"opengl32.lib"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"AKHI_PLATFORM_WINDOWS",
			"AKHI_BUILD_DLL"
		}


		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox" )
		}

	filter "configurations:Debug"
		defines "AKHI_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "AKHI_RELEASE"
		symbols "On"

	filter "configurations:Dist"
		defines "AKHI_DIST"
		symbols "On"


project "Sandbox"
	location "Sandbox"
	kind"ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Akhi/vendor/spdlog/include",
		"Akhi/src"
	}

	links
	{
		"Akhi"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"AKHI_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "AKHI_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "AKHI_RELEASE"
		symbols "On"

	filter "configurations:Dist"
		defines "AKHI_DIST"
		symbols "On"
