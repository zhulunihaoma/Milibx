//
//  UILabel+HLSDefault.h
//  Banchetong
//
//  Created by horizon on 15/11/5.
//  Copyright © 2015年 horizon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (HLSDefault)
/**
 *  设置全属性Label，文字，字体，颜色，格式,可加入父试图
 *
 *  @param str       文字内容
 *  @param font      字体
 *  @param Alignment 格式
 *  @param textColor 文字颜色
 *  @param fview     父试图
 *
 *  @return 返回一个label
 */
+(UILabel *)LabelWithText:(NSString *)str WithFont:(NSInteger)font WithTextalignment:(NSTextAlignment)Alignment WithTextColor:(UIColor *)textColor WithFatherView:(UIView*)fview;

/**
 *  设置简化Label,文字，字体，颜色，自适应
 *
 *  @param str       内容
 *  @param font      字体大小
 *  @param textColor 颜色
 *
 *  @return 返回一个label
 */
+(UILabel *)LabelWithText:(NSString *)str Font:(NSInteger)font  TextColor:(UIColor *)textColor isSizeToFit:(BOOL)isFit;
/**
 *  设置简化Label,文字，字体，颜色，自适应,可加入父试图
 *
 *  @param str       内容
 *  @param font      字体大小
 *  @param textColor 颜色
 *  @param isFit     自适应
 *  @param view      父试图
 *
 *  @return 返回一个label
 */
+ (UILabel *)LabelWithText:(NSString *)str Font:(NSInteger)font TextColor:(UIColor *)textColor isSizeToFit:(BOOL)isFit inView:(UIView *)view;
/**
 *  设置简化Label,文字，字体，颜色，frame，父试图
 *
 *  @param str       内容
 *  @param font      字体大小
 *  @param textColor 颜色
 *  @param rect      frame
 *
 *  @return 返回一个label
 */
+ (UILabel *)LabelWithText:(NSString *)str Font:(NSInteger)font TextColor:(UIColor *)textColor withFrame:(CGRect)rect inView:(UIView *)view;
/**
 *  设置简化Label,文字，字体，颜色，自适应，x值，y值，父试图
 *
 *  @param str       内容
 *  @param font      字体
 *  @param textColor 颜色
 *  @param isFit     自适应
 *  @param view      父试图
 *  @param x         x值
 *  @param y         y值
 *
 *  @return 返回一个label
 */
+ (UILabel *)LabelWithText:(NSString *)str Font:(NSInteger)font TextColor:(UIColor *)textColor isSizeToFit:(BOOL)isFit inView:(UIView *)view  atX:(NSInteger)x atY:(NSInteger)y;
/**
 *  自定义cell中专用，字体，颜色，自适应，父试图
 *
 *  @param font      字体
 *  @param textColor 颜色
 *  @param view      父试图
 *
 *  @return 返回一个label
 */
+ (UILabel *)LabelWithFont:(NSInteger)font TextColor:(UIColor *)textColor inView:(UIView *)view;


/**
 *  设置简化Label,文字，字体，颜色,父试图
 *
 *  @param str       文字
 *  @param font      字体
 *  @param textColor 颜色
 *  @param view      父试图
 *
 *  @return 返回一个label
 */
+ (UILabel *)LabelWithText:(NSString *)str Font:(NSInteger)font TextColor:(UIColor *)textColor inView:(UIView *)view;


/**
 *  设置label的text，并且自适应
 *
 *  @param text  内容
 *  @param isFit 自适应
 */
-(void)setText:(NSString *)text isSizeToFit:(BOOL)isFit;
/**
 *  设置label的text，x,y并且自适应
 *
 *  @param text  内容
 *  @param x     x
 *  @param y     y
 *  @param isFit 自适应
 */
-(void)setText:(NSString *)text AtX:(CGFloat)x AtY:(CGFloat )y isSizeToFit:(BOOL)isFit;
/**
 *  设置label的text，x,y,width,height
 *
 *  @param text   text
 *  @param x      x
 *  @param y      y
 *  @param width  width
 *  @param height height
 */
-(void)setText:(NSString *)text AtX:(CGFloat)x AtY:(CGFloat)y withWidth:(CGFloat)width height:(CGFloat)height;
@end
