//
//  TFUserViewController.m
//  TouFou
//
//  Created by KID on 15/9/30.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFUserViewController.h"
#import "TFHomeTableViewCell.h"
#include <CoreText/CTFont.h>

static NSString *strIdentifier = @"TFHomeTableViewCell";

@interface TFUserViewController ()

@end

@implementation TFUserViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"分析师"];
    [self setTitleCustom:@"个人主页"];
    [self createReturnButton];
    [self initView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TFHomeTableViewCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [_viewSegment addSubview:self.controlSegment];
    [self.controlSegment setCount:@((arc4random()%10000)) forSegmentAtIndex:0];
    [self.controlSegment setCount:@((arc4random()%10000)) forSegmentAtIndex:1];
    [self.controlSegment setCount:@((arc4random()%10000)) forSegmentAtIndex:2];
    
    _scrollViewTable.height = self.view.height - _viewSegment.height;
    _scrollView.contentSize = CGSizeMake(0, _scrollView.height + _viewInfo.height);
}

- (void)initView
{
    _imgHead.layer.cornerRadius = _imgHead.height / 2;
    _imgHead.layer.masksToBounds = true;
    _btnFollow.layer.cornerRadius = 5;
    _btnFollow.layer.masksToBounds = true;
}

#pragma mark -
#pragma mark Segment
- (DZNSegmentedControl *)controlSegment
{
    if (!_controlSegment) {
        _controlSegment = [[DZNSegmentedControl alloc] initWithItems:@[@"发布的点评", @"收藏的点评", @"收藏的项目"]];
        _controlSegment.delegate = self;
        _controlSegment.selectedSegmentIndex = 1;
        _controlSegment.bouncySelectionIndicator = NO;
        _controlSegment.autoAdjustSelectionIndicatorWidth = YES;
        _controlSegment.height = _viewSegment.height;
        _controlSegment.width = _viewSegment.width;
        _controlSegment.titleColor = TFColor_Text_Light;
        _controlSegment.countColor = TFColor_Text_Light;
        _controlSegment.selectionIndicatorColor = TFColor_Button;
        _controlSegment.backgroundColor = [UIColor clearColor];
        _controlSegment.tintColor = TFColor_Main;
        _controlSegment.hairlineColor = [UIColor clearColor];
        _controlSegment.adjustsFontSizeToFitWidth = YES;
        _controlSegment.selectionIndicatorHeight = 3.0;
        [_controlSegment addTarget:self action:@selector(actionSegmentChange:)
                  forControlEvents:UIControlEventValueChanged];
    }
    return _controlSegment;
}

- (void)actionSegmentChange:(id)sender
{
    
}

- (UIBarPosition)positionForBar:(id <UIBarPositioning>)view
{
    return UIBarPositionBottom;
}

#pragma mark -
#pragma mark TableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 250;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
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
    TFHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
