//
//  TFVCManager.m
//  TouFou
//
//  Created by KID on 15/10/11.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFVCManager.h"
#import "AppDelegate.h"
#import "TFInfoViewController.h"

@implementation TFVCManager

+ (void)pushInfo:(id)params animated:(BOOL)animated
{
    AppDelegate *app = [AppDelegate sharedAppDelegate];
    TFInfoViewController *vc = [[TFInfoViewController alloc] initWithNibName:@"TFInfoViewController" bundle:nil];
    [app.vcHome.navigationController pushViewController:vc animated:animated];
    [app actionDrawerClose:YES];
}

@end
