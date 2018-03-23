//
//  NSDate+XY.m
//  车源通
//
//  Created by k1er on 15/4/11.
//  Copyright (c) 2015年 HORIZON. All rights reserved.
//

#import "NSDate+XY.h"

@implementation NSDate (XY)
+ (NSString *)currentTimeWithSecond:(NSString *)second formatStr:(NSString *)formatStr
{
    if (second.length <= 10) {
        return second;
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:second.doubleValue / 1000];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = formatStr;
    NSString *timeStr = [formatter stringFromDate:date];
    return timeStr;
}
+ (NSString *)currentDateWihtFormatStr:(NSString *)formatStr
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = formatStr;
    NSString *timeStr = [formatter stringFromDate:[NSDate new]];
    return timeStr;
}
+ (NSString *)currentTimeWithSecond:(NSString *)second {
    
    NSDate *send = [NSDate dateWithTimeIntervalSince1970:second.doubleValue / 1000];
    
    // 2.当前时间
    NSDate *now = [NSDate date];
    
    // 3.获得当前时间和发送时间 的 间隔  (now - send)
    NSString *timeStr = nil;
    NSTimeInterval delta = [now timeIntervalSinceDate:send];
    if (delta < 60) { // 一分钟内
        timeStr = @"刚刚";
    } else if (delta < 60 * 60) { // 一个小时内
        timeStr = [NSString stringWithFormat:@"%.f分钟前", delta/60];
    } else if (delta < 60 * 60 * 24) { // 一天内
        timeStr = [NSString stringWithFormat:@"%.f小时前", delta/60/60];
    } else if (delta < 60 * 60 * 24 * 24) { // 一天内
        timeStr = [NSString stringWithFormat:@"昨天"];
    }else { // 几天前
        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
        fmt.dateFormat = @"yyyy-MM-dd";
        timeStr = [fmt stringFromDate:send];
    }

    return timeStr;
}
+ (BOOL)compareToCurrentDateWithSecond:(NSString *)second {
    NSDate *send = [NSDate dateWithTimeIntervalSince1970:second.doubleValue / 1000];
    NSDate *now = [NSDate date];
    //获得当前时间和发送时间 的 间隔  (now - send)
    NSTimeInterval delta = [now timeIntervalSinceDate:send];
    
    return delta < 0 ? YES : NO;
}
/**
 *  按日期计算
 *
 *  @param dateString <#dateString description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)currentDateWithDateString:(NSString *)dateString {
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date = [fmt dateFromString:dateString];
    // 2.当前时间
    NSDate *now = [NSDate date];
    
    NSString *nowDateString = [fmt stringFromDate:now];
    now = [fmt dateFromString:nowDateString];
    // 3.获得当前时间和发送时间 的 间隔  (now - send)
    NSString *timeStr = dateString;
    NSTimeInterval delta = [now timeIntervalSinceDate:date];
    NSInteger day = delta / (60 * 60 * 24);
    if (delta < 60) { // 一分钟内
        if (delta < 1) {
            delta = 1;
        }
        timeStr = [NSString stringWithFormat:@"1分钟前"];
    } else if (delta < 60 * 60) { // 一个小时内
        timeStr = [NSString stringWithFormat:@"%.f分钟前", delta/60];
    } else if (delta < 60 * 60 * 24) { // 一天内
        timeStr = [NSString stringWithFormat:@"%.f小时前", delta/60/60];
    } else if (day < 6) { // 5天内
        timeStr = [NSString stringWithFormat:@"%ld天前",day];
    }
    
    return timeStr;
}


@end
