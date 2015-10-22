//
//  TFVerifyViewController.h
//  TouFou
//
//  Created by KID on 15/10/22.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TFVerifyType) {
    TFVerifyTypeForget,     //忘记密码
    TFVerifyTypeRegist      //注册验证
};

@interface TFVerifyViewController : UIBaseViewController

@property (nonatomic)         TFVerifyType                   type;

@property (nonatomic, weak)   IBOutlet UIView               *viewAction;
@property (nonatomic, weak)   IBOutlet UIView               *viewPhone;
@property (nonatomic, weak)   IBOutlet UIView               *viewRound;

@property (nonatomic, weak)   IBOutlet UITextField          *textPhone;

@property (nonatomic, weak)   IBOutlet UIButton             *btnConfirm;

@end
