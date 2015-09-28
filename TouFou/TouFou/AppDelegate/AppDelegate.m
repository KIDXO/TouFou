//
//  AppDelegate.m
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.drawerViewController;
    [self initViewController];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - 视图
- (JVFloatingDrawerViewController *)drawerViewController
{
    if (!_drawerViewController) {
         _drawerViewController = [[JVFloatingDrawerViewController alloc] init];
    }
    return _drawerViewController;
}

- (JVFloatingDrawerSpringAnimator *)drawerAnimator
{
    if (!_drawerAnimator) {
         _drawerAnimator = [[JVFloatingDrawerSpringAnimator alloc] init];
         _drawerAnimator.animationDelay = 0.0;
         _drawerAnimator.animationDuration = 0.5;
         _drawerAnimator.initialSpringVelocity = 9.0;
         _drawerAnimator.springDamping = 1;
    }
    return _drawerAnimator;
}

- (UIViewController *)vcHome
{
    if (!_vcHome) {
         _vcHome = [[TFHomeViewController alloc] initWithNibName:@"TFHomeViewController" bundle:nil];
    }
    return _vcHome;
}

- (UIViewController *)vcSide
{
    if (!_vcSide) {
         _vcSide = [[TFSideViewController alloc] initWithNibName:@"TFSideViewController" bundle:nil];
    }
    return _vcSide;
}

- (void)initViewController
{
    UIBaseNavigationController *nav = [[UIBaseNavigationController alloc] initWithRootViewController:self.vcHome];
    self.drawerViewController.centerViewController = nav;
    self.drawerViewController.leftViewController = self.vcSide;
    self.drawerViewController.animator = self.drawerAnimator;
    self.drawerViewController.backgroundImage = [UIImage imageNamed:@"TFHomeBG"];
}

#pragma mark - 操作
- (void)actionDrawer:(BOOL)animated
{
    [self.drawerViewController toggleDrawerWithSide:JVFloatingDrawerSideLeft
                                           animated:animated
                                         completion:nil];
}

- (void)actionDrawerClose:(BOOL)animated
{
    [self.drawerViewController closeDrawerWithSide:JVFloatingDrawerSideLeft
                                          animated:animated
                                        completion:nil];
}

#pragma mark - 代理
+ (AppDelegate *)sharedAppDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

@end
