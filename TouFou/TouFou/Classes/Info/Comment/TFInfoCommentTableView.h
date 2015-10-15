//
//  TFInfoCommentTableView.h
//  TouFou
//
//  Created by KID on 15/10/12.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFInfoCommentInfo.h"

@protocol TFInfoCommentTableViewDelegate <NSObject>

- (void)TFInfoCommentTableView:(UIScrollView *)scrollView;
- (void)TFInfoCommentTableViewReply:(TFInfoCommentInfo *)info;
- (void)TFInfoCommentTableViewReply:(TFInfoCommentInfo *)info response:(TFInfoCommentResponseInfo *)response;

@end

@interface TFInfoCommentTableView : UIView
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) CGFloat                                heightHeader;
@property (nonatomic, strong) NSMutableArray                        *aryInfo;
@property (nonatomic, strong) UITableView                           *tableView;
@property (nonatomic, weak)   id <TFInfoCommentTableViewDelegate>    delegate;

@end
