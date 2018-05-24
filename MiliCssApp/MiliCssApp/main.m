//
//  main.m
//  MiliCssApp
//
//  Created by MLInsurance_huang on 2018/3/22.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @try {
        @autoreleasepool
        {
            return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        }
    }
    @catch (NSException* exception)
    {
        HLSLog(@"Exception=%@\nStack Trace:%@", exception, [exception callStackSymbols]);
    }
    
   
    
//    @autoreleasepool {
//        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
//    }
}
