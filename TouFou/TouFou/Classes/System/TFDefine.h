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

#define iTunes_APP                      @"757844897"
#define iTunes_URL                      [NSString stringWithFormat:@"https://itunes.apple.com/cn/app/id%@",iTunes_APP]

#define TFNotificationCenter            [NSNotificationCenter defaultCenter]
#define TFNotificationInfo              @"TFNotificationInfo"

#define TFWidth                         UIScreen.width
#define TFHeight                        UIScreen.height
#define TFHeightHead                    44.f
#define TFHeightStatusBar               20.f
#define TFHeightSeparator               0.5f
#define TFAnimate                       0.3f
#define TFCorner                        5

#define TFColor_Nav_Title               [UIColor colorWithHex:0x555555]
#define TFColor_Nav_Background          [UIColor colorWithHex:0xFAFAFA]
#define TFColor_Line                    [UIColor colorWithHex:0xEAEAEA]
#define TFColor_Text_Dark               [UIColor colorWithHex:0x555555]
#define TFColor_Text_Light              [UIColor colorWithHex:0xBABABA]
#define TFColor_Text_Reply              [UIColor colorWithHex:0x11509A]
#define TFColor_Button                  [UIColor colorWithHex:0x76A6FD]
#define TFColor_Separator               [UIColor colorWithWhite:1 alpha:0.2]

#endif /* TFDefine_h */
