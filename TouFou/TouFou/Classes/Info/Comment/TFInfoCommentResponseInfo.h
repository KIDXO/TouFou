//
//  TFInfoCommentResponseInfo.h
//  TouFou
//
//  Created by KID on 15/10/13.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFInfoCommentResponseInfo : NSObject
/**
 *  用户昵称
 */
@property (nonatomic, copy)     NSString *name;
/**
 *  回复用户昵称
 */
@property (nonatomic, copy)     NSString *nameResponse;
/**
 *  回复内容
 */
@property (nonatomic, copy)     NSString *response;
/**
 *  回复内容显示
 */
@property (nonatomic, copy)     NSString *responseFormat;
/**
 *  回复内容大小
 */
@property (nonatomic, assign)   CGSize   responseSize;

@end
