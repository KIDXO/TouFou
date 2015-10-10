//
//  TFMineEditViewController.m
//  TouFou
//
//  Created by KID on 15/9/30.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFMineEditViewController.h"
#import "TFMineEditHeadTableViewCell.h"
#import "TFMineMenuHeadTableViewCell.h"

static NSString *strIdentifier1 = @"TFMineEditHeadTableViewCell";
static NSString *strIdentifier2 = @"TFMineMenuHeadTableViewCell";

@interface TFMineEditViewController ()

@end

@implementation TFMineEditViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"个人信息"];
    [self setTitleCustom:@"我的信息"];
    [self createReturnButton];
    [self createCustomButton:@"保存" target:self action:@selector(actionSave)];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TFMineEditHeadTableViewCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier1];
    [self.tableView registerNib:[UINib nibWithNibName:@"TFMineMenuHeadTableViewCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)actionSave
{

}

#pragma mark -
#pragma mark TableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 135;
    }
    else if (indexPath.section == 1) {
        if (indexPath.row == 3) {
            return 132;
        }
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
        return 4;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        TFMineEditHeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier1];
        return cell;
    }
    else {
        TFMineMenuHeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier2];
        [cell setIndexPath:indexPath tableView:tableView];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
