//
//  TFMineDraftViewController.h
//  TouFou
//
//  Created by KID on 15/10/9.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFMineDraftViewController : UIBaseViewController

@property (nonatomic, weak)   IBOutlet UITableView  *tableView;
@property (nonatomic, weak)   IBOutlet UIView       *viewAction;
@property (nonatomic, strong) NSMutableArray        *aryListSelect;

@end
