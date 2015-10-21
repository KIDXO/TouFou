//
//  TFForgetViewController.h
//  TouFou
//
//  Created by KID on 15/10/20.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFForgetViewController : UIBaseViewController

@property (nonatomic, weak)   IBOutlet UIView               *viewAction;
@property (nonatomic, weak)   IBOutlet UIView               *viewPhone;
@property (nonatomic, weak)   IBOutlet UIView               *viewRound;

@property (nonatomic, weak)   IBOutlet UITextField          *textPhone;
@property (nonatomic, weak)   IBOutlet UIButton             *btnConfirm;

@end
