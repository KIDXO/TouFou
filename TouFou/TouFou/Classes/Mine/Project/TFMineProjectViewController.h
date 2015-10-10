//
//  TFMineProjectViewController.h
//  TouFou
//
//  Created by KID on 15/10/9.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TFMineProjectStyle) {
    TFMineProjectStyleRelease,  //发布的点评
    TFMineProjectStyleComment,  //收藏的点评
    TFMineProjectStyleFavorite  //收藏的项目
};

@interface TFMineProjectViewController : UIBaseViewController

@property (nonatomic, weak) IBOutlet UITableView    *tableView;
@property (nonatomic)       TFMineProjectStyle       style;

@end
