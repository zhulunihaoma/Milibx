//
//  HLSPersonalInfoTool.h
//  车源通
//
//  Created by k1er on 15/4/27.
//  Copyright (c) 2015年 HORIZON. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, UserType){
    UserTypeBuyer,
    UserTypeSeller,
    UserTypeSale
};

@interface HLSPersonalInfoTool : NSObject

+ (BOOL)isLogin;

+ (NSString *)getCookies; //用户的cookies
+ (NSString *)getWAPSESSIONID; //用户的WAPSESSIONID
+ (NSString *)getmerchantCode; //用户的merchantCode

+ (NSString *)getUserinfo;

+ (NSString *)getdeviceId;
+ (NSString *)merchantLevel;
+ (NSString *)merchantNature;




/**
 *  获取融云token
 */
+ (NSString *)getRongyunToken;

+ (NSDictionary *)getUserInfoDic;
@end
