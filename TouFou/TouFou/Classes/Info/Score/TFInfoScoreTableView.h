//
//  TFInfoScoreTableView.h
//  TouFou
//
//  Created by KID on 15/10/12.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TFInfoScoreTableViewDelegate <NSObject>

- (void)TFInfoScoreTableView:(UIScrollView *)scrollView;

@end

@interface TFInfoScoreTableView : UIView
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) CGFloat                            heightHeader;
@property (nonatomic, strong) UITableView                       *tableView;
@property (nonatomic, weak)   id <TFInfoScoreTableViewDelegate>  delegate;

@end
