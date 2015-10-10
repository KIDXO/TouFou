//
//  TFMineFansTableViewCell.h
//  TouFou
//
//  Created by KID on 15/10/9.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFMineFansTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView    *imgHead;
@property (nonatomic, weak) IBOutlet UIButton       *btnAction;

@property (nonatomic, weak) IBOutlet UILabel        *labName;
@property (nonatomic, weak) IBOutlet UILabel        *labAbout;

@end
