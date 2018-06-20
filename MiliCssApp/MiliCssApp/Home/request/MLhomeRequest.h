//
//  MLhomeRequest.h
//  MiliCssApp
//
//  Created by 朱璐 on 2018/6/12.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLHttpTools.h"
@interface MLhomeRequest : NSObject

#pragma mark -- 1:首页

/**
 * 1： 首页数据
 */

+ (void)PostmainSuccess:(HLSSuccess)success failure:(HLSHttpFailure)failure;
@end
