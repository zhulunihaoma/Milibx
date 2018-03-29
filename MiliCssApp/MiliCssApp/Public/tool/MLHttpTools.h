//
//  MLHttpTools.h
//  MiliCssApp
//
//  Created by Milizhu on 2018/3/26.
//  Copyright © 2018年 zhu. All rights reserved.
//


#import <Foundation/Foundation.h>

typedef void (^HLSSuccess)(NSDictionary *dic);

/**
 *  请求成功后的回调
 *
 *  @param json 服务器返回的JSON数据
 */
typedef void (^HLSHttpSuccess)(id json);
/**
 *  请求失败后的回调
 *
 *  @param error 错误信息
 */
typedef void (^HLSHttpFailure)(NSError *error);


@interface MLHttpTools : NSObject

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(HLSHttpSuccess)success failure:(HLSHttpFailure)failure;

/**
 *  上传图片
 *
 *  @param url       请求路劲
 *  @param imageData data
 *  @param success
 *  @param failure
 */
+ (void)postImageWithURL:(NSString *)url imageData:(NSData *)imageDatas param:(NSDictionary *)param success:(HLSHttpSuccess)success failure:(HLSHttpFailure)failure;

/**
 *  get请求
 */
+ (void)GetWithURL:(NSString *)url
            params:(NSDictionary *)params
      successBlock:(void(^)(BOOL isSuccess, NSDictionary *resultDic))successBlock
      failureBlock:(void(^)(NSError *error))failureBlock;



+ (void)PostWithURL:(NSString *)url
             params:(NSDictionary *)params
       successBlock:(void(^)(BOOL isSuccess, NSDictionary *resultDic))successBlock
       failureBlock:(void(^)(NSError *error))failureBlock;
/**
 *  系统请求
 *
 *  @param url     <#url description#>
 *  @param params  <#params description#>
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
+ (void)postSystemRequestWithURL:(NSString *)url params:(NSDictionary *)params success:(HLSHttpSuccess)success failure:(HLSHttpFailure)failure;
@end

