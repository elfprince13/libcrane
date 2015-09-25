//
//  crane.h
//  CLI WabbitEmu
//
//  Created by Thomas Dickerson on 9/24/15.
//  Copyright © 2015 StickFigure Graphic Productions. All rights reserved.
//

#ifndef crane_h
#define crane_h

void getApplicationLogFile(char * buf, size_t maxl, const char* appName);
void getApplicationDataDirectory(char * buf, size_t maxl, const char* appName);
void getApplicationScriptsDirectory(char * buf, size_t maxl, const char* appName);
void getUserHomeDirectory(char * buf, size_t maxl);
void getTemporaryDirectory(char * buf, size_t maxl);


#endif /* crane_h */
