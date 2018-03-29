//
//  GetUnderController.m
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/28.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "GetUnderController.h"

@implementation GetUnderController
+(UIViewController *)getvcwithtarget:(id)target{
    id object = [target nextResponder];
    
    while (![object isKindOfClass:[UIViewController class]] &&
           object != nil) {
        object = [object nextResponder];
    }
    
    UIViewController *uc=(UIViewController*)object;
    return uc;
}
@end
