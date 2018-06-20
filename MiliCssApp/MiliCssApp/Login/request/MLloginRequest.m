//
//  MLloginRequest.m
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/26.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "MLloginRequest.h"
#import "MLHttpTools.h"
#import "JSONTool.h"
@implementation MLloginRequest
/**
 * 1： 验证码
 */

+ (void)PostCertifyNumWithphoneNo:(NSString *)phoneNo
                      templateCode:(NSString *)templateCode
                           Success:(HLSSuccess)success failure:(HLSHttpFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/app/sendValidCode",RequestUrl];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (phoneNo) {
        [param setValue:phoneNo forKey:@"phoneNo"];
    }
    if (templateCode) {
        [param setValue:templateCode forKey:@"templateCode"];
    }
    
   
//   NSString *paramstring = [JSONTool dictionaryToJson:param];

    
    
    [MLHttpTools postWithURL:url params:param success:^(id json) {
        success(json);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
/**
 *  2:普通登录
 */


+ (void)PostLoginWithloginName:(NSString *)loginName WithPassword:(NSString *)passWord token:(NSString *)token  Success:(HLSSuccess)success failure:(HLSHttpFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/merchant/login",RequestUrl];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (loginName) {
        [param setValue:loginName forKey:@"userName"];
    }
    if (passWord) {
        [param setValue:passWord forKey:@"password"];
    }
    if (token) {
        [param setValue:token forKey:@"openId"];
    }
    
    
    [MLHttpTools postWithURL:url params:param success:^(id json) {
        success(json);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}
/**
 *  3:验证身份证和手机号码
 */

+ (void)PostverifyResetPwdCodeByAppWithphoneCode:(NSString *)phoneCode WithphoneNo:(NSString *)phoneNo templateCode:(NSString *)templateCode cardNo:(NSString *)cardNo Success:(HLSSuccess)success failure:(HLSHttpFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/merchant/verifyResetPwdCodeByApp",RequestUrl];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (phoneCode) {
        [param setValue:phoneCode forKey:@"phoneCode"];
    }
    if (phoneNo) {
        [param setValue:phoneNo forKey:@"phoneNo"];
    }
    if (templateCode) {
        [param setValue:templateCode forKey:@"templateCode"];
    }
    if (cardNo) {
        [param setValue:cardNo forKey:@"cardNo"];
    }
    
    
    [MLHttpTools postWithURL:url params:param success:^(id json) {
        success(json);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
/**
 *  4:重置密码
 */

+ (void)PostForgetPassWithnewPwd:(NSString *)newPwd confirmPwd:(NSString *)confirmPwd cardNo:(NSString *)cardNo Success:(HLSSuccess)success failure:(HLSHttpFailure)failure{
    
    NSString *url = [NSString stringWithFormat:@"%@/merchant/resetPwd",RequestUrl];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (newPwd) {
        [param setValue:newPwd forKey:@"newPwd"];
    }
    if (confirmPwd) {
        [param setValue:confirmPwd forKey:@"confirmPwd"];
    }
    if (cardNo) {
        [param setValue:cardNo forKey:@"cardNo"];
    }
    
    
    [MLHttpTools postWithURL:url params:param success:^(id json) {
        success(json);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
/**
 *  5:修改密码
 */

+ (void)PostmodifyPwdWitholdPwd:(NSString *)oldPwd newPwd:(NSString *)newPwd confirmPwd:(NSString *)confirmPwd Success:(HLSSuccess)success failure:(HLSHttpFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/merchant/modifyPwd",RequestUrl];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (oldPwd) {
        [param setValue:oldPwd forKey:@"oldPwd"];
    }
    if (newPwd) {
        [param setValue:newPwd forKey:@"newPwd"];
    }
    if (confirmPwd) {
        [param setValue:confirmPwd forKey:@"confirmPwd"];
    }
    
    
    [MLHttpTools postWithURL:url params:param success:^(id json) {
        success(json);
    } failure:^(NSError *error) {
        failure(error);
    }];
}


@end
