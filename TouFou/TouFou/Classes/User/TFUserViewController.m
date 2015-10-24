//
//  TFUserViewController.m
//  TouFou
//
//  Created by KID on 15/9/30.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFUserViewController.h"

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
}

- (void)initView
{
    _imgHead.layer.cornerRadius = _imgHead.height / 2;
    _imgHead.layer.masksToBounds = true;
    _btnFollow.layer.cornerRadius = 5;
    _btnFollow.layer.masksToBounds = true;
    
    _tableView1.delegate = self;
    _tableView2.delegate = self;
    _tableView3.delegate = self;
    _tableView1.style = TFUserTableStyleRelease;
    _tableView2.style = TFUserTableStyleComment;
    _tableView3.style = TFUserTableStyleFavorite;
    
    _scrollViewTable.contentSize = CGSizeMake(TFWidth * 3, 0);
}

#pragma mark -
#pragma mark Segment
- (DZNSegmentedControl *)controlSegment
{
    if (!_controlSegment) {
        _controlSegment = [[DZNSegmentedControl alloc] initWithItems:@[@"发布的点评", @"收藏的点评", @"收藏的项目"]];
        _controlSegment.delegate = self;
        _controlSegment.height = _viewSegment.height;
        _controlSegment.width = _viewSegment.width;
        _controlSegment.selectedSegmentIndex = 0;
        _controlSegment.bouncySelectionIndicator = NO;
        _controlSegment.autoAdjustSelectionIndicatorWidth = YES;
        _controlSegment.titleColor = TFColor_Text_Light;
        _controlSegment.countColor = TFColor_Text_Light;
        _controlSegment.selectionIndicatorColor = TFColor_Button;
        _controlSegment.tintColor = TFColor_Text_Dark;
        _controlSegment.backgroundColor = [UIColor clearColor];
        _controlSegment.hairlineColor = [UIColor clearColor];
        _controlSegment.adjustsFontSizeToFitWidth = YES;
        _controlSegment.selectionIndicatorHeight = 3.0;
        [_controlSegment addTarget:self action:@selector(actionSegmentChange:)
                  forControlEvents:UIControlEventValueChanged];
    }
    return _controlSegment;
}

- (void)actionSegmentChange:(DZNSegmentedControl *)sender
{
    [_scrollViewTable setContentOffset:CGPointMake(TFWidth * sender.selectedSegmentIndex, 0)
                              animated:YES];
}

- (UIBarPosition)positionForBar:(id <UIBarPositioning>)view
{
    return UIBarPositionBottom;
}

#pragma mark -
#pragma mark ScrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _scrollViewTable) {
        
        CGFloat width = scrollView.frame.size.width;
        int index = floor((scrollView.contentOffset.x - width / 2) / width) + 1;
        [_controlSegment setSelectedSegmentIndex:index animated:YES];
        
        CGFloat height = TFHeight - TFHeightHead - TFHeightStatusBar;
        switch (index) {
            case 0: {
                if (_tableView1.tableView.contentOffset.y > _tableView1.tableView.contentSize.height - _viewInfo.height - _viewSegment.height) {
                    if (_tableView1.tableView.contentSize.height - height > _viewInfo.height) {
                        _tableView1.tableView.contentOffset = CGPointMake(0, _tableView1.tableView.contentSize.height - height);
                    }
                    else {
                        if (_viewSegment.origin.y == 0) {
                            _tableView1.tableView.contentOffset = CGPointMake(0, _viewInfo.height);
                        }
                    }
                }
            }
                break;
            case 1: {
                if (_tableView2.tableView.contentOffset.y > _tableView2.tableView.contentSize.height - _viewInfo.height - _viewSegment.height) {
                    if (_tableView2.tableView.contentSize.height - height > _viewInfo.height) {
                        _tableView2.tableView.contentOffset = CGPointMake(0, _tableView2.tableView.contentSize.height - height);
                    }
                    else {
                        if (_viewSegment.origin.y == 0) {
                            _tableView2.tableView.contentOffset = CGPointMake(0, _viewInfo.height);
                        }
                    }
                }
            }
                break;
            case 2: {
                if (_tableView3.tableView.contentOffset.y > _tableView3.tableView.contentSize.height - _viewInfo.height - _viewSegment.height) {
                    if (_tableView3.tableView.contentSize.height - height > _viewInfo.height) {
                        _tableView3.tableView.contentOffset = CGPointMake(0, _tableView3.tableView.contentSize.height - height);
                    }
                    else {
                        if (_viewSegment.origin.y == 0) {
                            _tableView3.tableView.contentOffset = CGPointMake(0, _viewInfo.height);
                        }
                    }
                }
            }
                break;
            default:
                break;
        }
    }
}

- (void)TFUserTableView:(UIScrollView *)scrollView
{
    CGFloat y = scrollView.contentOffset.y;
    if (y < _viewInfo.height) {
        _viewSegment.origin = CGPointMake(0, _viewInfo.height - y);
        _viewInfo.origin = CGPointMake(0, - y);
    }
    else {
        if (_viewSegment.origin.y > 0) {
            _viewSegment.origin = CGPointMake(0, _viewInfo.height - y);
            _viewInfo.origin = CGPointMake(0, - y);
        }
        else {
            _viewSegment.origin = CGPointMake(0, 0);
            _viewInfo.origin = CGPointMake(0, - _viewInfo.height);
        }
    }
    _tableView1.tableView.contentOffset = CGPointMake(0, y);
    _tableView2.tableView.contentOffset = CGPointMake(0, y);
    _tableView3.tableView.contentOffset = CGPointMake(0, y);
}

@end
