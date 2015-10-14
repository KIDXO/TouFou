//
//  TFInfoAdviceContentCell.m
//  TouFou
//
//  Created by KID on 15/10/12.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFInfoAdviceContentCell.h"

@implementation TFInfoAdviceContentCell

- (void)awakeFromNib
{
    _imgHead.layer.cornerRadius = TFCorner;
    _imgHead.layer.masksToBounds = true;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (IBAction)actionRead:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(TFInfoAdviceContentActionRead:)]) {
        [_delegate TFInfoAdviceContentActionRead:self.tag];
    }
}

@end
