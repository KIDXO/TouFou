//
//  TFMessageGoodTableViewCell.m
//  TouFou
//
//  Created by KID on 15/10/10.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFMessageGoodTableViewCell.h"

@implementation TFMessageGoodTableViewCell

- (void)awakeFromNib
{
    NSMutableAttributedString *strTitle = [[NSMutableAttributedString alloc] initWithString:_labTitle.text];
    [strTitle addAttribute:NSForegroundColorAttributeName value:TFColor_Text_Reply
                     range:NSMakeRange(15, 7)];
    _labTitle.attributedText = strTitle;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
