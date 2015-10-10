//
//  TFMonitorViewController.h
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFMonitorViewController : UIBaseViewController

@property (nonatomic, weak)   IBOutlet UITableView  *tableView;
@property (nonatomic, weak)   IBOutlet UIView       *viewAdding;
@property (nonatomic, weak)   IBOutlet UIDatePicker *datePicker;
@property (nonatomic, strong) NSMutableArray        *aryRemind;

@end
