//
//  TFPasswordViewController.h
//  TouFou
//
//  Created by KID on 15/10/22.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TFPasswordType) {
    TFPasswordTypeForget,   //忘记密码
    TFPasswordTypeEdit      //修改密码
};

@interface TFPasswordViewController : UIBaseViewController

@property (nonatomic)         TFPasswordType                 type;

@property (nonatomic, weak)   IBOutlet UIView               *viewAction;
@property (nonatomic, weak)   IBOutlet UIView               *viewCode;
@property (nonatomic, weak)   IBOutlet UIView               *viewPassword1;
@property (nonatomic, weak)   IBOutlet UIView               *viewPassword2;

@property (nonatomic, weak)   IBOutlet UITextField          *textCode;
@property (nonatomic, weak)   IBOutlet UITextField          *textPassword1;
@property (nonatomic, weak)   IBOutlet UITextField          *textPassword2;

@property (nonatomic, weak)   IBOutlet UIButton             *btnConfirm;

@end
