//
//  TFInfoArticleViewController.h
//  TouFou
//
//  Created by KID on 15/10/14.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFInfoArticleContentInfo.h"

@interface TFInfoArticleViewController : UIBaseViewController

@property (nonatomic, strong)   TFInfoArticleContentInfo    *info;
@property (nonatomic, weak)     IBOutlet UITableView        *tableView;
@property (nonatomic, strong)            UIImageView        *imgHead;

@end
