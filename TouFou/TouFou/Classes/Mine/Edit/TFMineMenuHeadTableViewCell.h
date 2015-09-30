//
//  TFMineMenuHeadTableViewCell.h
//  TouFou
//
//  Created by KID on 15/9/30.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFMineMenuHeadTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel        *labTitle;
@property (nonatomic, weak) IBOutlet UILabel        *labValue;
@property (nonatomic, weak) IBOutlet UIView         *viewLine;

- (void)setIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView;

@end
