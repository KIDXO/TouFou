//
//  TFMessageUpdateTableViewCell.h
//  TouFou
//
//  Created by KID on 15/10/10.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFMessageUpdateTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView    *imgHead;
@property (nonatomic, weak) IBOutlet UILabel        *labName;
@property (nonatomic, weak) IBOutlet UILabel        *labTime;
@property (nonatomic, weak) IBOutlet UILabel        *labContent;

@end
