//
//  TFHomeTableViewCell.h
//  TouFou
//
//  Created by KID on 15/9/29.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFHomeTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel        *labTitle;
@property (nonatomic, weak) IBOutlet UILabel        *labAbout;

@property (nonatomic, weak) IBOutlet UIImageView    *imgCover;

@property (nonatomic, weak) IBOutlet UIButton       *btnTotal;
@property (nonatomic, weak) IBOutlet UIButton       *btnMoney;
@property (nonatomic, weak) IBOutlet UILabel        *labComplete;

@end
