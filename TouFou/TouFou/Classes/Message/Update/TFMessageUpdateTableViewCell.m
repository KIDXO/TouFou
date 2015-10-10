//
//  TFMessageUpdateTableViewCell.m
//  TouFou
//
//  Created by KID on 15/10/10.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFMessageUpdateTableViewCell.h"

@implementation TFMessageUpdateTableViewCell

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
