//
//  crane.h
//  CLI WabbitEmu
//
//  Created by Thomas Dickerson on 9/24/15.
//  Copyright © 2015 StickFigure Graphic Productions. All rights reserved.
//

#ifndef crane_h
#define crane_h

void getApplicationLogFile(char * buf, int maxl, const char* appName);
void getApplicationDataDirectory(char * buf, int maxl, const char* appName);
void getApplicationScriptsDirectory(char * buf, int maxl, const char* appName);
void getUserHomeDirectory(char * buf, int maxl);
void getTemporaryDirectory(char * buf, int maxl);


#endif /* crane_h */
