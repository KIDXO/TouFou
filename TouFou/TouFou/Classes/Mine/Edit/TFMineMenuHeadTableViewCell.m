//
//  TFMineMenuHeadTableViewCell.m
//  TouFou
//
//  Created by KID on 15/9/30.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFMineMenuHeadTableViewCell.h"

@implementation TFMineMenuHeadTableViewCell

- (void)awakeFromNib
{
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)setIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView
{
    if (indexPath.section == 1)
    {
        switch (indexPath.row)
        {
            case 0:
            {
                _labTitle.text = @"用户名";
                _labValue.text = @"哈利路亚";
            }
                break;
            case 1:
            {
                _labTitle.text = @"性别";
                _labValue.text = @"男";
            }
                break;
            case 2:
            {
                _labTitle.text = @"所在地";
                _labValue.text = @"浙江 杭州";
            }
                break;
            case 3:
            {
                _labTitle.text = @"个人简介";
                _labValue.text = @"哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚哈利路亚";
            }
                break;
            default:
                break;
        }
    }
}

@end
