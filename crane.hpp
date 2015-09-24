#ifndef _CRANE_H_
#define _CRANE_H_

#ifdef XDG_UNIX 
#define DLLFUNC  
#endif
#ifdef _WINDOWS
#define DLLFUNC __declspec(dllexport)
#endif

extern "C"  {
	DLLFUNC void getApplicationLogFile(char * buf, size_t maxl, const char* appName);
	DLLFUNC void getApplicationDataDirectory(char * buf, size_t maxl, const char* appName);
	DLLFUNC void getApplicationScriptsDirectory(char * buf, size_t maxl, const char* appName);
	DLLFUNC void getUserHomeDirectory(char * buf, size_t maxl);
	DLLFUNC void getTemporaryDirectory(char * buf, size_t maxl);
}

#endif
