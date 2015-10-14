//
//  TFInfoArticleContentCell.m
//  TouFou
//
//  Created by KID on 15/10/14.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFInfoArticleContentCell.h"

@implementation TFInfoArticleContentCell

- (void)awakeFromNib
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)setInfo:(TFInfoArticleContentInfo *)info
{
    _info = info;
    _labTitle.text = info.title;
    _labTime.text = info.time;
    _labContent.text = info.content;
    _labContent.height = info.contentSize.height;
}

@end
