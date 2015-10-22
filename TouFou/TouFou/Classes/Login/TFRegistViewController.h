//
//  TFRegistViewController.h
//  TouFou
//
//  Created by KID on 15/10/22.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFRegistViewController : UIBaseViewController

@property (nonatomic, weak)   IBOutlet UIView               *viewAction;
@property (nonatomic, weak)   IBOutlet UIView               *viewAccount;
@property (nonatomic, weak)   IBOutlet UIView               *viewPassword1;
@property (nonatomic, weak)   IBOutlet UIView               *viewPassword2;

@property (nonatomic, weak)   IBOutlet UITextField          *textAccount;
@property (nonatomic, weak)   IBOutlet UITextField          *textPassword1;
@property (nonatomic, weak)   IBOutlet UITextField          *textPassword2;

@property (nonatomic, weak)   IBOutlet UIButton             *btnConfirm;

@end
