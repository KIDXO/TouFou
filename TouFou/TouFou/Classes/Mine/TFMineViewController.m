//
//  TFMineViewController.m
//  TouFou
//
//  Created by KID on 15/9/29.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFMineViewController.h"
#import "TFMineEditViewController.h"
#import "TFMineHeadTableViewCell.h"
#import "TFMineMenuTableViewCell.h"

static NSString *strIdentifier1 = @"TFMineHeadTableViewCell";
static NSString *strIdentifier2 = @"TFMineMenuTableViewCell";

@interface TFMineViewController ()

@end

@implementation TFMineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"个人主页"];
    [self setTitleCustom:@"我的主页"];
    [self createReturnButton];
    [self createCustomButton:@"修改" target:self action:@selector(actionEdit)];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TFMineHeadTableViewCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier1];
    [self.tableView registerNib:[UINib nibWithNibName:@"TFMineMenuTableViewCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)actionEdit
{
    TFMineEditViewController *vc = [[TFMineEditViewController alloc] initWithNibName:@"TFMineEditViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -
#pragma mark TableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 190;
    }
    else if (indexPath.section == 1) {
        return 44;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.5;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 10;
    }
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if (section == 1) {
        return 6;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        TFMineHeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier1];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else {
        TFMineMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier2];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell setIndexPath:indexPath];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
