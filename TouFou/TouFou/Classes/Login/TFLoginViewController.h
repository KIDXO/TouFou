//
//  TFLoginViewController.h
//  TouFou
//
//  Created by KID on 15/10/19.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFLoginViewController : UIBaseViewController

@property (nonatomic, weak)   IBOutlet UIView               *viewAction;
@property (nonatomic, weak)   IBOutlet UIView               *viewAccount;
@property (nonatomic, weak)   IBOutlet UIView               *viewPassword;

@property (nonatomic, weak)   IBOutlet UITextField          *textAccount;
@property (nonatomic, weak)   IBOutlet UITextField          *textPassword;

@property (nonatomic, weak)   IBOutlet UIButton             *btnConfirm;
@end
