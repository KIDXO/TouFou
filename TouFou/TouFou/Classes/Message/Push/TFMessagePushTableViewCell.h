//
//  TFMessagePushTableViewCell.h
//  TouFou
//
//  Created by KID on 15/10/10.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFMessagePushTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView    *imgHead;
@property (nonatomic, weak) IBOutlet UILabel        *labName;
@property (nonatomic, weak) IBOutlet UILabel        *labTime;

- (void)setInfo;
- (void)setParallax:(UITableView *)tableView view:(UIView *)view;

@end
