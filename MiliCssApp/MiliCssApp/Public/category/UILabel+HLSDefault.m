//
//  UILabel+HLSDefault.m
//  Banchetong
//
//  Created by horizon on 15/11/5.
//  Copyright © 2015年 horizon. All rights reserved.
//

#import "UILabel+HLSDefault.h"

@implementation UILabel (HLSDefault)

+(UILabel *)LabelWithText:(NSString *)str WithFont:(NSInteger)font WithTextalignment:(NSTextAlignment)Alignment WithTextColor:(UIColor *)textColor WithFatherView:(UIView*)fview{

   UILabel *lab = [[UILabel alloc]init];
    lab.textAlignment = Alignment;
    lab.font = [UIFont systemFontOfSize:font];
    lab.textColor = textColor;
    if (str) {
        lab.text = str;
    }
    if (fview != nil) {
        [fview addSubview:lab];
    }
    
    return lab;

}

+ (UILabel *)LabelWithText:(NSString *)str Font:(NSInteger)font TextColor:(UIColor *)textColor isSizeToFit:(BOOL)isFit{

    UILabel *lab = [[UILabel alloc]init];
    lab.font = [UIFont systemFontOfSize:font];
    lab.textColor = textColor;
    if (str) {
        lab.text = str;
    }
    if (isFit) {
        [lab sizeToFit];
    }
    return lab;

}

+ (UILabel *)LabelWithText:(NSString *)str Font:(NSInteger)font TextColor:(UIColor *)textColor isSizeToFit:(BOOL)isFit inView:(UIView *)view{
    UILabel *lab = [[UILabel alloc]init];
    lab.font = [UIFont systemFontOfSize:font];
    lab.textColor = textColor;
    if (str) {
        lab.text = str;
    }
    if (isFit) {
        [lab sizeToFit];
    }
    if (view != nil) {
        [view addSubview:lab];
    }
    
    return lab;
}
+ (UILabel *)LabelWithText:(NSString *)str Font:(NSInteger)font TextColor:(UIColor *)textColor withFrame:(CGRect)rect inView:(UIView *)view{
    UILabel *lab = [[UILabel alloc]init];
    lab.font = [UIFont systemFontOfSize:font];
    lab.textColor = textColor;
    if (str) {
        lab.text = str;
    }
    lab.frame = rect;
    if (view != nil) {
        [view addSubview:lab];
    }
    
    return lab;


}
+ (UILabel *)LabelWithText:(NSString *)str Font:(NSInteger)font TextColor:(UIColor *)textColor isSizeToFit:(BOOL)isFit inView:(UIView *)view atX:(NSInteger)x atY:(NSInteger)y{

    UILabel *lab = [[UILabel alloc]init];
    lab.font = [UIFont systemFontOfSize:font];
    lab.textColor = textColor;
    if (str) {
        lab.text = str;
    }
    if (isFit) {
        [lab sizeToFit];
    }
    lab.x = x;
    lab.y = y;
    if (view != nil) {
        [view addSubview:lab];
    }
    
    return lab;

}
+ (UILabel *)LabelWithFont:(NSInteger)font TextColor:(UIColor *)textColor inView:(UIView *)view{
    UILabel *lab = [[UILabel alloc]init];
    lab.font = [UIFont systemFontOfSize:font];
    lab.textColor = textColor;
    
    if (view != nil) {
        [view addSubview:lab];
    }
    
    return lab;
    
}
+ (UILabel *)LabelWithText:(NSString *)str Font:(NSInteger)font TextColor:(UIColor *)textColor inView:(UIView *)view{

    UILabel *lab = [[UILabel alloc]init];
    lab.font = [UIFont systemFontOfSize:font];
    lab.textColor = textColor;
    if (str) {
        lab.text = str;
    }
      
    if (view != nil) {
        [view addSubview:lab];
    }
    
    return lab;



}

- (void)setText:(NSString *)text isSizeToFit:(BOOL)isFit{
    if (text.length > 0) {
        self.text = text;
    }
    self.text = text;
    
        if (isFit) {
            [self sizeToFit];
        }
        
    
    
}

-(void)setText:(NSString *)text AtX:(CGFloat)x AtY:(CGFloat )y isSizeToFit:(BOOL)isFit{
    if (text.length > 0) {
        self.text = text;
    }
    self.text = text;
    
    self.x = x;
    self.y = y;
    if (isFit) {
        [self sizeToFit];
    }
}
-(void)setText:(NSString *)text AtX:(CGFloat)x AtY:(CGFloat)y withWidth:(CGFloat)width height:(CGFloat)height{
    if (text.length > 0) {
        self.text = text;
    }
    self.frame = CGRectMake(x, y, width, height);

}
@end
