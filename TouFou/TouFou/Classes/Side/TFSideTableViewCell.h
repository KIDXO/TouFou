//
//  TFSideTableViewCell.h
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFSideTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView    *imgLogo;
@property (nonatomic, weak) IBOutlet UILabel        *labText;

- (void)setIndexPath:(NSIndexPath *)indexPath;

@end
