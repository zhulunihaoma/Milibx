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
/**
 *  5： 我的资料
 */

+ (void)PostgetMerchantInfoWithcustomerCode:(NSString *)customerCode Success:(HLSSuccess)success failure:(HLSHttpFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/getMerchantInfo",RequestUrl];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (customerCode) {
        [param setValue:customerCode forKey:@"merchantCode"];
    }
    [MLHttpTools postWithURL:url params:param success:^(id json) {
        success(json);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
/**
 *  6： 未读消息数
 */

+ (void)PostinfoUnReadSuccess:(HLSSuccess)success failure:(HLSHttpFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/infoUnRead",RequestUrl];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [MLHttpTools postWithURL:url params:param success:^(id json) {
        success(json);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

/**
 *  7： 消息列表
 */

+ (void)PostinfolistWithpageIndex:(NSInteger )pageIndex pageSize:(NSInteger )pageSize Success:(HLSSuccess)success failure:(HLSHttpFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/infolist",RequestUrl];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (pageIndex) {
        [param setValue:@(pageIndex) forKey:@"pageIndex"];
    }
    if (pageSize) {
        [param setValue:@(pageSize) forKey:@"pageSize"];
    }
    [MLHttpTools postWithURL:url params:param success:^(id json) {
        success(json);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

/**
 *  8： 消息详情
 */

+ (void)PostinfoContentWithinfoId:(NSString *)infoId Success:(HLSSuccess)success failure:(HLSHttpFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/infoContent",RequestUrl];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (infoId) {
        [param setValue:infoId forKey:@"infoId"];
    }
    [MLHttpTools postWithURL:url params:param success:^(id json) {
        success(json);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
/**
 *  9： 请求支付信息
 */

+ (void)PostgotopayInfoWithorderId:(NSString *)orderId returnUrl:(NSString *)returnUrl payment:(NSString *)payment Success:(HLSSuccess)success failure:(HLSHttpFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/gotopayInfo",RequestUrl];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (orderId) {
        [param setValue:orderId forKey:@"orderId"];
    }
    if (returnUrl) {
        [param setValue:returnUrl forKey:@"returnUrl"];
    }
    if (payment) {
        [param setValue:payment forKey:@"payment"];
    }
    
    [param setValue:[HLSPersonalInfoTool getmerchantCode] forKey:@"customerCode"];

    [MLHttpTools postWithURL:url params:param success:^(id json) {
        success(json);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
/**
 *  10： 提交意见反馈
 */

+ (void)PostsaveOpinionWithcontent:(NSString *)content imgUrlA:(NSString *)imgUrlA imgUrlB:(NSString *)imgUrlB imgUrlC:(NSString *)imgUrlC Success:(HLSSuccess)success failure:(HLSHttpFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/saveOpinion",RequestUrl];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (content) {
        [param setValue:content forKey:@"content"];
    }
    if (imgUrlA) {
        [param setValue:imgUrlA forKey:@"imgUrlA"];
    }
    if (imgUrlB) {
        [param setValue:imgUrlB forKey:@"imgUrlB"];
    }
    if (imgUrlC) {
        [param setValue:imgUrlC forKey:@"imgUrlC"];
    }
    
    
    [MLHttpTools postWithURL:url params:param success:^(id json) {
        success(json);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
/**
 *  11： 订单详情
 */

+ (void)PostpayOrderDetailWithorderCode:(NSString *)orderCode Success:(HLSSuccess)success failure:(HLSHttpFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/payOrderDetail",RequestUrl];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (orderCode) {
        [param setValue:orderCode forKey:@"orderCode"];
    }
    
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
/**
 *  2:上传图片base64
 */

+ (void)PostuploadImageWithimgContent:(NSString *)imgContent fileName:(NSString *)fileName suffix:(NSString *)suffix Success:(HLSSuccess)success failure:(HLSHttpFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/uploadImage",RequestUrl];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (imgContent) {
        [param setValue:imgContent forKey:@"imgContent"];
    }
    if (fileName) {
        [param setValue:fileName forKey:@"fileName"];
    }
    if (suffix) {
        [param setValue:suffix forKey:@"suffix"];
    }
    
    [MLHttpTools postWithURL:url params:param success:^(id json) {
        success(json);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
