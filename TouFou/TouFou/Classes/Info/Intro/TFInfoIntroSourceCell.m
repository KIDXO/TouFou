//
//  TFInfoIntroSourceCell.m
//  TouFou
//
//  Created by KID on 15/10/12.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFInfoIntroSourceCell.h"

@implementation TFInfoIntroSourceCell

- (void)awakeFromNib
{
    _btnGo.layer.cornerRadius = TFCorner;
    _btnGo.layer.masksToBounds = true;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
