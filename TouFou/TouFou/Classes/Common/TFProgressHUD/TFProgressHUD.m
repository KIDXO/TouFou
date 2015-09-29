//
//  TFProgressHUD.m
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFProgressHUD.h"
#import "SVProgressHUD.h"

@implementation TFProgressHUD

+ (void)show
{
    [SVProgressHUD show];
}

+ (void)showLoading
{
    [self showWithStatus:@"正在加载"];
}

+ (void)showWithStatus:(NSString*)status
{
    [SVProgressHUD showWithStatus:status];
}

+ (void)showProgress:(float)progress
{
    [SVProgressHUD showProgress:progress];
}

+ (void)showProgress:(float)progress status:(NSString*)status
{
    [SVProgressHUD showProgress:progress status:status];
}

+ (void)showInfoWithStatus:(NSString*)status
{
    [SVProgressHUD showInfoWithStatus:status];
}

+ (void)showSuccessWithStatus:(NSString*)status
{
    [SVProgressHUD showSuccessWithStatus:status];
}

+ (void)showErrorWithStatus:(NSString*)status
{
    [SVProgressHUD showErrorWithStatus:status];
}

+ (void)showErrorNetwork
{
    [self showErrorWithStatus:@"网络已被断开\n请连网后重试"];
}

+ (void)showErrorTimeOut
{
    [self showErrorWithStatus:@"网络连接超时\n请您稍后再试"];
}

+ (void)dismiss
{
    [SVProgressHUD dismiss];
}

+ (void)dismissWithDelay:(NSTimeInterval)delay
{
    [SVProgressHUD dismissWithDelay:delay];
}

+ (BOOL)isVisible
{
    return [SVProgressHUD isVisible];
}

@end
