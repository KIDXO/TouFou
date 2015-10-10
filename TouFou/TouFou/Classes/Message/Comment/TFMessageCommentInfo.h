//
//  TFMessageCommentInfo.h
//  TouFou
//
//  Created by KID on 15/10/10.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFMessageCommentInfo : NSObject
/**
 *  用户头像
 */
@property (nonatomic, copy)     NSString *head;
/**
 *  用户昵称
 */
@property (nonatomic, copy)     NSString *name;
/**
 *  评论用户昵称
 */
@property (nonatomic, copy)     NSString *nameComment;
/**
 *  发布时间
 */
@property (nonatomic, copy)     NSString *time;
/**
 *  回复内容
 */
@property (nonatomic, copy)     NSString *response;
/**
 *  评论内容
 */
@property (nonatomic, copy)     NSString *comment;
/**
 *  回复内容显示
 */
@property (nonatomic, copy)     NSString *responseFormat;
/**
 *  评论内容显示
 */
@property (nonatomic, copy)     NSString *commentFormat;
/**
 *  回复内容大小
 */
@property (nonatomic, assign)   CGSize   responseSize;
/**
 *  评论内容大小
 */
@property (nonatomic, assign)   CGSize   commentSize;

@end
