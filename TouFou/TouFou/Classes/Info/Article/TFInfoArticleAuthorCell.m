//
//  TFInfoArticleAuthorCell.m
//  TouFou
//
//  Created by KID on 15/10/14.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFInfoArticleAuthorCell.h"

@implementation TFInfoArticleAuthorCell

- (void)awakeFromNib
{
    _imgHead.layer.cornerRadius = _imgHead.height / 2;
    _imgHead.layer.masksToBounds = true;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
