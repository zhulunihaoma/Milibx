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

+ (NSString *)getUid; //用户的id uid
+ (NSString *)getToken; //用户的token

+ (NSString *)getPhoneNum; 

+ (NSString *)getUserType;

+ (NSString *)getCompanyId;
+ (NSInteger)getLevel;//获取用户等级
+ (NSString *)getqid;



/**
 *  获取融云token
 */
+ (NSString *)getRongyunToken;

+ (NSDictionary *)getUserInfoDic;
@end
