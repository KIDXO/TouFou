//
//  TFDefine.h
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#ifndef TFDefine_h
#define TFDefine_h

#import "UIScreen+Frame.h"

#ifdef  DEBUG
#define TFLog(...) NSLog(__VA_ARGS__)
#else
#define TFLog(...)
#endif

#define TFNotificationCenter            [NSNotificationCenter defaultCenter]
#define TFNotificationInfo              @"TFNotificationInfo"

#define TFWidth                         UIScreen.width
#define TFHeight                        UIScreen.height
#define TFHeightHead                    44.f
#define TFHeightStatusBar               20.f
#define TFHeightSeparator               0.5f
#define TFAnimate                       0.3f
#define TFCorner                        5

#define TFColor_Main                    [UIColor colorWithHex:0x555555]
#define TFColor_Line                    [UIColor colorWithHex:0xEAEAEA]
#define TFColor_Text_Dark               [UIColor colorWithHex:0x808080]
#define TFColor_Text_Light              [UIColor colorWithHex:0xA9A9A9]
#define TFColor_Button                  [UIColor colorWithHex:0x76A6FD]
#define TFColor_Separator               [UIColor colorWithWhite:1 alpha:0.2]


#endif /* TFDefine_h */
