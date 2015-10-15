//
//  TFAnalystViewController.m
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFAnalystViewController.h"
#import "TFAnalystTableViewCell.h"
#import "TFUserViewController.h"

static NSString *strIdentifier = @"TFAnalystTableViewCell";

@interface TFAnalystViewController ()

@end

@implementation TFAnalystViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"入驻分析师"];
    [self setTitleCustom:@"分析师列表"];
    [self createReturnButton];
    [self createCustomButton:@"申请" target:self action:@selector(actionApply)];
    
    [self initView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)initView
{
    [self.tableView registerNib:[UINib nibWithNibName:@"TFAnalystTableViewCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier];
}

- (void)actionApply
{
    
}

#pragma mark -
#pragma mark TableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
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
    TFAnalystTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TFUserViewController *vc = [[TFUserViewController alloc] initWithNibName:@"TFUserViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
