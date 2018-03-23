//
//  NSDictionary+HLS.m
//  车源通
//
//  Created by k1er on 15/2/28.
//  Copyright (c) 2015年 HORIZON. All rights reserved.
//

#import "NSDictionary+HLS.h"




@implementation NSDictionary (HLS)

- (id)xyValueForKey:(NSString *)key 
{
    return [self xyValueForKey:key type:XYJsonTypeString];
}

- (void)xyValueForKey:(NSString *)key success:(void (^)( id result))success failure:(void (^) (id result))failure;
{
    id result = [self valueForKey:key];
    if (result) {
        success(result);
    } else {
        failure(result);
    }
}

- (id)xyValueForKey:(NSString *)key type:(XYJsonType)type
{
    id result = [self valueForKey:key];
    if (result) {
        if ([result isKindOfClass:[NSNumber class]]) {
            return [result description];
        } else if ([result isKindOfClass:[NSString class]]) {
            return result;
        }
        
        return result;
    } else {
        switch (type) {
            case XYJsonTypeInterger:
                return @"0";
            case XYJsonTypeFloat:
                return @"0.0";
            case XYJsonTypeString:
                return @"";
        }
    }
}
- (id)xyRePlaceValueForKey:(NSString *)key{
    id result = [self valueForKey:key];
    if (result) {
        if ([result isKindOfClass:[NSNumber class]]) {
            return [result description];
        } else if ([result isKindOfClass:[NSString class]]) {
            return result;
        }
        
        return result;
    } else {
        
        return @"--";
    
    }
    
}
@end
