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

