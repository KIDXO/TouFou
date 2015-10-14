//
//  TFInfoIntroTableView.m
//  TouFou
//
//  Created by KID on 15/10/12.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFInfoIntroTableView.h"
#import "TFInfoIntroValueCell.h"
#import "TFInfoIntroParamCell.h"
#import "TFInfoIntroDetailCell.h"
#import "TFInfoIntroSourceCell.h"

static NSString *strIdentifier1 = @"TFInfoIntroValueCell";
static NSString *strIdentifier2 = @"TFInfoIntroParamCell";
static NSString *strIdentifier3 = @"TFInfoIntroDetailCell";
static NSString *strIdentifier4 = @"TFInfoIntroSourceCell";

@implementation TFInfoIntroTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
        [self initData];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initView];
        [self initData];
    }
    return self;
}

- (void)initView
{
    _tableView = [[UITableView alloc] initWithFrame:self.bounds
                                              style:UITableViewStyleGrouped];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.separatorColor = [UIColor clearColor];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tag = self.tag;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin  |
                                  UIViewAutoresizingFlexibleWidth       |
                                  UIViewAutoresizingFlexibleRightMargin |
                                  UIViewAutoresizingFlexibleTopMargin   |
                                  UIViewAutoresizingFlexibleHeight      |
                                  UIViewAutoresizingFlexibleBottomMargin;
    [self addSubview:_tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TFInfoIntroValueCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier1];
    [self.tableView registerNib:[UINib nibWithNibName:@"TFInfoIntroParamCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier2];
    [self.tableView registerNib:[UINib nibWithNibName:@"TFInfoIntroDetailCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier3];
    [self.tableView registerNib:[UINib nibWithNibName:@"TFInfoIntroSourceCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier4];
}

- (void)initData
{
    [_tableView reloadData];
}

#pragma mark -
#pragma mark TableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 60;
    }
    else if (indexPath.section == 1) {
        return 75;
    }
    else if (indexPath.section == 2) {
        return 295;
    }
    else if (indexPath.section == 3) {
        return 56;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        TFLog(@"TFInfoIntroTableView: %f", _heightHeader);
        return _heightHeader;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 3) {
        return 10;
    }
    return TFHeightSeparator;
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
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier1];
    }
    else if (indexPath.section == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier2];
    }
    else if (indexPath.section == 2) {
        cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier3];
    }
    else if (indexPath.section == 3) {
        cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier4];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

#pragma mark -
#pragma mark ScrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_delegate && [_delegate respondsToSelector:@selector(TFInfoIntroTableView:)]) {
        [_delegate TFInfoIntroTableView:scrollView];
    }
}

@end
