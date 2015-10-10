//
//  TFMineViewController.m
//  TouFou
//
//  Created by KID on 15/9/29.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFMineViewController.h"
#import "TFMineEditViewController.h"
#import "TFMineFansViewController.h"
#import "TFMineDraftViewController.h"
#import "TFMineProjectViewController.h"
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
        return cell;
    }
    else {
        TFMineMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier2];
        [cell setIndexPath:indexPath];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
            {
                TFMineFansViewController *vc = [[TFMineFansViewController alloc] initWithNibName:@"TFMineFansViewController" bundle:nil];
                vc.style = TFMinePeopleStyleFollow;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 1:
            {
                TFMineFansViewController *vc = [[TFMineFansViewController alloc] initWithNibName:@"TFMineFansViewController" bundle:nil];
                vc.style = TFMinePeopleStyleFans;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 2:
            {
                TFMineProjectViewController *vc = [[TFMineProjectViewController alloc] initWithNibName:@"TFMineProjectViewController" bundle:nil];
                vc.style = TFMineProjectStyleRelease;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 3:
            {
                TFMineProjectViewController *vc = [[TFMineProjectViewController alloc] initWithNibName:@"TFMineProjectViewController" bundle:nil];
                vc.style = TFMineProjectStyleFavorite;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 4:
            {
                TFMineProjectViewController *vc = [[TFMineProjectViewController alloc] initWithNibName:@"TFMineProjectViewController" bundle:nil];
                vc.style = TFMineProjectStyleComment;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 5:
            {
                TFMineDraftViewController *vc = [[TFMineDraftViewController alloc] initWithNibName:@"TFMineDraftViewController" bundle:nil];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            default:
                break;
        }
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
