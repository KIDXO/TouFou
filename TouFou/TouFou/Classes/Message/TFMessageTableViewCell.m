//
//  TFMessageTableViewCell.m
//  TouFou
//
//  Created by KID on 15/9/29.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFMessageTableViewCell.h"

@implementation TFMessageTableViewCell

- (void)awakeFromNib
{

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
                _imgLogo.image = [UIImage imageNamed:@"TFMessageLogo1"];
                _labText.text = @"评论";
            }
                break;
            case 1:
            {
                _imgLogo.image = [UIImage imageNamed:@"TFMessageLogo2"];
                _labText.text = @"点赞";
            }
                break;
            case 2:
            {
                _imgLogo.image = [UIImage imageNamed:@"TFMessageLogo3"];
                _labText.text = @"监控推送";
            }
                break;
            case 3:
            {
                _imgLogo.image = [UIImage imageNamed:@"TFMessageLogo4"];
                _labText.text = @"关注更新";
            }
                break;
            default:
                break;
        }
    }
}

@end
