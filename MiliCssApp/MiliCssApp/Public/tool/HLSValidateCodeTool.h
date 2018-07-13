//
//  HLSValidateCodeTool.h
//  车源通
//
//  Created by AutoBuy on 15/4/14.
//  Copyright (c) 2015年 HORIZON. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLSValidateCodeTool : NSObject

/**
 @brief 隐藏营业执照号中间
 
 得到一个隐藏中间10位数字的营业执照号码 例如:133****3333
 
 @param certifyNo 正常的营业执照号码
 
 @return 隐藏中间的10位数字的手机号
 */
+ (NSString *)hideCertifyNoMiddleOfFourNo:(NSString *)certifyNo;



/**
 @brief 隐藏手机号中间的4位
 
 得到一个隐藏中间4位数字的手机号 例如:133****3333
 
 @param phoneNo 正常的手机号
 
 @return 隐藏中间的4位数字的手机号
 */
+ (NSString *)hidePhoneNoMiddleOfFourNo:(NSString *)phoneNo;

/**
 @brief 隐藏身份证中间的8位数
 
 得到一个隐藏中间8位数字的身份证 例如:133 222 **** **** 3333
 
 @param IDCardNo 正常的身份证号
 
 @return 隐藏中间的8位数的身份证号
 */
+ (NSString *)hideIDCardNoMiddleOfEightNo:(NSString *)IDCardNo;

/**
 @brief 美化手机号
 
 美化一下手机号的显示格式,加3个空格,输出的格式为:3 4 4            例如:133 3333 3333
 
 @param phoneNo 正常的手机号
 
 @return 美化完的手机号
 */
+ (NSString *)addSpacesToPhoneNo:(NSString *)phoneNo;


/**
 @brief 美化身份证号
 
 美化身份证显示的格式 例如:133 222 2222 2222 3333
 
 @param IDCardNo 正常的身份证号
 
 @return 美化完的身份证号
 */
+ (NSString *)addSpacesToIDCardNo:(NSString *)IDCardNo;
/*手机号码验证 MODIFIED BY HELENSONG*/
+ (BOOL) isValidateMobile:(NSString *)mobile;
/**
 *  验证身份证号
 */
+ (BOOL)validateIDCardNumber:(NSString *)value;

//判断是否含有表情
+ (BOOL)stringContainsEmoji:(NSString *)string;

/**
 *  是否含有两种以上字符
 */
+ (BOOL)IsContainTwoCharacter:(NSString *)value;
//是否含有Null 或者no summy
+ (BOOL)IsContainNull:(NSMutableDictionary *)Mdic;

@end
