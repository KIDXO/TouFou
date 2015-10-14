//
//  TFInfoViewController.m
//  TouFou
//
//  Created by KID on 15/10/11.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFInfoViewController.h"
#import "TFInfoWriteViewController.h"

#define  TFTableViewBottom  (_labTitle.height + 260 - 35)
#define  TFTableViewNoneY   (TFHeight - TFHeightHead - TFHeightStatusBar - TFTableViewBottom - 150) / 2 + TFTableViewBottom + 10

@interface TFInfoViewController ()

@end

@implementation TFInfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"项目详情"];
    [self setTitleCustom:@"项目详情"];
    [self createReturnButton];
    [self createCustomButton];
    
    [self initView];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [_viewSegment addSubview:self.controlSegment];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)createCustomButton
{
    CGRect frame = CGRectZero;
    UIImage *image = [UIImage imageNamed:@"UINavFavorite"];
    frame.size = image.size;
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setFrame:frame];
    [btn1 setImage:image forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"UINavFavorited"] forState:UIControlStateSelected];
    [btn1 addTarget:self action:@selector(actionFavorite:) forControlEvents:UIControlEventTouchUpInside];
    
    image = [UIImage imageNamed:@"UINavShare"];
    frame.size = image.size;
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setFrame:frame];
    [btn2 setImage:image forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(actionShare:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:btn1];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    item2.width = 10;
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithCustomView:btn2];
    self.navigationItem.rightBarButtonItems = @[item3,item2,item1];
}

- (void)initView
{
    CGFloat height = [_labTitle.text heightWithFont:[UIFont systemFontOfSize:15]
                                 constrainedToWidth:TFWidth - 20];
    _labTitle.height = height;
    _viewLine.origin = CGPointMake(_viewLine.origin.x, _labTitle.origin.y + _labTitle.height + 10);
    _btnWrite.origin = CGPointMake(_btnWrite.origin.x, _viewLine.origin.y);
    _viewInfo.height = _btnWrite.origin.y + _btnWrite.height;
    _viewSegment.origin = CGPointMake(_viewSegment.origin.x, _viewInfo.origin.y + _viewInfo.height);
    
    _tableViewIntro.delegate = self;
    _tableViewScore.delegate = self;
    _tableViewAdvice.delegate = self;
    _tableViewComment.delegate = self;
    
    _tableViewIntro.heightHeader = TFTableViewBottom;
    _tableViewScore.heightHeader = TFTableViewBottom;
    _tableViewAdvice.heightHeader = TFTableViewBottom;
    _tableViewComment.heightHeader = TFTableViewBottom;
    
    _scrollViewTable.contentSize = CGSizeMake(TFWidth * 4, 0);
    
    if (!_imgCommentNone) {
         _imgCommentNone = [[UIImageView alloc] initWithFrame:CGRectMake((TFWidth - 150) / 2, TFTableViewNoneY, 150, 150)];
         _imgCommentNone.image = [UIImage imageNamed:@"TFProjectReplyNone"];
         _imgCommentNone.hidden = YES;
        [_tableViewComment addSubview:_imgCommentNone];
    }
}

- (void)actionFavorite:(UIButton *)sender
{
    
}

- (void)actionShare:(UIButton *)sender
{
    
}

