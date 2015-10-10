//
//  TFMessagePushTableViewCell.m
//  TouFou
//
//  Created by KID on 15/10/10.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFMessagePushTableViewCell.h"

@implementation TFMessagePushTableViewCell

- (void)awakeFromNib
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)setInfo
{
    NSString *str = @"";
    
    int value = (arc4random() % 13) + 1;
    switch (value) {
        case 1: {
            str = @"http://222.76.211.84/rosi/sishu/025/d.jpg";
        }
            break;
        case 2: {
            str = @"http://tu.68flash.com/img/yp/yp12.jpg";
        }
            break;
        case 3: {
            str = @"http://222.76.211.84/rosi/image/1402/d.jpg";
        }
            break;
        case 4: {
            str = @"http://222.76.211.84/rosi/shipin/106/d.jpg";
        }
            break;
        case 5: {
            str = @"http://222.76.211.84/rosi/image/1400/d.jpg";
        }
            break;
        case 6: {
            str = @"http://tu.68flash.com/rosi/image/1391/d.jpg";
        }
            break;
        case 7: {
            str = @"http://222.76.211.84/rosi/image/1386/d.jpg";
        }
            break;
        case 8: {
            str = @"http://222.76.211.84/rosi/image/1381/d.jpg";
        }
            break;
        case 9: {
            str = @"http://222.76.211.84/rosi/image/1379/d.jpg";
        }
            break;
        case 10: {
            str = @"http://222.76.211.84/rosi/image/1378/d.jpg";
        }
            break;
        case 11: {
            str = @"http://222.76.211.84/rosi/image/1370/d.jpg";
        }
            break;
        case 12: {
            str = @"http://222.76.211.84/rosi/image/1368/d.jpg";
        }
            break;
        case 13: {
            str = @"http://222.76.211.84/rosi/image/1363/d.jpg";
        }
            break;
        default:
            break;
    }
    
    [_imgHead sd_setImageWithURL:[NSURL URLWithString:str]
                placeholderImage:[UIImage imageNamed:@"TFPlaceholderHead"]
                       completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                           
                       }];
}

- (void)setParallax:(UITableView *)tableView view:(UIView *)view
{
    CGRect frame = [tableView convertRect:self.frame toView:view];
    
    float center   = CGRectGetHeight(view.frame) / 2 - CGRectGetMinY(frame);
    float parallax = CGRectGetHeight(_imgHead.frame) - CGRectGetHeight(self.frame);
    float index    =(center / CGRectGetHeight(view.frame)) * parallax;
    
    _imgHead.origin = CGPointMake(_imgHead.origin.x, - (parallax / 2) + index);
}

@end
