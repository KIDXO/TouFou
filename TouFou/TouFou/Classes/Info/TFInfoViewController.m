//
//  TFInfoViewController.m
//  TouFou
//
//  Created by KID on 15/10/11.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFInfoViewController.h"

@interface TFInfoViewController ()

@end

@implementation TFInfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"项目详情"];
    [self setTitleCustom:@"项目详情"];
    [self createReturnButton];
    [self createCustomButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)createCustomButton
{
    CGRect frame = CGRectZero;
    UIImage *image = [UIImage imageNamed:@"UINavFavorite"];
    frame.size = image.size;
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setFrame:frame];
    [btn1 setImage:image forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"UINavFavorited"] forState:UIControlStateSelected];
    [btn1 addTarget:self action:@selector(actionFavorite:) forControlEvents:UIControlEventTouchUpInside];
    
    image = [UIImage imageNamed:@"UINavShare"];
    frame.size = image.size;
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setFrame:frame];
    [btn2 setImage:image forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(actionShare:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:btn1];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    item2.width = 10;
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithCustomView:btn2];
    self.navigationItem.rightBarButtonItems = @[item3,item2,item1];
}

- (void)actionFavorite:(UIButton *)sender
{
    
}

- (void)actionShare:(UIButton *)sender
{
    
}

@end
