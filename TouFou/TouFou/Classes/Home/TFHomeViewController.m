//
//  TFHomeViewController.m
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFHomeViewController.h"
#import "AppDelegate.h"

@interface TFHomeViewController ()

@end

@implementation TFHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"投否"];
    [self setTitleCustom:@"投否首页"];
    [self createReturnButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)createReturnButton
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.layer.cornerRadius = 15;
    btn.layer.masksToBounds = true;
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(0, 0, 30, 30);
    [btn addTarget:self action:@selector(actionDrawer:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = item;
}

- (IBAction)actionDrawer:(id)sender
{
    [[AppDelegate sharedAppDelegate] actionDrawer:YES];
}

@end
