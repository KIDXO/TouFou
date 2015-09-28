//
//  TFNetWorking.h
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFNetWorking : NSObject

/**
 *  检测网络
 *
 *  @param URL  测试链接地址
 *
 *  @return 返回是否联网
 */
+ (BOOL)reachabilityWithURLString:(NSString *)URL;

/**
 *  异步POST请求
 *
 *  @param URL      请求路径
 *  @param params   请求参数
 *  @param success  请求成功后的回调
 *  @param failure  请求失败后的回调
 */
+ (void)POST:(NSString *)URL
        params:(NSDictionary *)params
       success:(void (^)(id object))success
       failure:(void (^)(NSError *error))failure;

/**
 *  异步POST请求(上传文件数据)
 *
 *  @param URL      请求路径
 *  @param params   请求参数
 *  @param formData 文件参数
 *  @param success  请求成功后的回调
 *  @param failure  请求失败后的回调
 */
+ (void)POST:(NSString *)URL
      params:(NSDictionary *)params
    formData:(NSArray *)formData
     success:(void (^)(id object))success
     failure:(void (^)(NSError *error))failure;

/**
 *  异步GET请求
 *
 *  @param URL      请求路径
 *  @param params   请求参数
 *  @param success  请求成功后的回调
 *  @param failure  请求失败后的回调
 */
+ (void)GET:(NSString *)URL
     params:(NSDictionary *)params
    success:(void (^)(id object))success
    failure:(void (^)(NSError *error))failure;

@end

/**
 *  上传文件数据模型
 */
@interface TFFormData : NSObject
/**
 *  数据
 */
@property (nonatomic, strong) NSData *data;

/**
 *  参数名
 */
@property (nonatomic, copy) NSString *name;

/**
 *  文件名
 */
@property (nonatomic, copy) NSString *filename;

/**
 *  文件类型
 */
@property (nonatomic, copy) NSString *mimeType;

@end
