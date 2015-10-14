//
//  TFInfoCommentTableView.m
//  TouFou
//
//  Created by KID on 15/10/12.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFInfoCommentTableView.h"
#import "TFInfoCommentContentCell.h"
#import "TFInfoCommentInfo.h"

static NSString *strIdentifier = @"TFInfoCommentContentCell";

@implementation TFInfoCommentTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
        [self initData];
        [self reloadData];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initView];
        [self initData];
        [self reloadData];
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
    _tableView.delaysContentTouches = NO;
    for (UIView *view in _tableView.subviews) {
        if ([view isKindOfClass:[UIScrollView class]]) {
           ((UIScrollView *)view).delaysContentTouches = NO;
        }
    }
    [self addSubview:_tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TFInfoCommentContentCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier];
}

- (void)initData
{
    self.aryInfo = [[NSMutableArray alloc] initWithCapacity:0];
    
    TFInfoCommentResponseInfo *response1 = [[TFInfoCommentResponseInfo alloc] init];
    response1.name = @"我是谁";
    response1.nameResponse = @"哈利路亚";
    response1.response = @"你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾";
    
    TFInfoCommentResponseInfo *response2 = [[TFInfoCommentResponseInfo alloc] init];
    response2.name = @"哈利路亚";
    response2.response = @"打大声道啊阿贾克斯的哈萨";
    
    TFInfoCommentResponseInfo *response3 = [[TFInfoCommentResponseInfo alloc] init];
    response3.name = @"阿里巴巴";
    response3.response = @"在座的各位都是垃圾在座的各位都是垃圾在座的各位都是垃圾在座的各位都是垃圾在座的各位都是垃圾在座的各位都是垃圾在座的各位都是垃圾在座的各位都是垃圾在座的各位都是垃圾在座的各位都是垃圾在座的各位都是垃圾在座的各位都是垃圾在座的各位都是垃圾在座的各位都是垃圾在座的各位都是垃圾在座的各位都是垃圾在座的各位都是垃圾在座的各位都是垃圾在座的各位都是垃圾在座的各位都是垃圾在座的各位都是垃圾在座的各位都是垃圾";
    
    TFInfoCommentResponseInfo *response4 = [[TFInfoCommentResponseInfo alloc] init];
    response4.name = @"我是谁";
    response4.response = @"苹果不免费，国内音乐APP分分钟教你做人，而此时苹果仍然宣称不会做免费音乐，也算是一个品牌的坚持。等一些不认同的看法，而此时苹果仍然宣称不会做免费音乐，也算是一个品牌的坚持苹果不免费，国内音乐APP分分钟教你做人，而此时苹果仍然宣称不会做免费音乐，也算是一个品牌的坚持。等一些不认同的看法，而此时苹果仍然宣称不会做免费音乐，也算是一个品牌的坚持";
    
    TFInfoCommentResponseInfo *response5 = [[TFInfoCommentResponseInfo alloc] init];
    response5.name = @"乔布斯还没死，你们全部跪下";
    response5.nameResponse = @"马云&马化腾（双马合璧，全部秒杀）";
    response5.response = @"你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾，你们都是垃圾";
    
    TFInfoCommentInfo *info1 = [[TFInfoCommentInfo alloc] init];
    info1.head = @"http://222.76.211.84/rosi/image/1402/d.jpg";
    info1.name = @"哈利路亚";
    info1.time = @"2015-01-01 08:40:10";
    info1.response = @[response1,response2,response3,response4,response5];
    info1.comment = @"苹果不免费，国内音乐APP分分钟教你做人，而此时苹果仍然宣称不会做免费音乐，也算是一个品牌的坚持。等一些不认同的看法，而此时苹果仍然宣称不会做免费音乐，也算是一个品牌的坚持。";
    
    TFInfoCommentInfo *info2 = [[TFInfoCommentInfo alloc] init];
    info2.head = @"http://222.76.211.84/rosi/image/1402/d.jpg";
    info2.name = @"哈利路亚";
    info2.time = @"2015-01-01 08:40:10";
    info2.response = @[response1,response2,response3,response4,response5];
    info2.comment = @"并且称如果Apple Music使用广告支撑的免费模式，用户将很快达到5000万。并且称如果Apple Music使用广告支撑的免费模式，用户将很快达到5000万。并且称如果Apple Music使用广告支撑的免费模式，用户将很快达到5000万。";
    
    TFInfoCommentInfo *info3 = [[TFInfoCommentInfo alloc] init];
    info3.head = @"http://222.76.211.84/rosi/image/1402/d.jpg";
    info3.name = @"哈利路亚";
    info3.time = @"2015-01-01 08:40:10";
    info3.response = @[response1,response2,response3,response4,response5,response3,response5,response5,response2,response1];
    info3.comment = @"10月8日在旧金山的新企业峰会上，Apple Music的负责人Jimmy Iovine表示，Apple Music不会做免费音乐服务。10月8日在旧金山的新企业峰会上，Apple Music的负责人Jimmy Iovine表示，Apple Music不会做免费音乐服务。10月8日在旧金山的新企业峰会上，Apple Music的负责人Jimmy Iovine表示，Apple Music不会做免费音乐服务。10月8日在旧金山的新企业峰会上，Apple Music的负责人Jimmy Iovine表示，Apple Music不会做免费音乐服务。10月8日在旧金山的新企业峰会上，Apple Music的负责人Jimmy Iovine表示，Apple Music不会做免费音乐服务。";
    
    [_aryInfo addObject:info3];
    [_aryInfo addObject:info1];
    [_aryInfo addObject:info2];
    [_aryInfo addObject:info3];
    [_aryInfo addObject:info2];
    [_aryInfo addObject:info3];
    [_aryInfo addObject:info1];
    [_aryInfo addObject:info2];
    [_aryInfo addObject:info3];
    [_aryInfo addObject:info1];
    [_aryInfo addObject:info1];
    [_aryInfo addObject:info2];
    [_aryInfo addObject:info3];
    [_aryInfo addObject:info1];
    [_aryInfo addObject:info2];
    [_aryInfo addObject:info3];
    [_aryInfo addObject:info1];
    [_aryInfo addObject:info2];
    [_aryInfo addObject:info3];
}

