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


#pragma mark -- 其他
/**
 *  1:上传图片
 */


+ (void)PostUploadPictureWithfile:(NSData *)file Success:(HLSSuccess)success failure:(HLSHttpFailure)failure;


@end
