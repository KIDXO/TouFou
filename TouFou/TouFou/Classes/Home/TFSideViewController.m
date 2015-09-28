//
//  TFSideViewController.m
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFSideViewController.h"
#import "TFSettingViewController.h"
#import "AppDelegate.h"

@interface TFSideViewController ()

@end

@implementation TFSideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)actionDrawer:(id)sender
{
    AppDelegate *app = [AppDelegate sharedAppDelegate];
    TFSettingViewController *vc = [[TFSettingViewController alloc] initWithNibName:@"TFSettingViewController" bundle:nil];
    [app.vcHome.navigationController pushViewController:vc animated:NO];
    [app actionDrawerClose:YES];
}

@end
