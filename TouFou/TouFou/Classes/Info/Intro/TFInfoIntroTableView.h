//
//  TFInfoIntroTableView.h
//  TouFou
//
//  Created by KID on 15/10/12.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TFInfoIntroTableViewDelegate <NSObject>

- (void)TFInfoIntroTableView:(UIScrollView *)scrollView;

@end

@interface TFInfoIntroTableView : UIView
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) CGFloat                            heightHeader;
@property (nonatomic, strong) UITableView                       *tableView;
@property (nonatomic, weak)   id <TFInfoIntroTableViewDelegate>  delegate;

@end
