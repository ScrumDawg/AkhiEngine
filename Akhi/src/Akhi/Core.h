#pragma once

#ifdef AKHI_PLATFORM_WINDOWS
	#ifdef AKHI_BUILD_DLL
		#define AKHI_API __declspec(dllexport)
	#else
		#define AKHI_API __declspec(dllimport)
	#endif
#else
	#error Akhi only support Windows x64
#endif

#ifdef AKHI_ENABLE_ASSERTS
	#define AKHI_ASSERT(x, ...) { if(!(x)) { AKHI_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
	#define AKHI_CORE_ASSERT(x, ...) { if(!(x)) { AKHI_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
	#define AKHI_ASSERT(x, ...)
	#define AKHI_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)

