//
//  UIBaseNavigationController.m
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "UIBaseNavigationController.h"
#import "UIBaseViewController.h"

@interface UIBaseNavigationController ()

@end

@implementation UIBaseNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    
    self.navigationBar.tintColor = TFColor_Nav_Title;
    self.navigationBar.barTintColor = TFColor_Nav_Background;
    self.navigationBar.translucent = NO;
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:TFColor_Nav_Title,NSForegroundColorAttributeName,nil]];
    
    return self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //从vc进入到viewController
    UIViewController *vc = self.topViewController;
    
    [super pushViewController:viewController animated:animated];
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = nil;
    }
    
    BOOL navigationBarHidden_New = NO;
    
    if ([vc isKindOfClass:[UIBaseViewController class]]) {
        UIBaseViewController *base = (UIBaseViewController*)vc;
        navigationBarHidden_New = base.navigationBarHidden_New;
    }
    
    if ([viewController isKindOfClass:[UIBaseViewController class]]) {
        UIBaseViewController *base = (UIBaseViewController*)viewController;
        base.navigationBarHidden_Old = navigationBarHidden_New;
    }
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    //从vcB返回到vcA
    UIViewController *vcB = [super popViewControllerAnimated:animated];
    UIViewController *vcA = self.topViewController;
    
    BOOL navigationBarHidden_New = NO;
    
    if ([vcB isKindOfClass:[UIBaseViewController class]]) {
        UIBaseViewController* base = (UIBaseViewController*)vcB;
        navigationBarHidden_New = base.navigationBarHidden_New;
    }
    
    if ([vcA isKindOfClass:[UIBaseViewController class]]) {
        UIBaseViewController *base = (UIBaseViewController*)vcA;
        base.navigationBarHidden_Old = navigationBarHidden_New;
    }
    
    return vcB;
}

@end
