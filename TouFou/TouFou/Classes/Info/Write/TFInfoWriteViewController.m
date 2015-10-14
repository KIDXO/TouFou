//
//  TFInfoWriteViewController.m
//  TouFou
//
//  Created by KID on 15/10/13.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFInfoWriteViewController.h"

@interface TFInfoWriteViewController ()

@end

@implementation TFInfoWriteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"撰写点评"];
    [self setTitleCustom:@"撰写点评"];
    [self createReturnButton];
    [self createCustomButton:@"发布" target:self action:@selector(actionSubmit)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)actionSubmit
{
    
}

@end
