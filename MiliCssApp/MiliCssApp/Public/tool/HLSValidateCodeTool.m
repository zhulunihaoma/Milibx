//
//  HLSValidateCodeTool.m
//  车源通
//
//  Created by AutoBuy on 15/4/14.
//  Copyright (c) 2015年 HORIZON. All rights reserved.
//

#import "HLSValidateCodeTool.h"

@implementation HLSValidateCodeTool

/**
 @brief 隐藏营业执照号中间
 
 得到一个隐藏中间10位数字的营业执照号码 例如:133****3333
 
 @param certifyNo 正常的营业执照号码
 
 @return 隐藏中间的10位数字的手机号
 */
+ (NSString *)hideCertifyNoMiddleOfFourNo:(NSString *)certifyNo{
    if ([certifyNo length]<6) {
        return certifyNo;
    }else{
    
    NSString *beforeStr = [certifyNo substringToIndex:2];
    NSString *backStr   = [certifyNo substringWithRange:NSMakeRange([certifyNo length]-3,3)];
    return [NSString stringWithFormat:@"%@ **** %@",beforeStr,backStr];

    }
}




//隐藏电话号中间的4位
+ (NSString *)hidePhoneNoMiddleOfFourNo:(NSString *)phoneNo{
    
    NSString *beforeStr = [phoneNo substringToIndex:3];
    NSString *backStr   = [phoneNo substringWithRange:NSMakeRange(7,4)];
    return [NSString stringWithFormat:@"%@ **** %@",beforeStr,backStr];
}




//隐藏身份证中间的8位
+ (NSString *)hideIDCardNoMiddleOfEightNo:(NSString *)IDCardNo{
    if (IDCardNo.length == 18) {
        NSString *beforeStr  = [IDCardNo substringToIndex:3];
        NSString *beforeStr2 = [IDCardNo substringWithRange:NSMakeRange(3, 3)];
        NSString *backStr    = [IDCardNo substringWithRange:NSMakeRange(14,4)];
        return [NSString stringWithFormat:@"%@ %@ **** **** %@",beforeStr,beforeStr2,backStr];
    }
    return IDCardNo;
}

//美化手机号
+ (NSString *)addSpacesToPhoneNo:(NSString *)phoneNo{
    
    NSString *str = [phoneNo stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSString *beforeStr  = [str substringToIndex:3];
    NSString *beforeStr2 = [str substringWithRange:NSMakeRange(3,4)];
    NSString *backStr    = [str substringWithRange:NSMakeRange(7,4)];
    
    if (phoneNo!=nil) {
        return [NSString stringWithFormat:@"%@ %@ %@",beforeStr,beforeStr2,backStr];
    }else{
        return @"";
    }
    
    
}

//美化身份证号
+ (NSString *)addSpacesToIDCardNo:(NSString *)IDCardNo{
    
    NSString *str = [IDCardNo stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *beforeStr  = [str substringToIndex:3];
    NSString *beforeStr2 = [str substringWithRange:NSMakeRange(3, 3)];
    NSString *begoreStr3 = [str substringWithRange:NSMakeRange(6, 4)];
    NSString *begoreStr4 = [str substringWithRange:NSMakeRange(10, 4)];
    NSString *backStr    = [str substringWithRange:NSMakeRange(14, 4)];
    
    if (IDCardNo!=nil) {
        return [NSString stringWithFormat:@"%@ %@ %@ %@ %@",beforeStr,beforeStr2,begoreStr3,begoreStr4,backStr];
    }else{
        return @"";
    }
    
}
/*手机号码验证 MODIFIED BY HELENSONG*/
+ (BOOL) isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
   // NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
//    NSString *phoneRegex = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[03678]|18[0-9]|14[57])[0-9]{8}$";
        NSString *phoneRegex = @"^[1][3,4,5,6,7,8,9][0-9]{9}$";

    
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}
/**
 *  验证身份证号
 */
+ (BOOL)validateIDCardNumber:(NSString *)value {
    
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
         if ([value length] != 18) {
                 return NO;
             }
         NSString *mmdd = @"(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|[12][0-9]|30))|(02(0[1-9]|[1][0-9]|2[0-8])))";
         NSString *leapMmdd = @"0229";
         NSString *year = @"(19|20)[0-9]{2}";
         NSString *leapYear = @"(19|20)(0[48]|[2468][048]|[13579][26])";
         NSString *yearMmdd = [NSString stringWithFormat:@"%@%@", year, mmdd];
         NSString *leapyearMmdd = [NSString stringWithFormat:@"%@%@", leapYear, leapMmdd];
         NSString *yyyyMmdd = [NSString stringWithFormat:@"((%@)|(%@)|(%@))", yearMmdd, leapyearMmdd, @"20000229"];
         NSString *area = @"(1[1-5]|2[1-3]|3[1-7]|4[1-6]|5[0-4]|6[1-5]|82|[7-9]1)[0-9]{4}";
         NSString *regex = [NSString stringWithFormat:@"%@%@%@", area, yyyyMmdd  , @"[0-9]{3}[0-9Xx]"];
    
         NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
         if (![regexTest evaluateWithObject:value]) {
                 return NO;
             }
         int summary = ([value substringWithRange:NSMakeRange(0,1)].intValue + [value substringWithRange:NSMakeRange(10,1)].intValue) *7
                 + ([value substringWithRange:NSMakeRange(1,1)].intValue + [value substringWithRange:NSMakeRange(11,1)].intValue) *9
                 + ([value substringWithRange:NSMakeRange(2,1)].intValue + [value substringWithRange:NSMakeRange(12,1)].intValue) *10
                 + ([value substringWithRange:NSMakeRange(3,1)].intValue + [value substringWithRange:NSMakeRange(13,1)].intValue) *5
                 + ([value substringWithRange:NSMakeRange(4,1)].intValue + [value substringWithRange:NSMakeRange(14,1)].intValue) *8
                 + ([value substringWithRange:NSMakeRange(5,1)].intValue + [value substringWithRange:NSMakeRange(15,1)].intValue) *4
                 + ([value substringWithRange:NSMakeRange(6,1)].intValue + [value substringWithRange:NSMakeRange(16,1)].intValue) *2
                 + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6
                 + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
         NSInteger remainder = summary % 11;
         NSString *checkBit = @"";
         NSString *checkString = @"10X98765432";
    
         checkBit = [checkString substringWithRange:NSMakeRange(remainder,1)];// 判断校验位
         return [checkBit isEqualToString:[[value substringWithRange:NSMakeRange(17,1)] uppercaseString]];
    
}



//判断是否含有表情
+ (BOOL)stringContainsEmoji:(NSString *)string{
    __block BOOL returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                                            returnValue = YES;
                                        }
                                    }
                                } else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3) {
                                        returnValue = YES;
                                    }
                                } else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        returnValue = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
}

/**
 *  是否含有两种以上字符
 */
+ (BOOL)IsContainTwoCharacter:(NSString *)value{
    NSString *passWordRegex = @"^(?=.*[a-zA-Z0-9].*)(?=.*[a-zA-Z\\W].*)(?=.*[0-9\\W].*).{6,20}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [phoneTest evaluateWithObject:value];
}
+ (BOOL)IsContainNull:(NSMutableDictionary *)Mdic{
    return NO;
}

@end
