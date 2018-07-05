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
+ (UIViewController *)getCurrentVC{
    
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    
    if (window.windowLevel != UIWindowLevelNormal)
        
    {
        
        NSArray *windows = [[UIApplication sharedApplication] windows];
        
        for(UIWindow * tmpWin in windows)
            
        {
            
            if (tmpWin.windowLevel == UIWindowLevelNormal)
                
            {
                
                window = tmpWin;
                
                break;
                
            }
            
        }
        
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        
        result = nextResponder;
    
    else
        
        result = window.rootViewController;
    
    return result;
    
}

@end
