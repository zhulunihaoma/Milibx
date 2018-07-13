//
//  MLFindRequest.h
//  MiliCssApp
//
//  Created by 朱璐 on 2018/6/12.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLHttpTools.h"

@interface MLFindRequest : NSObject


/**
 *1： 栏目列表
 */

+ (void)PostcolumnListSuccess:(HLSSuccess)success failure:(HLSHttpFailure)failure;
/**
 *  2： 栏目下文章列表
 */

+ (void)PostarticleListWithcolumnId:(NSString *)columnId pageIndex:(NSInteger )pageIndex pageSize:(NSInteger )pageSize Success:(HLSSuccess)success failure:(HLSHttpFailure)failure;
@end
