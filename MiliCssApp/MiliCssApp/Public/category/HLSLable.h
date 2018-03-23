//
//  HLSLable.h
//  autoBuy
//
//  Created by AutoBuy on 14/12/2.
//  Copyright (c) 2014年 HORIZON. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLSLable : UILabel
+ (void)lableWithText:(NSString *)text;

+ (void)lableWithText:(NSString *)text inView:(UIView *)view;


- (instancetype)initWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor;
@end
