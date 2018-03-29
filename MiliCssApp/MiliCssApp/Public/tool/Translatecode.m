//
//  Translatecode.m
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/26.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "Translatecode.h"

@implementation Translatecode
+ (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *string = [[NSMutableString alloc]init];
    
    [string appendString:@"(\n"];
    
    for (id obj in self)
    {
        [string appendFormat:@"%@\n",obj];
    }
    
    [string appendString:@")"];
    return string;
}
@end
