//
//  TFInfoScoreValueCell.m
//  TouFou
//
//  Created by KID on 15/10/12.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFInfoScoreValueCell.h"

@implementation TFInfoScoreValueCell

- (void)awakeFromNib
{
    if (_viewGauge == nil) {
        _viewGauge = [[CHCircleGaugeView alloc] initWithFrame:_viewCircle.bounds];
        _viewGauge.state = CHCircleGaugeViewStateScore;
        _viewGauge.translatesAutoresizingMaskIntoConstraints = NO;
        _viewGauge.trackWidth = 5;
        _viewGauge.gaugeWidth = 5;
        _viewGauge.trackTintColor = [UIColor grayColor];
        _viewGauge.gaugeTintColor = [UIColor redColor];
        _viewGauge.textColor = [UIColor blackColor];
        _viewGauge.font = [UIFont systemFontOfSize:20];
        _viewGauge.value = 0;
        _viewGauge.unitsString = @"%";
        [_viewCircle addSubview:_viewGauge];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_viewGauge
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_viewCircle
                                                         attribute:NSLayoutAttributeHeight
                                                        multiplier:1
                                                          constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_viewGauge
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_viewGauge
                                                         attribute:NSLayoutAttributeHeight
                                                        multiplier:1
                                                          constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_viewGauge
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_viewCircle
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1
                                                          constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_viewGauge
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_viewCircle
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1
                                                          constant:0]];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)setInfo
{
    [_viewGauge setValue:0.9 animated:YES];
}

@end
