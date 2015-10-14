//
//  TFInfoScoreValueCell.h
//  TouFou
//
//  Created by KID on 15/10/12.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHCircleGaugeView.h"

@interface TFInfoScoreValueCell : UITableViewCell

@property (nonatomic, weak)   IBOutlet UIView     *viewCircle;
@property (nonatomic, strong) CHCircleGaugeView   *viewGauge;

- (void)setInfo;

@end
