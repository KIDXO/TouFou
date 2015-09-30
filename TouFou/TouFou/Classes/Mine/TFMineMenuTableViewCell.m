//
//  TFMineMenuTableViewCell.m
//  TouFou
//
//  Created by KID on 15/9/29.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFMineMenuTableViewCell.h"

@implementation TFMineMenuTableViewCell

- (void)awakeFromNib
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)setIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            _imgLogo.image = [UIImage imageNamed:@"TFMineLogo1"];
            _labText.text = @"我的关注";
        }
            break;
        case 1:
        {
            _imgLogo.image = [UIImage imageNamed:@"TFMineLogo2"];
            _labText.text = @"我的粉丝";
        }
            break;
        case 2:
        {
            _imgLogo.image = [UIImage imageNamed:@"TFMineLogo3"];
            _labText.text = @"发布的点评";
        }
            break;
        case 3:
        {
            _imgLogo.image = [UIImage imageNamed:@"TFMineLogo4"];
            _labText.text = @"收藏的项目";
        }
            break;
        case 4:
        {
            _imgLogo.image = [UIImage imageNamed:@"TFMineLogo5"];
            _labText.text = @"收藏的点评";
        }
            break;
        case 5:
        {
            _imgLogo.image = [UIImage imageNamed:@"TFMineLogo6"];
            _labText.text = @"我的草稿";
        }
            break;
        default:
            break;
    }
}

@end
