//
//  TFMineFansViewController.h
//  TouFou
//
//  Created by KID on 15/10/9.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TFMinePeopleStyle) {
    TFMinePeopleStyleFans,
    TFMinePeopleStyleFollow
};

@interface TFMineFansViewController : UIBaseViewController

@property (nonatomic, weak) IBOutlet UITableView    *tableView;
@property (nonatomic)       TFMinePeopleStyle        style;

@end
