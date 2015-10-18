//
//  TFMessageCommentTableViewCell.h
//  TouFou
//
//  Created by KID on 15/10/10.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFMessageCommentInfo.h"

@interface TFMessageCommentTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView    *imgHead;
@property (nonatomic, weak) IBOutlet UILabel        *labName;
@property (nonatomic, weak) IBOutlet UILabel        *labTime;
@property (nonatomic, weak) IBOutlet UILabel        *labResponse;
@property (nonatomic, weak) IBOutlet UILabel        *labComment;
@property (nonatomic, weak) IBOutlet UIButton       *btnReply;
@property (nonatomic, weak) IBOutlet UIView         *viewLine;

- (void)setInfo:(TFMessageCommentInfo *)info;

@end
