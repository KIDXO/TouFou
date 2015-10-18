//
//  TFHomeCategoryView.h
//  TouFou
//
//  Created by KID on 15/10/10.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TFHomeCategoryType) {
    TFHomeCategoryTypeSource,   //来源
    TFHomeCategoryTypeCategory, //分类
    TFHomeCategoryTypePeriod    //阶段
};

@protocol TFHomeCategoryViewDelegate <NSObject>

- (void)TFHomeCategoryViewSelect:(id)info type:(TFHomeCategoryType)type select:(NSInteger)select;

@end

@interface TFHomeCategoryView : UIView
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) NSInteger                          select;
@property (nonatomic, strong) UITableView                       *tableView;
@property (nonatomic, strong) NSArray                           *aryInfo;
@property (nonatomic, weak)   id <TFHomeCategoryViewDelegate>    delegate;
@property (nonatomic)         TFHomeCategoryType                 type;

- (void)setInfo:(NSArray *)ary type:(TFHomeCategoryType)type select:(NSInteger)select;

@end
