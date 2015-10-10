//
//  TFUserTableView.h
//  TouFou
//
//  Created by KID on 15/10/8.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TFUserTableViewDelegate <NSObject>

- (void)TFUserTableView:(UIScrollView *)scrollView;

@end

@interface TFUserTableView : UIView
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView                  *tableView;
@property (nonatomic, weak)   id <TFUserTableViewDelegate>  delegate;

@end
