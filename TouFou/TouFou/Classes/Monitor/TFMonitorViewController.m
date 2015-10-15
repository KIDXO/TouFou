//
//  TFMonitorViewController.m
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFMonitorViewController.h"
#import "TFMonitorTableViewCell.h"
#import "UINavigationController+FDFullscreenPopGesture.h"

static NSString *strIdentifier = @"TFMonitorTableViewCell";

@interface TFMonitorViewController ()

@end

@implementation TFMonitorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"监控设置"];
    [self setTitleCustom:@"监控设置"];
    [self createReturnButton];
    [self setFd_interactivePopDisabled:YES];
    
    [self initView];
    [self initData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)initView
{
    [self.tableView registerNib:[UINib nibWithNibName:@"TFMonitorTableViewCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier];
}

- (void)initData
{
    self.aryRemind = [[NSMutableArray alloc] initWithCapacity:0];
}

- (void)actionAdding:(BOOL)show
{
    if (show) {
        [UIView animateWithDuration:TFAnimate animations:^{
            _viewAdding.origin = CGPointMake(0, self.view.height - _viewAdding.height);
        }];
    }
    else {
        [UIView animateWithDuration:TFAnimate animations:^{
            _viewAdding.origin = CGPointMake(0, self.view.height);
        }];
    }
}

- (IBAction)actionAddingClose:(id)sender
{
    [self actionAdding:NO];
}

- (IBAction)actionAddingConfirm:(id)sender
{
    if (_aryRemind) {
        [_aryRemind addObject:_datePicker.date];
        [_tableView reloadSections:[NSIndexSet indexSetWithIndex:3]
                  withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    [self actionAdding:NO];
}

- (void)actionSwitchChange:(UISwitch *)sender
{
    
}

#pragma mark -
#pragma mark TableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 ||
        indexPath.section == 1) {
        return 150;
    }
    else {
        return 44;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0 ||
        section == 1 ||
        section == 3) {
        return 10;
    }
    else {
        return 70;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return TFHeightSeparator;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor clearColor];
        
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, TFWidth - 20, 40)];
        lab.font = [UIFont systemFontOfSize:13];
        lab.text = @"如不适应频繁推送，建议您开启时间点推送，我们将在您设定的时间点，为您推送过往12小时平台内符合您预期的项目合集";
        lab.textColor = TFColor_Text_Light;
        lab.numberOfLines = 2;
        
        [view addSubview:lab];
        return view;
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if (section == 1) {
        return 1;
    }
    else if (section == 2) {
        return 1;
    }
    else if (section == 3) {
        return _aryRemind.count;
    }
    else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        TFMonitorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier];
        [cell setStyle:TFMonitorStyleMoney];
        return cell;
    }
    else if (indexPath.section == 1) {
        TFMonitorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier];
        [cell setStyle:TFMonitorStyleComplete];
        return cell;
    }
    else if (indexPath.section == 2) {
        static NSString *strIdentifier1 = @"UITableViewCell1";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier1];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strIdentifier1];
            cell.textLabel.text = @"添  加  提  醒";
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.textColor = TFColor_Button;
            cell.textLabel.font = [UIFont systemFontOfSize:15];
        }
        return cell;
    }
    else if (indexPath.section == 3) {
        static NSString *strIdentifier2 = @"UITableViewCell2";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier2];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:strIdentifier2];
            NSDate *date = _aryRemind[indexPath.row];
            cell.textLabel.text = [date shortTimeString];
            cell.tag = indexPath.row;
            UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
            switchView.on = YES;
            switchView.onTintColor = TFColor_Button;
            switchView.tag = indexPath.row;
            [switchView addTarget:self action:@selector(actionSwitchChange:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView = switchView;
        }
        return cell;
    }
    else {
        return nil;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2) {
        [self actionAdding:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 3) {
        return YES;
    }
    return NO;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
    }
}

@end
