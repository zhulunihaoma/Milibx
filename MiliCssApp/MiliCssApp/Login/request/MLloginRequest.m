//
//  MLloginRequest.m
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/26.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "MLloginRequest.h"
#import "MLHttpTools.h"
@implementation MLloginRequest
/**
 *  2:普通登录
 */


+ (void)PostLoginWithloginName:(NSString *)loginName WithPassword:(NSString *)passWord token:(NSString *)token  Success:(HLSSuccess)success failure:(HLSHttpFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/customer/bdLogin",RequestUrl];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (loginName) {
        [param setValue:loginName forKey:@"loginName"];
    }
    if (passWord) {
        [param setValue:passWord forKey:@"passWord"];
    }
    if (token) {
        [param setValue:token forKey:@"token"];
    }
    
    
    [MLHttpTools postWithURL:url params:param success:^(id json) {
        success(json);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}
@end
