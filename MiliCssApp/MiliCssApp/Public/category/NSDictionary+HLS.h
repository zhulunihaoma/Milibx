//
//  NSDictionary+HLS.h
//  车源通
//
//  Created by k1er on 15/2/28.
//  Copyright (c) 2015年 HORIZON. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (HLS)


typedef NS_ENUM(NSInteger, XYJsonType) {
    XYJsonTypeInterger,
    XYJsonTypeFloat,
    XYJsonTypeString
};

- (id)xyValueForKey:(NSString *)key;

- (void)xyValueForKey:(NSString *)key success:(void (^)( id result))success failure:(void (^) (id result))failure;

- (id)xyValueForKey:(NSString *)key type:(XYJsonType)type;
/**
 *  如果为空用@“--”代替
 */
- (id)xyRePlaceValueForKey:(NSString *)key;


@end
