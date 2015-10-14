//
//  TFInfoAdviceTableView.h
//  TouFou
//
//  Created by KID on 15/10/12.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TFInfoAdviceTableViewDelegate <NSObject>

- (void)TFInfoAdviceTableView:(UIScrollView *)scrollView;

@end

@interface TFInfoAdviceTableView : UIView
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) CGFloat                                heightHeader;
@property (nonatomic, strong) UITableView                           *tableView;
@property (nonatomic, weak)   id <TFInfoAdviceTableViewDelegate>     delegate;

@end
