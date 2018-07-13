//
//  HLSTextHeightTool.m
//  口碑
//
//  Created by horizon on 16/4/12.
//  Copyright © 2016年 horizon. All rights reserved.
//

#import "HLSTextHeightTool.h"

@implementation HLSTextHeightTool
+(CGFloat)getHeightfortext:(NSString *)text withWidth:(CGFloat)width withFont:(CGFloat)font{

    CGFloat remarkHeight = [text boundingRectWithSize:CGSizeMake(width, 0)
                                                                    options:NSStringDrawingUsesLineFragmentOrigin
                                                                 attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font]}
                                                                    context:nil].size.height;

    return remarkHeight;
}

@end
