//
//  TFNetWorking.m
//  TouFou
//
//  Created by KID on 15/9/28.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFNetWorking.h"
#import "AFNetworking.h"
#import "UIApplication+NetworkActivityIndicator.h"

@implementation TFNetWorking

+ (BOOL)reachabilityWithURLString:(NSString *)URL
{
    __block BOOL state = NO;
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:URL]];
    
    NSOperationQueue *operationQueue = manager.operationQueue;
    
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];
                state = YES;
                break;
            case AFNetworkReachabilityStatusNotReachable:
                state = NO;
            default:
                [operationQueue setSuspended:YES];
                break;
        }
    }];
    
    [manager.reachabilityManager startMonitoring];
    
    return state;
}

+ (void)POST:(NSString *)URL
        params:(NSDictionary *)params
       success:(void (^)(id object))success
       failure:(void (^)(NSError *error))failure
{
    [[UIApplication sharedApplication] beganNetworkActivity];
    
    TFLog(@"POST: %@",URL);
    
    NSMutableDictionary *dicParams = nil;
    
    if (params) {
        dicParams = [params mutableCopy];
    }
    TFLog(@"Params:\n%@",dicParams);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:URL parameters:dicParams
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              if (success) {
                  success(responseObject);
              }
              [[UIApplication sharedApplication] endedNetworkActivity];
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              if (failure) {
                  failure(error);
              }
              [[UIApplication sharedApplication] endedNetworkActivity];
          }];
}

+ (void)POST:(NSString *)URL
      params:(NSDictionary *)params
    formData:(NSArray *)formData
     success:(void (^)(id object))success
     failure:(void (^)(NSError *error))failure
{
    [[UIApplication sharedApplication] beganNetworkActivity];
    
    TFLog(@"POST: %@",URL);
    
    NSMutableDictionary *dicParams = nil;
    
    if (params) {
        dicParams = [params mutableCopy];
    }
    TFLog(@"Params:\n%@",dicParams);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:URL parameters:dicParams constructingBodyWithBlock:^(id<AFMultipartFormData> totalFormData) {
        for (TFFormData *data in formData) {
            [totalFormData appendPartWithFileData:data.data name:data.name fileName:data.filename mimeType:data.mimeType];
        }
    }
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              if (success) {
                  success(responseObject);
              }
              [[UIApplication sharedApplication] endedNetworkActivity];
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              if (failure) {
                  failure(error);
              }
              [[UIApplication sharedApplication] endedNetworkActivity];
          }];
}

+ (void)GET:(NSString *)URL
     params:(NSDictionary *)params
    success:(void (^)(id object))success
    failure:(void (^)(NSError *error))failure
{
    [[UIApplication sharedApplication] beganNetworkActivity];
    
    TFLog(@"GET: %@",URL);
    
    NSMutableDictionary *dicParams = nil;
    
    if (params) {
        dicParams = [params mutableCopy];
    }
    TFLog(@"Params:\n%@",dicParams);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:URL parameters:dicParams
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             if (success) {
                 success(responseObject);
             }
             [[UIApplication sharedApplication] endedNetworkActivity];
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             if (failure) {
                 failure(error);
             }
             [[UIApplication sharedApplication] endedNetworkActivity];
         }];
}

@end

@implementation TFFormData

@end
