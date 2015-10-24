//
//  TFHomeViewController.m
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFHomeViewController.h"
#import "TFHomeTableViewCell.h"
#import "TFDashboardViewController.h"
#import "UIBaseNavigationController.h"
#import "AppDelegate.h"

static NSString *strIdentifier = @"TFHomeTableViewCell";

@interface TFHomeViewController ()

@end

@implementation TFHomeViewController

#pragma mark - LifeCycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:@"投否"];
    [self setTitleCustom:@"投否首页"];
    
    [self createReturnButton];
    [self createCustomButton];
    
    [self initData];
    [self initView];
    
    TFDashboardViewController *vc = [[TFDashboardViewController alloc] initWithNibName:@"TFDashboardViewController" bundle:nil];
    UIBaseNavigationController *nav = [[UIBaseNavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self actionCategoryClose:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)createReturnButton
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.layer.cornerRadius = 15;
    btn.layer.masksToBounds = true;
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(0, 0, 30, 30);
    [btn addTarget:self action:@selector(actionDrawer) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)createCustomButton
{
    CGRect frame = CGRectZero;
    UIImage *image = [UIImage imageNamed:@"UINavSearch"];
    frame.size = image.size;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    [btn setImage:image forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(actionSearch) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
}

#pragma mark -
#pragma mark Initialization
- (void)initData
{
    self.stateCategory  = TFHomeCategoryStateNone;
    
    self.indexSource    = 0;
    self.indexCategory  = 0;
    self.indexPeriod    = 0;
    
    self.arySource   = [[NSMutableArray alloc] initWithCapacity:0];
    self.aryCategory = [[NSMutableArray alloc] initWithCapacity:0];
    self.aryPeriod   = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (int i = 0; i < 20; i++) {
        [self.arySource     addObject:[NSString stringWithFormat:@"%d",i]];
        [self.aryCategory   addObject:[NSString stringWithFormat:@"%d",i + 10]];
        [self.aryPeriod     addObject:[NSString stringWithFormat:@"%d",i + 100]];
    }
}

- (void)initView
{
    _tableCategory.delegate = self;
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(actionDrawer)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TFHomeTableViewCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier];
    
    _viewSearchFrame.layer.cornerRadius = 5;
    _viewSearchFrame.layer.masksToBounds = true;
    
    [_viewSearch setAlpha:0];
    [_viewSearch setHidden:YES];
    [_viewSearch setFrame:CGRectMake(0, 0, TFWidth, TFHeight)];
    [self.window addSubview:_viewSearch];
    
//    UIVisualEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
//    effectView.frame = _viewSearchEffect.bounds;
//    [_viewSearchEffect addSubview:effectView];
}

#pragma mark -
#pragma mark Action
- (void)actionDrawer
{
    [[AppDelegate sharedAppDelegate] actionDrawer:YES];
}

- (void)actionSearch
{
    [_textSearch becomeFirstResponder];
    [_viewSearch setHidden:NO];
    [UIView animateWithDuration:TFAnimate animations:^{
        _viewSearch.alpha = 1;
    }];
}

- (IBAction)actionSearchClose:(UIButton *)sender
{
    [_textSearch resignFirstResponder];
    [UIView animateWithDuration:TFAnimate animations:^{
        _viewSearch.alpha = 0;
    } completion:^(BOOL finished) {
        _viewSearch.hidden = YES;
    }];
}

- (IBAction)actionCategory:(UIButton *)sender
{
    switch (sender.tag) {
        case 1:
        {
            if (_stateCategory != TFHomeCategoryStateSource) {
                _stateCategory = TFHomeCategoryStateSource;
                [_tableCategory setInfo:_arySource type:TFHomeCategoryTypeSource select:_indexSource];
                [UIView animateWithDuration:TFAnimate animations:^{
                    _imgSource.transform    = CGAffineTransformMakeRotation(M_PI);
                    _imgCategory.transform  = CGAffineTransformMakeRotation(0);
                    _imgPeriod.transform    = CGAffineTransformMakeRotation(0);
                }];
            }
            else {
                [self actionCategoryClose:nil];
                return;
            }
        }
            break;
        case 2:
        {
            if (_stateCategory != TFHomeCategoryStateCategory) {
                _stateCategory = TFHomeCategoryStateCategory;
                [_tableCategory setInfo:_aryCategory type:TFHomeCategoryTypeCategory select:_indexCategory];
                [UIView animateWithDuration:TFAnimate animations:^{
                    _imgSource.transform    = CGAffineTransformMakeRotation(0);
                    _imgCategory.transform  = CGAffineTransformMakeRotation(M_PI);
                    _imgPeriod.transform    = CGAffineTransformMakeRotation(0);
                }];
            }
            else {
                [self actionCategoryClose:nil];
                return;
            }
        }
            break;
        case 3:
        {
            if (_stateCategory != TFHomeCategoryStatePeriod) {
                _stateCategory = TFHomeCategoryStatePeriod;
                [_tableCategory setInfo:_aryPeriod type:TFHomeCategoryTypePeriod select:_indexPeriod];
                [UIView animateWithDuration:TFAnimate animations:^{
                    _imgSource.transform    = CGAffineTransformMakeRotation(0);
                    _imgCategory.transform  = CGAffineTransformMakeRotation(0);
                    _imgPeriod.transform    = CGAffineTransformMakeRotation(M_PI);
                }];
            }
            else {
                [self actionCategoryClose:nil];
                return;
            }
        }
            break;
        default:
            break;
    }
    _viewDark.hidden = NO;
    [_tableCategory.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                    atScrollPosition:UITableViewScrollPositionTop
                                            animated:NO];
    [UIView animateWithDuration:TFAnimate animations:^{
        _tableCategory.origin = CGPointMake(0, 40);
        _viewDark.alpha = 1;
    }];
}

- (IBAction)actionCategoryClose:(UIButton *)sender
{
    [UIView animateWithDuration:TFAnimate animations:^{
        _imgSource.transform    = CGAffineTransformMakeRotation(0);
        _imgCategory.transform  = CGAffineTransformMakeRotation(0);
        _imgPeriod.transform    = CGAffineTransformMakeRotation(0);
        _tableCategory.origin   = CGPointMake(0, - _tableCategory.height + 40);
        _viewDark.alpha = 0;
    } completion:^(BOOL finished) {
        _viewDark.hidden = YES;
        _stateCategory = TFHomeCategoryStateNone;
    }];
}

#pragma mark -
#pragma mark Delegate
- (void)TFHomeCategoryViewSelect:(id)info type:(TFHomeCategoryType)type select:(NSInteger)select
{
    switch (type) {
        case TFHomeCategoryTypeSource:
        {
             _indexSource   = select;
            [_btnSource   setTitle:info forState:UIControlStateNormal];
        }
            break;
        case TFHomeCategoryTypeCategory:
        {
             _indexCategory = select;
            [_btnCategory setTitle:info forState:UIControlStateNormal];
        }
            break;
        case TFHomeCategoryTypePeriod:
        {
             _indexPeriod   = select;
            [_btnPeriod   setTitle:info forState:UIControlStateNormal];
        }
            break;
        default:
            break;
    }
    [self actionCategoryClose:nil];
}

#pragma mark -
#pragma mark TableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300;
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
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [TFNotificationCenter postNotificationName:TFNotificationInfo object:nil];
}

@end
