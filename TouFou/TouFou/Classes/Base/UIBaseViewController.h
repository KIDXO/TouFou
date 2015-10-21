//
//  UIBaseViewController.h
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBaseViewController : UIViewController

/**
 *  自定义标题
 */
@property (nonatomic, copy)  NSString * __nullable titleCustom;

/**
 *  设置上个视图控制器的导航栏状态,默认NO显示
 */
//@property (nonatomic, assign) BOOL navigationBarHidden_Old;
/**
 *  设置当前视图控制器的导航栏状态,默认NO显示
 */
//@property (nonatomic, assign) BOOL navigationBarHidden_New;

/**
 *  创建右侧按钮
 */
- (void)createCustomButton:(nullable NSString *)title
                    target:(nullable id)target
                    action:(nullable SEL)action;
/**
 *  创建返回按钮
 */
- (void)createReturnButton;
/**
 *  点击返回事件
 */
- (void)actionReturn;

/**
 *  返回顶层窗口
 */
- (nullable UIWindow *)window;

@end
