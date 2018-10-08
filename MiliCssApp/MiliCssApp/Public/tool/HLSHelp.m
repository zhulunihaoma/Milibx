//
//  HLSHelp.m
//  Banchetong
//
//  Created by horizon on 15/11/3.
//  Copyright © 2015年 horizon. All rights reserved.
//

#import "HLSHelp.h"

@implementation HLSHelp
#pragma mark -- 判断是不是第一次登陆
+(BOOL)IsFirstLogin{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if ([[userDefaults objectForKey:@"login"] isEqualToString:@"yes"]) {
        return YES;
    }else{
        return NO;
    }

}
#pragma mark -- 判断版本号是否发生变化
+(BOOL)isTheSameToCurrentVersion{
    NSDictionary * dict = [NSBundle mainBundle].infoDictionary;
    NSString * version = [dict valueForKey:@"CFBundleShortVersionString"];
    if ([version compare:CurrentVersions options:NSNumericSearch] == NSOrderedSame) {
        return YES;
    }else{
        //[UIApplication sharedApplication].applicationIconBadgeNumber = 0;
        [mUserDefaults setObject:version forKey:kVersions];
        [mUserDefaults synchronize];
        return NO;
    }

}
@end
