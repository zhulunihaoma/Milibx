//
//  MD5Tool.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/23.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "MD5Tool.h"

@implementation MD5Tool
+ (NSString *) md5:(NSString *) input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}
@end
