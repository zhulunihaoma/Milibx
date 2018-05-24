//
//  MD5Tool.h
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/23.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
@interface MD5Tool : NSObject
+ (NSString *) md5:(NSString *) input;

@end
