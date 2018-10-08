//
//  HLSHelp.h
//  Banchetong
//
//  Created by horizon on 15/11/3.
//  Copyright © 2015年 horizon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLSHelp : NSObject
/**
 *  判断是否为第一次登陆
 *
 *  @return YES为第一次
 */
+(BOOL)IsFirstLogin;
/**
 *  判断版本号是否一样
 *
 *  @return YES为一样
 */
+(BOOL)isTheSameToCurrentVersion;



@end
