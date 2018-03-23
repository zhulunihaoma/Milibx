//
//  NSDate+XY.h
//  车源通
//
//  Created by k1er on 15/4/11.
//  Copyright (c) 2015年 HORIZON. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (XY)
+ (NSString *)currentTimeWithSecond:(NSString *)second formatStr:(NSString *)formatStr;
//获取当前系统时间
+ (NSString *)currentDateWihtFormatStr:(NSString *)formatStr;

+ (NSString *)currentTimeWithSecond:(NSString *)second;
/**
 *  与当前时间比对
 */
+ (BOOL)compareToCurrentDateWithSecond:(NSString *)second;

+ (NSString *)currentDateWithDateString:(NSString *)dateString;



@end
