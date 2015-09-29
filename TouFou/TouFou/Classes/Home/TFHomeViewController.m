//
//  TFHomeViewController.m
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFHomeViewController.h"
#import "TFHomeTableViewCell.h"
#import "AppDelegate.h"

static NSString *strIdentifier = @"TFHomeTableViewCell";

@interface TFHomeViewController ()

@end

@implementation TFHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"投否"];
    [self setTitleCustom:@"投否首页"];
    [self createReturnButton];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TFHomeTableViewCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier];
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
    [btn addTarget:self action:@selector(actionDrawer) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)actionDrawer
{
    [[AppDelegate sharedAppDelegate] actionDrawer:YES];
}

#pragma mark -
#pragma mark TableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TFHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

@end
