//
//  HLSPersonalInfoTool.m
//  车源通
//
//  Created by k1er on 15/4/27.
//  Copyright (c) 2015年 HORIZON. All rights reserved.
//

#import "HLSPersonalInfoTool.h"

@implementation HLSPersonalInfoTool



+ (BOOL)isLogin
{
    return YES;

}

+ (NSString *)getCookies{
    return [[mUserDefaults objectForKey:KUserInfoDic] xyValueForKey:@"cookies"];
}
+ (NSString *)getWAPSESSIONID{
    return [[[mUserDefaults objectForKey:KUserInfoDic] xyValueForKey:@"cookies"] xyValueForKey:@"WAPSESSIONID"];

//    return [[DEF_PERSISTENT_GET_OBJECT(@"userinfo") xyValueForKey:@"cookies"] xyValueForKey:@"WAPSESSIONID"];
}
+ (NSString *)getUserinfo
{
    return [[mUserDefaults objectForKey:KUserInfoDic] xyValueForKey:@"user"];
}

/**
 *  获取融云token
 */
+ (NSString *)getRongyunToken {
    return [mUserDefaults objectForKey:@"RongyunToken"];
}
+ (NSDictionary *)getUserInfoDic {
    return [mUserDefaults objectForKey:KUserInfoDic];
}





@end
