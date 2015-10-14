//
//  TFInfoAdviceContentCell.h
//  TouFou
//
//  Created by KID on 15/10/12.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFInfoAdviceContentCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView    *imgHead;
@property (nonatomic, weak) IBOutlet UILabel        *labName;
@property (nonatomic, weak) IBOutlet UILabel        *labTime;
@property (nonatomic, weak) IBOutlet UILabel        *labTitle;
@property (nonatomic, weak) IBOutlet UILabel        *labContent;

@end
