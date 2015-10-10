//
//  TFMonitorTableViewCell.m
//  TouFou
//
//  Created by KID on 15/10/8.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFMonitorTableViewCell.h"

@implementation TFMonitorTableViewCell

- (void)awakeFromNib
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)setStyle:(TFMonitorStyle)style
{
    _style = style;
    
    switch (_style)
    {
        case TFMonitorStyleMoney:
        {
            _labTitle.text = @"起投额监控";
            _labAbout.text = @"将起投额小于10万的项目推送给我";
            NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:_labAbout.text];
            [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor]
                        range:NSMakeRange(6, _labAbout.text.length - 14)];
            _labAbout.attributedText = str;
            _sliderView.minimumValue = 1;
            _sliderView.maximumValue = 5;
            _sliderView.value = 1;
        }
            break;
        case TFMonitorStyleComplete:
        {
            _labTitle.text = @"完成率监控";
            _labAbout.text = @"将完成率小于10%的项目推送给我";
            NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:_labAbout.text];
            [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor]
                        range:NSMakeRange(6, _labAbout.text.length - 14)];
            _labAbout.attributedText = str;
            _sliderView.minimumValue = 1;
            _sliderView.maximumValue = 10;
            _sliderView.value = 1;
        }
            break;
        default:
            break;
    }
}

- (IBAction)sliderChange:(UISlider *)sender
{
    NSUInteger index = (NSUInteger)(sender.value + 0.5);
    [sender setValue:index animated:NO];
    
    switch (_style)
    {
        case TFMonitorStyleMoney:
        {
            NSString *strMoney = @"0";
            switch (index) {
                case 1: {
                    strMoney = @"5";
                }
                    break;
                case 2: {
                    strMoney = @"10";
                }
                    break;
                case 3: {
                    strMoney = @"20";
                }
                    break;
                case 4: {
                    strMoney = @"30";
                }
                    break;
                case 5: {
                    strMoney = @"50";
                }
                    break;
                default:
                    break;
            }
            _labAbout.text = [NSString stringWithFormat:@"将起投额小于%@万的项目推送给我",strMoney];
            NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:_labAbout.text];
            [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor]
                        range:NSMakeRange(6, _labAbout.text.length - 14)];
            _labAbout.attributedText = str;
        }
            break;
        case TFMonitorStyleComplete:
        {
            _labAbout.text = [NSString stringWithFormat:@"将完成率小于%.f%%的项目推送给我",sender.value * 10];
            NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:_labAbout.text];
            [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor]
                        range:NSMakeRange(6, _labAbout.text.length - 14)];
            _labAbout.attributedText = str;
        }
            break;
        default:
            break;
    }
}

@end
