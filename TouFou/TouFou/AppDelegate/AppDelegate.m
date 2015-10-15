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

#pragma mark - LifeCycle
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.drawerViewController;
    
    [self initViewController];
    [self initNotification];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{

}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    
}

#pragma mark - Scheme
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return YES;
}

#pragma mark - Notification
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    
}

#pragma mark - Initialization
- (void)initNotification
{
    [TFNotificationCenter addObserver:self
                             selector:@selector(pushInfoViewController:)
                                 name:TFNotificationInfo
                               object:nil];
}

#pragma mark - VCManager
- (void)pushInfoViewController:(NSNotification *)noti
{
//    NSString* userId = noti.object;
    [TFVCManager pushInfo:nil animated:YES];
}

#pragma mark - ViewController
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

#pragma mark - Action
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

#pragma mark - Delegate
+ (AppDelegate *)sharedAppDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

@end