- (void)reloadData
{
    for (int i = 0; i < _aryInfo.count; i++) {
        
        TFInfoCommentInfo *info = _aryInfo[i];
        
        CGFloat height = [info.comment heightWithFont:[UIFont systemFontOfSize:13]
                                   constrainedToWidth:TFWidth - 70];
        info.commentSize = CGSizeMake(TFWidth - 70, height);
        
        height = 0;
        
        for (int j = 0; j < info.response.count; j++) {
            
            TFInfoCommentResponseInfo *response = info.response[j];
            if (response.nameResponse.length > 0) {
                response.responseFormat = [NSString stringWithFormat:@"%@回复%@：%@",response.name,response.nameResponse,response.response];
            }
            else {
                response.responseFormat = [NSString stringWithFormat:@"%@：%@",response.name,response.response];
            }
            
            CGFloat heightResponse = [response.responseFormat heightWithFont:[UIFont systemFontOfSize:13]
                                                          constrainedToWidth:TFWidth - 90];
            response.responseSize = CGSizeMake(TFWidth - 90, heightResponse);
            
            height += heightResponse + 5;
        }
        
        info.responseSize = CGSizeMake(TFWidth - 90, height);
    }
    [_tableView reloadData];
}

#pragma mark -
#pragma mark TableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_aryInfo) {
        TFInfoCommentInfo *info = _aryInfo[indexPath.row];
        return 86 + info.responseSize.height + info.commentSize.height;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        TFLog(@"TFInfoCommentTableView: %f", _heightHeader);
        return _heightHeader;
    }
    return TFHeightSeparator;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 44;
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
    if (_aryInfo) {
        return _aryInfo.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TFInfoCommentContentCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier];
    [cell setTag:indexPath.row];
    [cell setInfo:_aryInfo[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

#pragma mark -
#pragma mark ScrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_delegate && [_delegate respondsToSelector:@selector(TFInfoCommentTableView:)]) {
        [_delegate TFInfoCommentTableView:scrollView];
    }
}

@end
