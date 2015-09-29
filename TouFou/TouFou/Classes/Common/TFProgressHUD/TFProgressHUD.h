//
//  TFProgressHUD.h
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFProgressHUD : NSObject

+ (void)show;
+ (void)showWithStatus:(NSString*)status;

+ (void)showProgress:(float)progress;
+ (void)showProgress:(float)progress status:(NSString*)status;

+ (void)showInfoWithStatus:(NSString*)status;
+ (void)showSuccessWithStatus:(NSString*)status;
+ (void)showErrorWithStatus:(NSString*)status;
+ (void)showErrorNetwork;
+ (void)showErrorTimeOut;

+ (void)dismiss;
+ (void)dismissWithDelay:(NSTimeInterval)delay;

+ (BOOL)isVisible;

@end
