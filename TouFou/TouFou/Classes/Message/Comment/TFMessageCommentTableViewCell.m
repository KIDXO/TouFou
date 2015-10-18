//
//  TFMessageCommentTableViewCell.m
//  TouFou
//
//  Created by KID on 15/10/10.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFMessageCommentTableViewCell.h"

@implementation TFMessageCommentTableViewCell

- (void)awakeFromNib
{
    _imgHead.layer.cornerRadius = TFCorner;
    _imgHead.layer.masksToBounds = true;
    
    _btnReply.layer.cornerRadius = TFCorner;
    _btnReply.layer.masksToBounds = true;
    _btnReply.layer.borderWidth = 0.5;
    _btnReply.layer.borderColor = TFColor_Text_Dark.CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)setInfo:(TFMessageCommentInfo *)info
{
    [_imgHead sd_setImageWithURL:[NSURL URLWithString:info.head]
                placeholderImage:[UIImage imageNamed:@"TFPlaceholderHead"]
                       completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                           
                       }];
    
    _labName.text = info.name;
    _labTime.text = info.time;
    
    NSMutableAttributedString *strResponse = [[NSMutableAttributedString alloc] initWithString:info.responseFormat];
    if (strResponse.length > 3) {
        [strResponse addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor]
                            range:NSMakeRange(0, 3)];
    }
    
    NSMutableAttributedString *strComment = [[NSMutableAttributedString alloc] initWithString:info.commentFormat];
    if (strComment.length > info.nameComment.length + 1) {
        [strComment addAttribute:NSForegroundColorAttributeName value:TFColor_Text_Reply
                           range:NSMakeRange(0, info.nameComment.length + 1)];
    }
    _labResponse.attributedText = strResponse;
    _labComment.attributedText = strComment;
    
    _labResponse.height = info.responseSize.height;
    _labComment.frame = CGRectMake(_labComment.origin.x, _labResponse.height + 85,
                                   _labComment.width, info.commentSize.height);
    _viewLine.frame = CGRectMake(_viewLine.origin.x, _labComment.origin.y + 3,
                                 _viewLine.width, _labComment.height - 5);
}

@end
