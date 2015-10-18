//
//  TFHomeViewController.h
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFHomeCategoryView.h"

typedef NS_ENUM(NSInteger, TFHomeCategoryState) {
    TFHomeCategoryStateNone,        //关闭
    TFHomeCategoryStateSource,      //来源
    TFHomeCategoryStateCategory,    //分类
    TFHomeCategoryStatePeriod       //阶段
};

@interface TFHomeViewController : UIBaseViewController
<TFHomeCategoryViewDelegate>

@property (nonatomic, assign) TFHomeCategoryState            stateCategory;

@property (nonatomic, strong) NSMutableArray                *arySource;
@property (nonatomic, strong) NSMutableArray                *aryCategory;
@property (nonatomic, strong) NSMutableArray                *aryPeriod;

@property (nonatomic, assign) NSInteger                      indexSource;
@property (nonatomic, assign) NSInteger                      indexCategory;
@property (nonatomic, assign) NSInteger                      indexPeriod;

@property (nonatomic, weak)   IBOutlet UIButton             *btnSource;
@property (nonatomic, weak)   IBOutlet UIButton             *btnCategory;
@property (nonatomic, weak)   IBOutlet UIButton             *btnPeriod;

@property (nonatomic, weak)   IBOutlet UIImageView          *imgSource;
@property (nonatomic, weak)   IBOutlet UIImageView          *imgCategory;
@property (nonatomic, weak)   IBOutlet UIImageView          *imgPeriod;

@property (nonatomic, weak)   IBOutlet UITableView          *tableView;
@property (nonatomic, weak)   IBOutlet TFHomeCategoryView   *tableCategory;

@property (nonatomic, weak)   IBOutlet UIView               *viewDark;

@end
