//
//  MLloginRequest.h
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/26.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLHttpTools.h"
@interface MLloginRequest : NSObject
#pragma mark -- 1:用户模块
/**
 * 0： 启动页图片
 */

+ (void)PoststartimgSuccess:(HLSSuccess)success failure:(HLSHttpFailure)failure;
/**
 * 1： 验证码
 */

+ (void)PostCertifyNumWithphoneNo:(NSString *)phoneNo
                              templateCode:(NSString *)templateCode
                           Success:(HLSSuccess)success failure:(HLSHttpFailure)failure;


/**
 * 1.1： 轮播图
 */

+ (void)PostlunboWithpart:(NSString *)part
                  Success:(HLSSuccess)success failure:(HLSHttpFailure)failure;


/**
 *  2:普通登录
 */

+ (void)PostLoginWithloginName:(NSString *)loginName WithPassword:(NSString *)passWord token:(NSString *)token  Success:(HLSSuccess)success failure:(HLSHttpFailure)failure;

/**
 *  3:验证身份证和手机号码
 */

+ (void)PostverifyResetPwdCodeByAppWithphoneCode:(NSString *)phoneCode WithphoneNo:(NSString *)phoneNo templateCode:(NSString *)templateCode cardNo:(NSString *)cardNo Success:(HLSSuccess)success failure:(HLSHttpFailure)failure;

/**
 *  4:重置密码
 */

+ (void)PostForgetPassWithnewPwd:(NSString *)newPwd confirmPwd:(NSString *)confirmPwd cardNo:(NSString *)cardNo Success:(HLSSuccess)success failure:(HLSHttpFailure)failure;
/**
 *  5:修改密码
 */

+ (void)PostmodifyPwdWitholdPwd:(NSString *)oldPwd newPwd:(NSString *)newPwd confirmPwd:(NSString *)confirmPwd Success:(HLSSuccess)success failure:(HLSHttpFailure)failure;

@end
