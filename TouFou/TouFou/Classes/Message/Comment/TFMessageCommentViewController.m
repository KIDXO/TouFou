//
//  TFMessageCommentViewController.m
//  TouFou
//
//  Created by KID on 15/10/10.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFMessageCommentViewController.h"
#import "TFMessageCommentInfo.h"

static NSString *strIdentifier = @"TFMessageCommentTableViewCell";

@interface TFMessageCommentViewController ()

@end

@implementation TFMessageCommentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"评论"];
    [self setTitleCustom:@"评论页面"];
    [self createReturnButton];
    
    [self initData];
    [self reloadData];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TFMessageCommentTableViewCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)initData
{
    self.aryInfo = [[NSMutableArray alloc] initWithCapacity:0];
    
    TFMessageCommentInfo *info1 = [[TFMessageCommentInfo alloc]init];
    info1.head = @"http://222.76.211.84/rosi/image/1402/d.jpg";
    info1.name = @"哈利路亚";
    info1.nameComment = @"超昵玛";
    info1.time = @"2015-01-01 08:40:10";
    info1.response = @"啊实打实的撒大大的撒打算打算打大声道啊阿贾克斯的哈萨克几点回家卡萨丁黑金卡是打火机卡号的空间啊圣诞节阿什顿金卡号打卡抠脚大汉空间大啊实打实的撒大大的撒打算打算打大声道啊阿贾克斯的哈萨克几点回家卡萨丁黑金卡是打火机卡号的空间啊圣诞节阿什顿金卡号打卡抠脚大汉空间大啊实打实的撒大大的撒打算打算打大声道啊阿贾克斯的哈萨克几点回家卡萨丁黑金卡是打火机卡号的空间啊圣诞节阿什顿金卡号打卡抠脚大汉空间大";
    info1.comment = @"苹果不免费，国内音乐APP分分钟教你做人，而此时苹果仍然宣称不会做免费音乐，也算是一个品牌的坚持。等一些不认同的看法，而此时苹果仍然宣称不会做免费音乐，也算是一个品牌的坚持。";
    
    TFMessageCommentInfo *info2 = [[TFMessageCommentInfo alloc]init];
    info2.head = @"http://222.76.211.84/rosi/sishu/025/d.jpg";
    info2.name = @"乔布斯";
    info2.nameComment = @"王者超昵玛";
    info2.time = @"2013-11-21 12:04:10";
    info2.response = @"并且称如果Apple Music使用广告支撑的免费模式，用户将很快达到5000万。苹果不免费，国内音乐APP分分钟教你做人，而此时苹果仍然宣称不会做免费音乐，也算是一个品牌的坚持。";
    info2.comment = @"并且称如果Apple Music使用广告支撑的免费模式，用户将很快达到5000万。并且称如果Apple Music使用广告支撑的免费模式，用户将很快达到5000万。并且称如果Apple Music使用广告支撑的免费模式，用户将很快达到5000万。";
    
    TFMessageCommentInfo *info3 = [[TFMessageCommentInfo alloc]init];
    info3.head = @"http://tu.68flash.com/img/yp/yp12.jpg";
    info3.name = @"提姆库克";
    info3.nameComment = @"变态超昵玛";
    info3.time = @"2012-11-06 18:55:10";
    info3.response = @"10月8日在旧金山的新企业峰会上，Apple Music的负责人Jimmy Iovine表示，Apple Music不会做免费音乐服务。10月8日在旧金山的新企业峰会上，Apple Music的负责人Jimmy Iovine表示，Apple Music不会做免费音乐服务。并且称如果Apple Music使用广告支撑的免费模式，用户将很快达到5000万。并且称如果Apple Music使用广告支撑的免费模式，用户将很快达到5000万。并且称如果Apple Music使用广告支撑的免费模式，用户将很快达到5000万。";
    info3.comment = @"10月8日在旧金山的新企业峰会上，Apple Music的负责人Jimmy Iovine表示，Apple Music不会做免费音乐服务。10月8日在旧金山的新企业峰会上，Apple Music的负责人Jimmy Iovine表示，Apple Music不会做免费音乐服务。10月8日在旧金山的新企业峰会上，Apple Music的负责人Jimmy Iovine表示，Apple Music不会做免费音乐服务。10月8日在旧金山的新企业峰会上，Apple Music的负责人Jimmy Iovine表示，Apple Music不会做免费音乐服务。10月8日在旧金山的新企业峰会上，Apple Music的负责人Jimmy Iovine表示，Apple Music不会做免费音乐服务。";
    
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
        
        TFMessageCommentInfo *info = _aryInfo[i];
        
        info.responseFormat = [NSString stringWithFormat:@"回复：%@",info.response];
        CGFloat height = [info.responseFormat heightWithFont:[UIFont systemFontOfSize:15]
                                          constrainedToWidth:TFWidth - 30];
        info.responseSize = CGSizeMake(TFWidth - 30, height);
        
        info.commentFormat = [NSString stringWithFormat:@"%@：%@",info.nameComment,info.response];
        height = [info.commentFormat heightWithFont:[UIFont systemFontOfSize:15]
                                 constrainedToWidth:TFWidth - 45];
        info.commentSize = CGSizeMake(TFWidth - 45, height);
    }
    [_tableView reloadData];
}

#pragma mark -
#pragma mark TableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_aryInfo) {
        TFMessageCommentInfo *info = _aryInfo[indexPath.row];
        return 100 + info.responseSize.height + info.commentSize.height;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
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
    TFMessageCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier];
    [cell setInfo:_aryInfo[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
