//
//  TFSideViewController.h
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFSideViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView    *imgHead;
@property (nonatomic, weak) IBOutlet UILabel        *labName;
@property (nonatomic, weak) IBOutlet UILabel        *labAbout;

@property (nonatomic, weak) IBOutlet UILabel        *labProject;
@property (nonatomic, weak) IBOutlet UILabel        *labFollow;
@property (nonatomic, weak) IBOutlet UILabel        *labFans;

@property (nonatomic, weak) IBOutlet UITableView    *tableView;

@end
