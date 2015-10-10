//
//  TFSideViewController.m
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFSideViewController.h"
#import "TFSideTableViewCell.h"
#import "TFMineViewController.h"
#import "TFMineFansViewController.h"
#import "TFMineProjectViewController.h"
#import "TFAnalystViewController.h"
#import "TFMessageViewController.h"
#import "TFMonitorViewController.h"
#import "TFAgreementViewController.h"
#import "TFSettingViewController.h"
#import "AppDelegate.h"

static NSString *strIdentifier = @"TFSideTableViewCell";

@interface TFSideViewController ()

@end

@implementation TFSideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initView];
    [self initData];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TFSideTableViewCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)initView
{
    _imgHead.layer.cornerRadius = _imgHead.height / 2;
    _imgHead.layer.masksToBounds = true;
}

- (void)initData
{
    _labName.text = @"哈利路亚";
    _labAbout.text = @"哦哈哦哈哦哈哦哈哦哈哦哈哦哈哦哈哦哈哦哈哦哈哦哈";
    _labProject.text = @"8242";
    _labFollow.text = @"1354";
    _labFans.text = @"2521";
}

- (IBAction)actionMine:(id)sender
{
    AppDelegate *app = [AppDelegate sharedAppDelegate];
    UIViewController *vc = [[TFMineViewController alloc] initWithNibName:@"TFMineViewController" bundle:nil];
    [app.vcHome.navigationController pushViewController:vc animated:NO];
    [app actionDrawerClose:YES];
}

- (IBAction)actionView:(UIButton *)sender
{
    AppDelegate *app = [AppDelegate sharedAppDelegate];
    UIViewController *viewController = nil;
    switch (sender.tag) {
        case 1:
        {
            TFMineProjectViewController *vc = [[TFMineProjectViewController alloc] initWithNibName:@"TFMineProjectViewController" bundle:nil];
            vc.style = TFMineProjectStyleFavorite;
            viewController = vc;
        }
            break;
        case 2:
        {
            TFMineFansViewController *vc = [[TFMineFansViewController alloc] initWithNibName:@"TFMineFansViewController" bundle:nil];
            vc.style = TFMinePeopleStyleFollow;
            viewController = vc;
        }
            break;
        case 3:
        {
            TFMineFansViewController *vc = [[TFMineFansViewController alloc] initWithNibName:@"TFMineFansViewController" bundle:nil];
            vc.style = TFMinePeopleStyleFans;
            viewController = vc;
        }
            break;
        default:
            break;
    }
    [app.vcHome.navigationController pushViewController:viewController animated:NO];
    [app actionDrawerClose:YES];
}

#pragma mark -
#pragma mark TableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 0.5;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        UIView *view = [[UIView alloc] init];
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(20, 0, tableView.width - 20, 0.5)];
        line.backgroundColor = TFColor_Separator;
        [view addSubview:line];
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 4;
    }
    else if (section == 1) {
        return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TFSideTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier];
    [cell setIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *app = [AppDelegate sharedAppDelegate];
    UIViewController *vc = nil;
    if (indexPath.section == 0)
    {
        switch (indexPath.row)
        {
            case 0:
            {
                vc = [[TFAnalystViewController alloc] initWithNibName:@"TFAnalystViewController" bundle:nil];
            }
                break;
            case 1:
            {
                vc = [[TFMessageViewController alloc] initWithNibName:@"TFMessageViewController" bundle:nil];
            }
                break;
            case 2:
            {
                vc = [[TFMonitorViewController alloc] initWithNibName:@"TFMonitorViewController" bundle:nil];
            }
                break;
            case 3:
            {
                vc = [[TFAgreementViewController alloc] initWithNibName:@"TFAgreementViewController" bundle:nil];
            }
                break;
            default:
                break;
        }
    }
    else if (indexPath.section == 1)
    {
        vc = [[TFSettingViewController alloc] initWithNibName:@"TFSettingViewController" bundle:nil];
    }
    if (vc) {
        [app.vcHome.navigationController pushViewController:vc animated:NO];
        [app actionDrawerClose:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
