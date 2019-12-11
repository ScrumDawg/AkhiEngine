workspace "Akhi"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}
	
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Akhi"
	location "Akhi"
	kind "SharedLib"
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
		"%{prj.name}/vendor/spdlog/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "10.0.17134.0"

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
		systemversion "10.0.17134.0"

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
