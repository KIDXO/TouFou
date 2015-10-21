//
//  TFInfoCommentContentCell.m
//  TouFou
//
//  Created by KID on 15/10/13.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFInfoCommentContentCell.h"

@implementation TFInfoCommentContentCell

- (void)awakeFromNib
{
    _imgHead.layer.cornerRadius = TFCorner;
    _imgHead.layer.masksToBounds = true;
    
    for (id obj in self.subviews) {
        if ([NSStringFromClass([obj class]) isEqualToString:@"UITableViewCellScrollView"]) {
            UIScrollView *view = (UIScrollView *)obj;
            view.delaysContentTouches = NO;
            break;
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)setInfo:(TFInfoCommentInfo *)info
{
    _info = info;
    
    [_imgHead sd_setImageWithURL:[NSURL URLWithString:info.head]
                placeholderImage:[UIImage imageNamed:@"TFPlaceholderHead"]
                       completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                           
                       }];
    
    _labName.text = info.name;
    _labTime.text = info.time;
    
    _labComment.text = info.comment;
    _labComment.height = info.commentSize.height;
    _labTime.origin = CGPointMake(_labTime.origin.x, _labComment.bottom + 5);
    _btnReply.origin = CGPointMake(_btnReply.origin.x, _labComment.bottom + 5);
    _viewResponse.origin = CGPointMake(_viewResponse.origin.x, _labTime.bottom + 5);
    _viewResponse.width = TFWidth - 70;
    
    for (UIView *view in _viewResponse.subviews) {
        if ([view isKindOfClass:UIButton.class]) {
            [view removeFromSuperview];
        }
    }
    
    if (info.response.count > 0) {
        CGRect frame = CGRectMake(10, 7, _viewResponse.width - 20, 0);
        for (int i = 0; i < info.response.count; i++) {
            
            TFInfoCommentResponseInfo *response = info.response[i];
            frame.size.height = response.responseSize.height;
            
            NSMutableAttributedString *strResponse = [[NSMutableAttributedString alloc] initWithString:response.responseFormat];
            if (response.nameResponse.length > 0) {
                if (strResponse.length > response.name.length + response.nameResponse.length + 3) {
                    [strResponse addAttribute:NSForegroundColorAttributeName value:TFColor_Text_Reply
                                        range:NSMakeRange(0, response.name.length)];
                    [strResponse addAttribute:NSForegroundColorAttributeName value:TFColor_Text_Reply
                                        range:NSMakeRange(response.name.length + 2, response.nameResponse.length + 1)];
                }
            }
            else {
                if (strResponse.length > response.name.length + 1) {
                    [strResponse addAttribute:NSForegroundColorAttributeName value:TFColor_Text_Reply
                                        range:NSMakeRange(0, response.name.length + 1)];
                }
            }
            
            UIButton *btn = [[UIButton alloc] initWithFrame:frame];
            [btn setTag:i];
            [btn.titleLabel setFont:[UIFont systemFontOfSize:13]];
            [btn.titleLabel setNumberOfLines:0];
            [btn setAttributedTitle:strResponse forState:UIControlStateNormal];
            [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
            [btn setBackgroundColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
            [btn addTarget:self action:@selector(actionResponse:) forControlEvents:UIControlEventTouchUpInside];
            [_viewResponse addSubview:btn];
            
            frame.origin.y += btn.height + 5;
            if (i == info.response.count - 1) {
                frame.origin.y += 2;
            }
        }
        _viewResponse.height = frame.origin.y;
    }
    else {
        _viewResponse.height = 0;
    }
}

- (IBAction)actionReply:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(TFInfoCommentContentReply:)]) {
        [_delegate TFInfoCommentContentReply:self.tag];
    }
}

- (IBAction)actionResponse:(UIButton *)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(TFInfoCommentContentReply:response:)]) {
        [_delegate TFInfoCommentContentReply:self.tag response:sender.tag];
    }
}

@end
