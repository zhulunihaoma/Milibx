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

/**
 *  设置全属性Label，文字，字体，颜色，格式,可加入父试图
 *
 *  @param font      字体
 *  @param Alignment 格式
 *  @param textColor 文字颜色
 *  @param fview     父试图
 *
 *  @return 返回一个label
 */
+(UILabel *)LabelWithFont:(NSInteger)font WithTextalignment:(NSTextAlignment)Alignment WithTextColor:(UIColor *)textColor WithFatherView:(UIView*)fview;
@end
