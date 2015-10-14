//
//  TFInfoScoreTableView.m
//  TouFou
//
//  Created by KID on 15/10/12.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFInfoScoreTableView.h"
#import "TFInfoScoreValueCell.h"
#import "TFInfoScoreAboutCell.h"

static NSString *strIdentifier1 = @"TFInfoScoreValueCell";
static NSString *strIdentifier2 = @"TFInfoScoreAboutCell";

@implementation TFInfoScoreTableView

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
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TFInfoScoreValueCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier1];
    [self.tableView registerNib:[UINib nibWithNibName:@"TFInfoScoreAboutCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier2];
}

- (void)initData
{
    [_tableView reloadData];
}

#pragma mark -
#pragma mark TableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < 3) {
        return 100;
    }
    return 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        TFLog(@"TFInfoScoreTableView: %f", _heightHeader);
        return _heightHeader;
    }
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
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < 3) {
        TFInfoScoreValueCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier1];
        [cell setInfo];
        return cell;
    }
    else {
        TFInfoScoreAboutCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier2];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

#pragma mark -
#pragma mark ScrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_delegate && [_delegate respondsToSelector:@selector(TFInfoScoreTableView:)]) {
        [_delegate TFInfoScoreTableView:scrollView];
    }
}

@end
