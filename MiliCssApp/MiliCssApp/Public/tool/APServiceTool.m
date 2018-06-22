//
//  APServiceTool.m
//  Banchetong
//
//  Created by AutoBuy on 15/12/1.
//  Copyright © 2015年 horizon. All rights reserved.
//

#import "APServiceTool.h"

@implementation APServiceTool

+ (void)setTag
{
    NSString *uid = [HLSPersonalInfoTool getmerchantCode];
    if (uid.length > 0) {
        uid = [uid stringByReplacingOccurrencesOfString:@"-" withString:@""];
    }else {
        uid = @"";
    }
    [JPUSHService setAlias:uid callbackSelector:@selector(tagsAliasCallback:tags:alias:) object:self];
}

- (void)tagsAliasCallback:(int)iResCode tags:(NSSet*)tags alias:(NSString*)alias {
    HLSLog(@"rescode: %d, \ntags: %@, \nalias: %@\n", iResCode, tags , alias);
}

@end
