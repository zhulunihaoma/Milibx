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
    if ([self getToken].length >0) {
        return YES;

    }else{
        return NO;
    }
}

+ (NSString *)getToken{
    return DEF_PERSISTENT_GET_OBJECT(@"token");
}
+ (NSString *)getUid
{
    return [[mUserDefaults objectForKey:KUserInfoDic] xyValueForKey:@"uid"];
}
+ (NSString *)getPhoneNum{
    return [[mUserDefaults objectForKey:KUserInfoDic] xyValueForKey:@"mobile"];


}

+ (NSString *)getUserType
{
    return [[mUserDefaults objectForKey:KUserInfoDic] xyValueForKey:@"userType"];
}
+ (NSString *)getCompanyId {
    return [[mUserDefaults objectForKey:KUserInfoDic] xyValueForKey:@"companyId"];
}
+ (NSInteger )getLevel{//获取用户等级
    return [[[mUserDefaults objectForKey:KUserInfoDic] xyValueForKey:@"level"] integerValue];
}
+ (NSString *)getqid{
    return [[mUserDefaults objectForKey:KUserInfoDic] xyValueForKey:@"qid"];


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
