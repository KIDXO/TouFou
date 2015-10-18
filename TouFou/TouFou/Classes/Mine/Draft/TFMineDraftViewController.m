//
//  TFMineDraftViewController.m
//  TouFou
//
//  Created by KID on 15/10/9.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFMineDraftViewController.h"
#import "TFMineDraftTableViewCell.h"
#import "TFInfoWriteViewController.h"

static NSString *strIdentifier = @"TFMineDraftTableViewCell";

@interface TFMineDraftViewController ()

@end

@implementation TFMineDraftViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"我的草稿"];
    [self setTitleCustom:@"我的草稿"];
    [self createReturnButton];
    [self createCustomButton:@"编辑" target:self action:@selector(actionEdit)];
    
    [self initView];
    [self initData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)initData
{
    self.aryListSelect = [[NSMutableArray alloc] initWithCapacity:0];
}

- (void)initView
{
    [self.tableView registerNib:[UINib nibWithNibName:@"TFMineDraftTableViewCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier];
}

- (void)actionEdit
{
    if (_tableView.editing) {
        _tableView.editing = NO;
    }
    [self.tableView setEditing:YES animated:YES];
    [self createCustomButton:@"取消" target:self action:@selector(actionEditCancel)];
    [UIView animateWithDuration:TFAnimate animations:^{
        _viewAction.origin = CGPointMake(0, self.view.height - _viewAction.height);
        _tableView.height = self.view.height - _viewAction.height;
    }];
}

- (void)actionEditCancel
{
    [self.aryListSelect removeAllObjects];
    [self.tableView setEditing:NO animated:YES];
    [self createCustomButton:@"编辑" target:self action:@selector(actionEdit)];
    [UIView animateWithDuration:TFAnimate animations:^{
        _viewAction.origin = CGPointMake(0, self.view.height);
        _tableView.height = self.view.height;
    }];
}

- (IBAction)actionSelectAll:(id)sender
{
    if (self.aryListSelect.count == 20) {
        for (int i = 0; i < 20; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            [self.aryListSelect removeObject:indexPath];
            [_tableView deselectRowAtIndexPath:indexPath animated:YES];
        }
    }
    else {
        [self.aryListSelect removeAllObjects];
        for (int i = 0; i < 20; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            [self.aryListSelect addObject:indexPath];
            [_tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        }
    }
}

- (IBAction)actionSelectDelete:(id)sender
{
    TFLog(@"%@",self.aryListSelect);
}

#pragma mark -
#pragma mark TableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
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
    TFMineDraftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.editing) {
        [self.aryListSelect addObject:indexPath];
    }
    else {
        TFInfoWriteViewController *vc = [[TFInfoWriteViewController alloc] initWithNibName:@"TFInfoWriteViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.editing) {
        [self.aryListSelect removeObject:indexPath];
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.editing) {
        return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
    }
    else {
        return UITableViewCellEditingStyleDelete;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
    }
}

@end
