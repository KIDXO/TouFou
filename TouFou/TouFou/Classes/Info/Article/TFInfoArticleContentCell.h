//
//  TFInfoArticleContentCell.h
//  TouFou
//
//  Created by KID on 15/10/14.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFInfoArticleContentInfo.h"

@interface TFInfoArticleContentCell : UITableViewCell

@property (nonatomic, strong)   TFInfoArticleContentInfo    *info;
@property (nonatomic, weak)     IBOutlet UILabel            *labTime;
@property (nonatomic, weak)     IBOutlet UILabel            *labTitle;
@property (nonatomic, weak)     IBOutlet UILabel            *labContent;

@end
