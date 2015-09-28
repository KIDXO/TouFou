//
//  AppDelegate.h
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JVFloatingDrawerViewController.h"
#import "JVFloatingDrawerSpringAnimator.h"
#import "TFHomeViewController.h"
#import "TFSideViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;

@property (nonatomic, strong) JVFloatingDrawerViewController *drawerViewController;
@property (nonatomic, strong) JVFloatingDrawerSpringAnimator *drawerAnimator;

@property (nonatomic, strong) UIViewController *vcHome;
@property (nonatomic, strong) UIViewController *vcSide;

+ (AppDelegate *)sharedAppDelegate;

- (void)actionDrawer:(BOOL)animated;
- (void)actionDrawerClose:(BOOL)animated;

@end

