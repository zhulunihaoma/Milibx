//
//  MLMyRequest.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/6/15.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "MLMyRequest.h"
#import "MLHttpTools.h"
#import "JSONTool.h"
@implementation MLMyRequest
/**
 *  1： 退出登录
 */

+ (void)PostlogoutSuccess:(HLSSuccess)success failure:(HLSHttpFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/logout",RequestUrl];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [MLHttpTools postWithURL:url params:param success:^(id json) {
        success(json);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}

/**
 *  2： 海报列表&海报详情
 */

+ (void)PostposterListWithproductCode:(NSString *)productCode merchantCode:(NSString *)merchantCode pageIndex:(NSInteger )pageIndex pageSize:(NSInteger )pageSize Success:(HLSSuccess)success failure:(HLSHttpFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/posterList",RequestUrl];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (productCode) {
        [param setValue:productCode forKey:@"productCode"];
    }
    if (merchantCode) {
        [param setValue:merchantCode forKey:@"merchantCode"];
    }

    [MLHttpTools postWithURL:url params:param success:^(id json) {
        success(json);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
/**
 *  3： 代理人信息
 */

+ (void)PostbdinfoSuccess:(HLSSuccess)success failure:(HLSHttpFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/user/bdInfo",RequestUrl];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [MLHttpTools postWithURL:url params:param success:^(id json) {
        success(json);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
/**
 *  4： 保费信息
 */

+ (void)PostuserCenterSuccess:(HLSSuccess)success failure:(HLSHttpFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/userCenter",RequestUrl];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [MLHttpTools postWithURL:url params:param success:^(id json) {
        success(json);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
#pragma mark -- 其他
/**
 *  1:上传图片
 */


+ (void)PostUploadPictureWithfile:(NSData *)file Success:(HLSSuccess)success failure:(HLSHttpFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/uploadPicture",RequestUrl];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];

    
    [MLHttpTools postImageWithURL:url imageData:file param:param success:^(id json) {
        success(json);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
