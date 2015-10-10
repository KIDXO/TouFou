//
//  TFVCManager.h
//  TouFou
//
//  Created by KID on 15/10/11.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFVCManager : NSObject

/**
 *  显示项目详情视图
 *
 *  @param params   传入参数
 *  @param animated 动画效果
 */
+ (void)pushInfo:(id)params animated:(BOOL)animated;

@end
