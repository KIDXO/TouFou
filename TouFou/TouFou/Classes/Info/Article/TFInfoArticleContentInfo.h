//
//  TFInfoArticleContentInfo.h
//  TouFou
//
//  Created by KID on 15/10/14.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFInfoArticleContentInfo : NSObject
/**
 *  发布用户
 */
@property (nonatomic, copy)     NSString    *name;
/**
 *  发布时间
 */
@property (nonatomic, copy)     NSString    *time;
/**
 *  文章标题
 */
@property (nonatomic, copy)     NSString    *title;
/**
 *  文章内容
 */
@property (nonatomic, copy)     NSString    *content;
/**
 *  文章内容大小
 */
@property (nonatomic, assign)   CGSize      contentSize;

@end
