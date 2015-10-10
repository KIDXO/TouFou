//
//  TFMonitorTableViewCell.h
//  TouFou
//
//  Created by KID on 15/10/8.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TFMonitorStyle) {
    TFMonitorStyleMoney,
    TFMonitorStyleComplete
};

@interface TFMonitorTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel        *labTitle;
@property (nonatomic, weak) IBOutlet UILabel        *labAbout;
@property (nonatomic, weak) IBOutlet UISwitch       *switchView;
@property (nonatomic, weak) IBOutlet UISlider       *sliderView;
@property (nonatomic)       TFMonitorStyle           style;

@end
