//
//  UILabel+Line.h
//  Banchetong
//
//  Created by horizon on 15/11/4.
//  Copyright © 2015年 horizon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Line)

+(UIView *)createTextVWithLine:(BOOL)haveBtn WithLineColor:(UIColor *)lineColor WithPlaceholder:(NSString *)holderStr WithFatherView:(UIView *)fatherView WithTag:(NSInteger )tag;


+(UIView *)createTextVWithLine:(BOOL)haveBtn WithLineColor:(UIColor *)lineColor WithPlaceholder:(NSString *)holderStr WithFatherView:(UIView *)fatherView WithMM:(BOOL)mm;

@end
