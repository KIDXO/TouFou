//
//  TFMessageCommentViewController.h
//  TouFou
//
//  Created by KID on 15/10/10.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFMessageCommentTableViewCell.h"

@interface TFMessageCommentViewController : UIBaseViewController

@property (nonatomic, strong) NSMutableArray        *aryInfo;

@property (nonatomic, weak)   IBOutlet UITableView  *tableView;

@end
