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

#define TFWidth                         UIScreen.width
#define TFHeight                        UIScreen.height
#define TFHeightHead                    44.f
#define TFHeightStatusBar               20.f
#define TFAnimate                       0.3f

#define TFColor_Main                    [UIColor colorWithHex:0xF76868]


#endif /* TFDefine_h */
