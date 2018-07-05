//
//  HLSTextHeightTool.h
//  口碑
//
//  Created by horizon on 16/4/12.
//  Copyright © 2016年 horizon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLSTextHeightTool : NSObject
+(CGFloat)getHeightfortext:(NSString *)text withWidth:(CGFloat)width withFont:(CGFloat)font;
@end
