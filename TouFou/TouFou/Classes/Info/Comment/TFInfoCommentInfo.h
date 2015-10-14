//
//  TFInfoCommentInfo.h
//  TouFou
//
//  Created by KID on 15/10/13.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFInfoCommentResponseInfo.h"

@interface TFInfoCommentInfo : NSObject
/**
 *  用户头像
 */
@property (nonatomic, copy)     NSString *head;
/**
 *  用户昵称
 */
@property (nonatomic, copy)     NSString *name;
/**
 *  发布时间
 */
@property (nonatomic, copy)     NSString *time;
/**
 *  评论内容
 */
@property (nonatomic, copy)     NSString *comment;
/**
 *  回复内容
 */
@property (nonatomic, strong)   NSArray  *response;
/**
 *  评论内容大小
 */
@property (nonatomic, assign)   CGSize   commentSize;
/**
 *  回复内容大小
 */
@property (nonatomic, assign)   CGSize   responseSize;

@end
