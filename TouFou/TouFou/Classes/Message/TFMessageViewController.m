//
//  TFMessageViewController.m
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFMessageViewController.h"
#import "TFMessageCommentViewController.h"
#import "TFMessageGoodViewController.h"
#import "TFMessagePushViewController.h"
#import "TFMessageUpdateViewController.h"
#import "TFMessageTableViewCell.h"

static NSString *strIdentifier = @"TFMessageTableViewCell";

@interface TFMessageViewController ()

@end

@implementation TFMessageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"消息"];
    [self setTitleCustom:@"消息页面"];
    [self createReturnButton];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TFMessageTableViewCell" bundle:nil]
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
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
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
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TFMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [cell setIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        TFMessageCommentViewController *vc = [[TFMessageCommentViewController alloc] initWithNibName:@"TFMessageCommentViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 1) {
        TFMessageGoodViewController *vc = [[TFMessageGoodViewController alloc] initWithNibName:@"TFMessageGoodViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 2) {
        TFMessagePushViewController *vc = [[TFMessagePushViewController alloc] initWithNibName:@"TFMessagePushViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 3) {
        TFMessageUpdateViewController *vc = [[TFMessageUpdateViewController alloc] initWithNibName:@"TFMessageUpdateViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
