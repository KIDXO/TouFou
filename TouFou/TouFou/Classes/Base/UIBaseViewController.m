//
//  UIBaseViewController.m
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "UIBaseViewController.h"
#import "TFHomeViewController.h"
#import "TFMonitorViewController.h"

@interface UIBaseViewController ()

@end

@implementation UIBaseViewController

- (id)init
{
    self = [super init];
    return self;	
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    TFLog(@"当前视图控制器: %@", self.class);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([self isKindOfClass:TFHomeViewController.class]) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    }
    else {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    }
    /*
    if (_navigationBarHidden_New != _navigationBarHidden_Old) {
       [self.navigationController setNavigationBarHidden:_navigationBarHidden_New animated:YES];
    }
    */
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    TFLog(@"视图控制器显示: %@", self.titleCustom);
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    TFLog(@"视图控制器消失: %@", self.titleCustom);
}

- (void)createCustomButton:(nullable NSString *)title
                    target:(nullable id)target
                    action:(nullable SEL)action
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title
                                                             style:UIBarButtonItemStylePlain
                                                            target:target
                                                            action:action];
    item.tintColor = TFColor_Button;
    self.navigationItem.rightBarButtonItem = item;
}

- (void)createReturnButton
{
    CGRect frame = CGRectZero;
    UIImage *image = [UIImage imageNamed:@"UINavBack"];
    frame.size = image.size;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    [btn setImage:image forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(actionReturn) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)actionReturn
{
    [self.navigationController popViewControllerAnimated:true];
}

- (UIWindow *)window
{
    UIApplication *app = [UIApplication sharedApplication];
    if ([app.delegate respondsToSelector:@selector(window)]) {
        return [app.delegate window];
    }
    else {
        return [app keyWindow];
    }
}

@end
