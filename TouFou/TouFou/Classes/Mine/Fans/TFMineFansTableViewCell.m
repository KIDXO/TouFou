//
//  TFMineFansTableViewCell.m
//  TouFou
//
//  Created by KID on 15/10/9.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFMineFansTableViewCell.h"

@implementation TFMineFansTableViewCell

- (void)awakeFromNib
{
    _imgHead.layer.cornerRadius = TFCorner;
    _imgHead.layer.masksToBounds = true;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