- (IBAction)actionWrite:(UIButton *)sender
{
    TFInfoWriteViewController *vc = [[TFInfoWriteViewController alloc] initWithNibName:@"TFInfoWriteViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -
#pragma mark Segment
- (DZNSegmentedControl *)controlSegment
{
    if (!_controlSegment) {
        _controlSegment = [[DZNSegmentedControl alloc] initWithItems:@[@"项目介绍", @"评分", @"分析师点评", @"评论"]];
        _controlSegment.delegate = self;
        _controlSegment.height = _viewSegment.height;
        _controlSegment.width = _viewSegment.width;
        _controlSegment.origin = CGPointMake(0, 0);
        _controlSegment.selectedSegmentIndex = 0;
        _controlSegment.showsCount = NO;
        _controlSegment.bouncySelectionIndicator = NO;
        _controlSegment.autoAdjustSelectionIndicatorWidth = NO;
        _controlSegment.titleColor = TFColor_Main;
        _controlSegment.countColor = TFColor_Main;
        _controlSegment.selectionIndicatorColor = TFColor_Button;
        _controlSegment.tintColor = TFColor_Button;
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
                              animated:NO];
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
                if (_tableViewIntro.tableView.contentOffset.y > _tableViewIntro.tableView.contentSize.height - _viewInfo.height - _viewSegment.height) {
                    if (_tableViewIntro.tableView.contentSize.height - height > _viewInfo.height) {
                        _tableViewIntro.tableView.contentOffset = CGPointMake(0, _tableViewIntro.tableView.contentSize.height - height);
                    }
                    else {
                        if (_viewSegment.origin.y == 0) {
                            _tableViewIntro.tableView.contentOffset = CGPointMake(0, _viewInfo.height);
                        }
                    }
                }
            }
                break;
            case 1: {
                if (_tableViewScore.tableView.contentOffset.y > _tableViewScore.tableView.contentSize.height - _viewInfo.height - _viewSegment.height) {
                    if (_tableViewScore.tableView.contentSize.height - height > _viewInfo.height) {
                        _tableViewScore.tableView.contentOffset = CGPointMake(0, _tableViewScore.tableView.contentSize.height - height);
                    }
                    else {
                        if (_viewSegment.origin.y == 0) {
                            _tableViewScore.tableView.contentOffset = CGPointMake(0, _viewInfo.height);
                        }
                    }
                }
            }
                break;
            case 2: {
                if (_tableViewAdvice.tableView.contentOffset.y > _tableViewAdvice.tableView.contentSize.height - _viewInfo.height - _viewSegment.height) {
                    if (_tableViewAdvice.tableView.contentSize.height - height > _viewInfo.height) {
                        _tableViewAdvice.tableView.contentOffset = CGPointMake(0, _tableViewAdvice.tableView.contentSize.height - height);
                    }
                    else {
                        if (_viewSegment.origin.y == 0) {
                            _tableViewAdvice.tableView.contentOffset = CGPointMake(0, _viewInfo.height);
                        }
                    }
                }
            }
                break;
            case 3: {
                if (_tableViewComment.tableView.contentOffset.y > _tableViewComment.tableView.contentSize.height - _viewInfo.height - _viewSegment.height) {
                    if (_tableViewComment.tableView.contentSize.height - height > _viewInfo.height) {
                        _tableViewComment.tableView.contentOffset = CGPointMake(0, _tableViewComment.tableView.contentSize.height - height);
                    }
                    else {
                        if (_viewSegment.origin.y == 0) {
                            _tableViewComment.tableView.contentOffset = CGPointMake(0, _viewInfo.height);
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

- (void)TFInfoTableView:(UIScrollView *)scrollView
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
    _imgCommentNone.origin = CGPointMake(_imgCommentNone.origin.x, TFTableViewNoneY - y);
    _tableViewIntro.tableView.contentOffset = CGPointMake(0, y);
    _tableViewScore.tableView.contentOffset = CGPointMake(0, y);
    _tableViewAdvice.tableView.contentOffset = CGPointMake(0, y);
    _tableViewComment.tableView.contentOffset = CGPointMake(0, y);
}

- (void)TFInfoIntroTableView:(UIScrollView *)scrollView
{
    [self TFInfoTableView:scrollView];
}

- (void)TFInfoScoreTableView:(UIScrollView *)scrollView
{
    [self TFInfoTableView:scrollView];
}

- (void)TFInfoAdviceTableView:(UIScrollView *)scrollView
{
    [self TFInfoTableView:scrollView];
}

- (void)TFInfoCommentTableView:(UIScrollView *)scrollView
{
    [self TFInfoTableView:scrollView];
}

@end
