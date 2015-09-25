#import <Foundation/Foundation.h>
#include "crane.h"

void searchPathForApp(char * buf, size_t maxl, NSString* backup, NSString* appName, NSString* prefixDir, NSSearchPathDirectory nspd, NSString* postFix)
{
	@autoreleasepool {
		NSString *ald = nil;
		OSErr err = 0;
		
		if (ald == nil) {
			NSArray *paths = NSSearchPathForDirectoriesInDomains(nspd, NSUserDomainMask, YES);
			if (paths.count == 1) {
				ald = paths[0];
				if(prefixDir != nil) ald = [ald stringByAppendingPathComponent:prefixDir];
				ald = [ald stringByAppendingPathComponent:appName];
				NSFileManager *fileManager = [NSFileManager defaultManager];
				BOOL isDirectory = NO;
				if (![fileManager fileExistsAtPath:ald isDirectory:&isDirectory]) {
					if (![fileManager createDirectoryAtURL:[NSURL fileURLWithPath:ald] withIntermediateDirectories:YES attributes:nil error:nil]) {
						ald = nil;
						err = 1;
					}
				} else {
					if (!isDirectory) {
						ald = nil;
						err = 1;
					}
				}
			}
		}
		
		if (ald == nil || err != 0){
			ald = backup;
		}
		if(postFix != nil)
			ald = [ald stringByAppendingPathComponent:postFix];
		
		
		[ald getFileSystemRepresentation:buf maxLength:maxl];
	}
}

void getApplicationLogFile(char * buf, size_t maxl, const char* appName)
{
	@autoreleasepool {
		NSString *nAppName = @(appName);
		searchPathForApp(buf, maxl, [[[(@"~/").stringByStandardizingPath stringByAppendingPathComponent:@""] stringByAppendingPathExtension:nAppName] stringByAppendingPathComponent:@"logs"], nAppName, @"Logs", NSLibraryDirectory, [[NSBundle mainBundle].bundleIdentifier stringByAppendingPathExtension:@"log"]);
	}
}

//-----------------------------------------------------------------------------
void getApplicationDataDirectory(char * buf, size_t maxl, const char* appName)
{
	@autoreleasepool {
		NSString *nAppName = @(appName);
		searchPathForApp(buf, maxl, [[[(@"~/").stringByStandardizingPath stringByAppendingPathComponent:@""] stringByAppendingPathExtension:nAppName] stringByAppendingPathComponent:@"data"], nAppName, nil, NSApplicationSupportDirectory, nil);
	}
}

//-----------------------------------------------------------------------------
void getApplicationScriptsDirectory(char * buf, size_t maxl, const char* appName)
{
	@autoreleasepool {
		NSString *nAppName = @(appName);
		searchPathForApp(buf, maxl, [[[(@"~/").stringByStandardizingPath stringByAppendingPathComponent:@""] stringByAppendingPathExtension:nAppName] stringByAppendingPathComponent:@"scripts"], nAppName, nil, NSApplicationScriptsDirectory, nil);
	}
}

//-----------------------------------------------------------------------------
void getUserHomeDirectory(char * buf, size_t maxl)
{
	@autoreleasepool {
		[(@"~/").stringByStandardizingPath getFileSystemRepresentation:buf maxLength:maxl];
	}
}

//-----------------------------------------------------------------------------
void getTemporaryDirectory(char * buf, size_t maxl)
{
	@autoreleasepool {
		NSString* tdir = NSTemporaryDirectory();
		[tdir getFileSystemRepresentation:buf maxLength:maxl];
	}
}

