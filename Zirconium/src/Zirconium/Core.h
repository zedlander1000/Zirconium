#pragma once

#ifdef ZR_PLATFORM_WINDOWS
	#ifdef ZR_BUILD_DLL
		#define	ZIRCONIUM_API __declspec(dllexport)
	#else
		#define ZIRCONIUM_API __declspec(dllimport)
	#endif
#else
	#error Zirconium only supports Windows!
#endif