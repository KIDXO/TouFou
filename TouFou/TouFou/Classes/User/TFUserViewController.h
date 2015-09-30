//
//  TFUserViewController.h
//  TouFou
//
//  Created by KID on 15/9/30.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZNSegmentedControl.h"

@interface TFUserViewController : UIBaseViewController
<DZNSegmentedControlDelegate>

@property (nonatomic, weak)   IBOutlet UIImageView  *imgHead;
@property (nonatomic, weak)   IBOutlet UILabel      *labName;
@property (nonatomic, weak)   IBOutlet UILabel      *labAbout;
@property (nonatomic, weak)   IBOutlet UILabel      *labFollow;
@property (nonatomic, weak)   IBOutlet UILabel      *labFans;
@property (nonatomic, weak)   IBOutlet UIButton     *btnFollow;

@property (nonatomic, weak)   IBOutlet UIView       *viewInfo;
@property (nonatomic, weak)   IBOutlet UIView       *viewSegment;

@property (nonatomic, weak)   IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak)   IBOutlet UIScrollView *scrollViewTable;
@property (nonatomic, weak)   IBOutlet UITableView  *tableView;

@property (nonatomic, strong) DZNSegmentedControl   *controlSegment;

@end
