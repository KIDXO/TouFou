//
//  TFDashboardViewController.m
//  TouFou
//
//  Created by KID on 15/10/21.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFDashboardViewController.h"
#import "TFVerifyViewController.h"
#import "TFLoginViewController.h"

@interface TFDashboardViewController ()

@end

@implementation TFDashboardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setFd_prefersNavigationBarHidden:YES];
    
    [self setTitle:@"登录注册"];
    [self setTitleCustom:@"登录注册"];
    
    [self initView];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    _btnRegist.imageEdgeInsets = UIEdgeInsetsMake(0, _btnRegist.width - 30, 0, 0);
    _btnLogin.imageEdgeInsets = UIEdgeInsetsMake(0, _btnLogin.width - 30, 0, 0);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Initialization
- (void)initView
{
    _btnRegist.layer.cornerRadius = _btnRegist.height / 2;
    _btnRegist.layer.masksToBounds = true;
    
    _btnLogin.layer.cornerRadius = _btnLogin.height / 2;
    _btnLogin.layer.masksToBounds = true;
    _btnLogin.layer.borderWidth = 0.5;
    _btnLogin.layer.borderColor = TFColor_Button.CGColor;
}

#pragma mark -
#pragma mark Action
- (IBAction)actionRegist:(id)sender
{
    TFVerifyViewController *vc = [[TFVerifyViewController alloc] initWithNibName:@"TFVerifyViewController" bundle:nil];
    vc.type = TFVerifyTypeRegist;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)actionLogin:(id)sender
{
    TFLoginViewController *vc = [[TFLoginViewController alloc] initWithNibName:@"TFLoginViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
