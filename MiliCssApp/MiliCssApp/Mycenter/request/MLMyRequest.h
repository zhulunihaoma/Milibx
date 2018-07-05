//
//  MLMyRequest.h
//  MiliCssApp
//
//  Created by 朱璐 on 2018/6/15.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLHttpTools.h"

@interface MLMyRequest : NSObject
/**
 *  1： 退出登录
 */

+ (void)PostlogoutSuccess:(HLSSuccess)success failure:(HLSHttpFailure)failure;
/**
 *  2： 海报列表&海报详情
 */

+ (void)PostposterListWithproductCode:(NSString *)productCode merchantCode:(NSString *)merchantCode pageIndex:(NSInteger )pageIndex pageSize:(NSInteger )pageSize Success:(HLSSuccess)success failure:(HLSHttpFailure)failure;
/**
 *  3： 代理人信息
 */

+ (void)PostbdinfoSuccess:(HLSSuccess)success failure:(HLSHttpFailure)failure;

/**
 *  4： 保费信息
 */

+ (void)PostuserCenterSuccess:(HLSSuccess)success failure:(HLSHttpFailure)failure;
/**
 *  5： 我的资料
 */

+ (void)PostgetMerchantInfoWithcustomerCode:(NSString *)customerCode Success:(HLSSuccess)success failure:(HLSHttpFailure)failure;

/**
 *  6： 未读消息数
 */

+ (void)PostinfoUnReadSuccess:(HLSSuccess)success failure:(HLSHttpFailure)failure;

/**
 *  7： 消息列表
 */

+ (void)PostinfolistWithpageIndex:(NSInteger )pageIndex pageSize:(NSInteger )pageSize Success:(HLSSuccess)success failure:(HLSHttpFailure)failure;

/**
 *  8： 消息详情
 */

+ (void)PostinfoContentWithinfoId:(NSString *)infoId Success:(HLSSuccess)success failure:(HLSHttpFailure)failure;
/**
 *  9： 请求支付信息
 */

+ (void)PostgotopayInfoWithorderId:(NSString *)orderId returnUrl:(NSString *)returnUrl payment:(NSString *)payment Success:(HLSSuccess)success failure:(HLSHttpFailure)failure;
/**
 *  10： 提交意见反馈
 */

+ (void)PostsaveOpinionWithcontent:(NSString *)content imgUrlA:(NSString *)imgUrlA imgUrlB:(NSString *)imgUrlB imgUrlC:(NSString *)imgUrlC Success:(HLSSuccess)success failure:(HLSHttpFailure)failure;
/**
 *  11： 订单详情
 */

+ (void)PostpayOrderDetailWithorderCode:(NSString *)orderCode Success:(HLSSuccess)success failure:(HLSHttpFailure)failure;

#pragma mark -- 其他
/**
 *  1:上传图片
 */


+ (void)PostUploadPictureWithfile:(NSData *)file Success:(HLSSuccess)success failure:(HLSHttpFailure)failure;
/**
 *  2:上传图片base64
 */

+ (void)PostuploadImageWithimgContent:(NSString *)imgContent fileName:(NSString *)fileName suffix:(NSString *)suffix Success:(HLSSuccess)success failure:(HLSHttpFailure)failure;
@end
