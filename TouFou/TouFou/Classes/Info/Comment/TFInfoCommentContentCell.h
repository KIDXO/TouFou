//
//  TFInfoCommentContentCell.h
//  TouFou
//
//  Created by KID on 15/10/13.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFInfoCommentInfo.h"

@protocol TFInfoCommentContentDelegate <NSObject>

- (void)TFInfoCommentContentReply:(NSInteger)index;
- (void)TFInfoCommentContentReply:(NSInteger)index response:(NSInteger)tag;

@end

@interface TFInfoCommentContentCell : UITableViewCell

@property (nonatomic, weak) TFInfoCommentInfo                   *info;
@property (nonatomic, weak) IBOutlet UIImageView                *imgHead;
@property (nonatomic, weak) IBOutlet UILabel                    *labName;
@property (nonatomic, weak) IBOutlet UILabel                    *labTime;
@property (nonatomic, weak) IBOutlet UILabel                    *labComment;
@property (nonatomic, weak) IBOutlet UIButton                   *btnReply;
@property (nonatomic, weak) IBOutlet UIView                     *viewResponse;
@property (nonatomic, weak) id <TFInfoCommentContentDelegate>    delegate;

@end
