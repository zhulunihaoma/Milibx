//
//  MLFindRequest.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/6/12.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "MLFindRequest.h"
#import "MLHttpTools.h"
#import "JSONTool.h"
@implementation MLFindRequest

/**
 *1： 栏目列表
 */
+ (void)PostcolumnListSuccess:(HLSSuccess)success failure:(HLSHttpFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/app/columnList",RequestUrl];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
   
    
    
    [MLHttpTools postWithURL:url params:param success:^(id json) {
        success(json);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
/**
 *  2： 栏目下文章列表
 */

+ (void)PostarticleListWithcolumnId:(NSString *)columnId pageIndex:(NSInteger )pageIndex pageSize:(NSInteger )pageSize Success:(HLSSuccess)success failure:(HLSHttpFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/app/articleList",RequestUrl];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (columnId) {
        [param setValue:columnId forKey:@"columnId"];
    }
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
@end
