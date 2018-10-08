//
//  MLHttpTools.m
//  MiliCssApp
//
//  Created by Milizhu on 2018/3/26.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "MLHttpTools.h"
#import "AFNetworking.h"
#import "HLSLable.h"
#import "MBProgressHUD.h"
#import "LoginViewController.h"
#import "JSONTool.h"
@interface MLHttpTools ()<MBProgressHUDDelegate>

@end
@implementation MLHttpTools
+ (void)postWithURL:(NSString *)url params:(id)params success:(HLSHttpSuccess)success failure:(HLSHttpFailure)failure
{
    [self PostWithURL:url params:params successBlock:^(BOOL isSuccess, NSDictionary *resultDic) {
        if (isSuccess) {
            success(resultDic);
        } else {
            
        }
    } failureBlock:^(NSError *error) {
        failure(error);
    }];
}


+ (void)postImageWithURL:(NSString *)url imageData:(NSData *)imageData param:(NSDictionary *)param success:(HLSHttpSuccess)success failure:(HLSHttpFailure)failure
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    [ manager.requestSerializer setValue:@"json" forHTTPHeaderField:@"dataType"];
    
    
//    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:CurrentWindow animated:YES];
    [manager POST:url parameters:param  constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
        
        NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", currentDateStr];
        
        [formData appendPartWithFileData:imageData name:@"file" fileName:fileName mimeType:@"image/jpeg"];
        
    } success:^(NSURLSessionDataTask *operation, id responseObject) {
//        [HUD hide:YES];
        success(responseObject);
        
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
//        [HUD hide:YES];
        failure(error);
        
    }];
}



+ (void)GetWithURL:(NSString *)url
            params:(NSDictionary *)params
      successBlock:(void(^)(BOOL isSuccess, NSDictionary *resultDic))successBlock
      failureBlock:(void(^)(NSError *error))failureBlock
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 15;
    [manager GET:url parameters:params success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        successBlock(YES, responseObject);
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        failureBlock(error);
        HLSLog(@"网络错误url===%@",url);
        HLSLog(@"Error: %@", [error description]);
        HLSLog ( @"operation: %@" , operation. taskDescription );
        [HLSLable lableWithText:@"网络错误，请稍后再试"];
        
    }];
}


+ (void)PostWithURL:(NSString *)url
             params:(NSMutableDictionary *)params
       successBlock:(void(^)(BOOL isSuccess, NSDictionary *resultDic))successBlock
       failureBlock:(void(^)(NSError *error))failureBlock
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 15.f;
  
  

    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
  
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    [ manager.requestSerializer setValue:@"json" forHTTPHeaderField:@"dataType"];
    
    HLSLog(@"cokie--:%@",[HLSPersonalInfoTool getCookies]);
    if ([HLSPersonalInfoTool getCookies]) {
        [manager.requestSerializer setValue:[JSONTool dictionaryToJson:[HLSPersonalInfoTool getCookies]]  forHTTPHeaderField:@"cookies"];
            HLSLog(@"----AF返回%@",[JSONTool dictionaryToJson:[HLSPersonalInfoTool getCookies]] );


    }

//    HLSLog(@"----AF返回%@",[JSONTool dictionaryToJson:[HLSPersonalInfoTool getCookies]] );
//
//    [manager.requestSerializer
//     setValue:@"application/json"
//
//     forHTTPHeaderField:@"Accept"];
//
//    [manager.requestSerializer
//     setValue:@"application/json"
//     forHTTPHeaderField:@"Content-Type"];
//

//    [params setValue:[HLSPersonalInfoTool getdeviceId] forKey:@"deviceId"];

    
    [manager POST:url parameters: params success:^(NSURLSessionDataTask *operation, id responseObject) {
        responseObject = [NSMutableDictionary dictionaryWithDictionary:responseObject];
  
        if ([[responseObject xyValueForKey:@"code"] integerValue] == 10013333) {
            [responseObject setValue:@"10013333" forKey:@"message"];
            
            [mUserDefaults removeObjectForKey:KUserInfoDic];
            [mUserDefaults setObject:@"1" forKey:@"isTag"];
            [mUserDefaults synchronize];
            
        }
        if ([[responseObject xyValueForKey:@"code"] integerValue] == 10016020) {
            [responseObject setValue:@"10016020" forKey:@"message"];
            
            [mUserDefaults removeObjectForKey:KUserInfoDic];
            [mUserDefaults setObject:@"1" forKey:@"isTag"];
            [mUserDefaults synchronize];
            
        }
        
        successBlock(YES,responseObject);
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        failureBlock(error);
        HLSLog(@"网络错误url===%@",url);
        HLSLog(@"Error: %@", [error description]);
        HLSLog ( @"operation: %@" , operation. taskDescription );
        [HLSLable lableWithText:@"网络错误，请稍后再试"];
    }];
    
    
}
+ (void)postSystemRequestWithURL:(NSString *)url params:(NSDictionary *)params success:(HLSHttpSuccess)success failure:(HLSHttpFailure)failure {
    NSError * parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:&parseError];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:url]];
    request.timeoutInterval = 15.0f;
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:jsonData];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            success(json);
        });
    }];
    [task resume];
}
@end
