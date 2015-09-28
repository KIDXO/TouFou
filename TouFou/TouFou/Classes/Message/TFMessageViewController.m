//
//  TFMessageViewController.m
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFMessageViewController.h"

@interface TFMessageViewController ()

@end

@implementation TFMessageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"消息"];
    [self setTitleCustom:@"消息页面"];
    [self createReturnButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
