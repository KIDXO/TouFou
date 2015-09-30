//
//  TFMineEditHeadTableViewCell.m
//  TouFou
//
//  Created by KID on 15/9/30.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFMineEditHeadTableViewCell.h"

@implementation TFMineEditHeadTableViewCell

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
