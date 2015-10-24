//
//  TFUserTableView.h
//  TouFou
//
//  Created by KID on 15/10/8.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TFUserTableStyle) {
    TFUserTableStyleRelease,    //发布的点评
    TFUserTableStyleComment,    //收藏的点评
    TFUserTableStyleFavorite    //收藏的项目
};

@protocol TFUserTableViewDelegate <NSObject>

- (void)TFUserTableView:(UIScrollView *)scrollView;

@end

@interface TFUserTableView : UIView
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView                  *tableView;
@property (nonatomic, weak)   id <TFUserTableViewDelegate>  delegate;
@property (nonatomic)         TFUserTableStyle              style;

@end
