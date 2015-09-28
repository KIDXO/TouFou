//
//  TFSideTableViewCell.m
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFSideTableViewCell.h"

@implementation TFSideTableViewCell

- (void)awakeFromNib
{
    UIView *view = [[UIView alloc] initWithFrame:self.frame];
    view.backgroundColor = [UIColor colorWithHex:0x5977B0];
    self.selectedBackgroundView = view;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)setIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        switch (indexPath.row)
        {
            case 0:
            {
                _imgLogo.image = [UIImage imageNamed:@"TFSideLogo1"];
                _labText.text = @"分析师";
            }
                break;
            case 1:
            {
                _imgLogo.image = [UIImage imageNamed:@"TFSideLogo2"];
                _labText.text = @"消息";
            }
                break;
            case 2:
            {
                _imgLogo.image = [UIImage imageNamed:@"TFSideLogo3"];
                _labText.text = @"监控设置";
            }
                break;
            case 3:
            {
                _imgLogo.image = [UIImage imageNamed:@"TFSideLogo4"];
                _labText.text = @"平台协议";
            }
                break;
            default:
                break;
        }
    }
    else if (indexPath.section == 1)
    {
        _imgLogo.image = [UIImage imageNamed:@"TFSideLogo5"];
        _labText.text = @"设置";
    }
}

@end
