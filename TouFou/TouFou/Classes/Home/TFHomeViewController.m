//
//  TFHomeViewController.m
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFHomeViewController.h"
#import "TFHomeTableViewCell.h"
#import "AppDelegate.h"

static NSString *strIdentifier = @"TFHomeTableViewCell";

@interface TFHomeViewController ()

@end

@implementation TFHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"投否"];
    [self setTitleCustom:@"投否首页"];
    [self createReturnButton];
    
    [self initData];
    [self initView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TFHomeTableViewCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier];
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

- (void)initData
{
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
    
//    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//    visualEffectView.frame = _imageView.bounds;
//    [_imageView addSubview:visualEffectView];
}

- (void)actionDrawer
{
    [[AppDelegate sharedAppDelegate] actionDrawer:YES];
}

- (IBAction)actionCategory:(UIButton *)sender
{
    switch (sender.tag) {
        case 1:
        {
            [_tableCategory setInfo:_arySource   type:TFHomeCategoryTypeSource];
        }
            break;
        case 2:
        {
            [_tableCategory setInfo:_aryCategory type:TFHomeCategoryTypeCategory];
        }
            break;
        case 3:
        {
            [_tableCategory setInfo:_aryPeriod   type:TFHomeCategoryTypePeriod];
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
        _tableCategory.origin = CGPointMake(0, - _tableCategory.height + 40);
        _viewDark.alpha = 0;
    } completion:^(BOOL finished) {
        _viewDark.hidden = YES;
    }];
}

- (void)TFHomeCategoryViewSelect:(id)info type:(TFHomeCategoryType)type
{
    switch (type) {
        case TFHomeCategoryTypeSource:
        {
            [_btnSource   setTitle:info forState:UIControlStateNormal];
        }
            break;
        case TFHomeCategoryTypeCategory:
        {
            [_btnCategory setTitle:info forState:UIControlStateNormal];
        }
            break;
        case TFHomeCategoryTypePeriod:
        {
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

}

@end
