//
//  TFMessagePushViewController.m
//  TouFou
//
//  Created by KID on 15/10/10.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFMessagePushViewController.h"
#import "TFMessagePushListViewController.h"
#import "TFMessagePushTableViewCell.h"

static NSString *strIdentifier = @"TFMessagePushTableViewCell";

@interface TFMessagePushViewController ()

@end

@implementation TFMessagePushViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"监控通知"];
    [self setTitleCustom:@"监控通知"];
    [self createReturnButton];
    
    [self initView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)initView
{
    [self.tableView registerNib:[UINib nibWithNibName:@"TFMessagePushTableViewCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier];
}

#pragma mark -
#pragma mark TableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
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
    TFMessagePushTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier];
    [cell setInfo];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TFMessagePushListViewController *vc = [[TFMessagePushListViewController alloc] initWithNibName:@"TFMessagePushListViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -
#pragma mark ScrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _tableView) {
        for (TFMessagePushTableViewCell *cell in _tableView.visibleCells)
            [cell setParallax:_tableView view:self.view];
    }
}

@end
