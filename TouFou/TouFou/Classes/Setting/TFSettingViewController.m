//
//  TFSettingViewController.m
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFSettingViewController.h"

@interface TFSettingViewController ()

@end

@implementation TFSettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"设置"];
    [self setTitleCustom:@"设置页面"];
    [self createReturnButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)actionSwitchChange:(UISwitch *)sender
{
    if (sender.isOn)
    {
    }
    else
    {
    }
}

#pragma mark -
#pragma mark TableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 4) {
        return 100;
    }
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return TFHeightSeparator;
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
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 2;
            break;
        case 3:
            return 1;
            break;
        case 4:
            return 1;
            break;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            static NSString *strIdentifier1 = @"UITableViewCell1";
            cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier1];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:strIdentifier1];
                cell.textLabel.text = @"推送通知";
                UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
                switchView.onTintColor = TFColor_Button;
                [switchView addTarget:self action:@selector(actionSwitchChange:) forControlEvents:UIControlEventValueChanged];
                cell.accessoryView = switchView;
            }
        }
    }
    else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            static NSString *strIdentifier2 = @"UITableViewCell2";
            cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier2];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:strIdentifier2];
                cell.textLabel.text = @"清除缓存";
                cell.detailTextLabel.text = @"81.5MB";
            }
        }
    }
    else if (indexPath.section == 2) {
        static NSString *strIdentifier3 = @"UITableViewCell3";
        if (indexPath.row == 0) {
            cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier3];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:strIdentifier3];
                cell.textLabel.text = @"意见反馈";
            }
        }
        else if (indexPath.row == 1) {
            cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier3];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:strIdentifier3];
                cell.textLabel.text = @"App Store 评分";
            }
        }
    }
    else if (indexPath.section == 3) {
        static NSString *strIdentifier3 = @"UITableViewCell3";
        if (indexPath.row == 0) {
            cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier3];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:strIdentifier3];
                cell.textLabel.text = @"关于我们";
            }
        }
    }
    else if (indexPath.section == 4) {
        static NSString *strIdentifier4 = @"UITableViewCell4";
        if (indexPath.row == 0) {
            cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier4];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strIdentifier4];
                cell.textLabel.text = @"退  出  登  录";
                cell.textLabel.textAlignment = NSTextAlignmentCenter;
                cell.textLabel.textColor = TFColor_Button;
            }
        }
    }
    else {
        static NSString *strIdentifier = @"UITableViewCell";
        cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strIdentifier];
        }
    }
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
