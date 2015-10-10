//
//  TFMineFansViewController.m
//  TouFou
//
//  Created by KID on 15/10/9.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFMineFansViewController.h"
#import "TFMineFansTableViewCell.h"

static NSString *strIdentifier = @"TFMineFansTableViewCell";

@interface TFMineFansViewController ()
{
    UILabel *labConut;
}

@end

@implementation TFMineFansViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (_style == TFMinePeopleStyleFans) {
        [self setTitle:@"我的粉丝"];
        [self setTitleCustom:@"我的粉丝"];
    }
    else if (_style == TFMinePeopleStyleFollow) {
        [self setTitle:@"我的关注"];
        [self setTitleCustom:@"我的关注"];
    }
    [self createReturnButton];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TFMineFansTableViewCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark TableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (!labConut) {
        labConut = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.width, 44)];
        labConut.text = @"20 人";
        labConut.textColor = TFColor_Main;
        labConut.textAlignment = NSTextAlignmentCenter;
        labConut.font = [UIFont systemFontOfSize:15];
        labConut.backgroundColor = [UIColor clearColor];
    }
    return labConut;
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
    TFMineFansTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
