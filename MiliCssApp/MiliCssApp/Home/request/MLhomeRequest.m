//
//  MLhomeRequest.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/6/12.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "MLhomeRequest.h"
#import "MLHttpTools.h"
#import "JSONTool.h"
@implementation MLhomeRequest
+ (void)PostmainSuccess:(HLSSuccess)success failure:(HLSHttpFailure)failure{
        NSString *url = [NSString stringWithFormat:@"%@/main",RequestUrl];
        NSMutableDictionary *param = [NSMutableDictionary dictionary];
      
        
        [MLHttpTools postWithURL:url params:param success:^(id json) {
            success(json);
        } failure:^(NSError *error) {
            failure(error);
        }];
}
@end
