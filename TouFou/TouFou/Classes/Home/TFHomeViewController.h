//
//  TFHomeViewController.h
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFHomeCategoryView.h"

@interface TFHomeViewController : UIBaseViewController
<TFHomeCategoryViewDelegate>

@property (nonatomic, strong) NSMutableArray                *arySource;
@property (nonatomic, strong) NSMutableArray                *aryCategory;
@property (nonatomic, strong) NSMutableArray                *aryPeriod;

@property (nonatomic, weak)   IBOutlet UIButton             *btnSource;
@property (nonatomic, weak)   IBOutlet UIButton             *btnCategory;
@property (nonatomic, weak)   IBOutlet UIButton             *btnPeriod;

@property (nonatomic, weak)   IBOutlet UITableView          *tableView;
@property (nonatomic, weak)   IBOutlet TFHomeCategoryView   *tableCategory;
@property (nonatomic, weak)   IBOutlet UIView               *viewDark;

@end
