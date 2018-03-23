//
//  UIView+XY.h
//  XYLol
//
//  Created by mac on 14-7-6.
//  Copyright (c) 2014年 k1er. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XY)

@property (nonatomic, assign) CGFloat x;

@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic, assign) CGFloat right;

@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) CGPoint origin;

@property (nonatomic, assign) CGFloat centerX;

@property (nonatomic, assign) CGFloat centerY;

- (void)drawLineWithOrigin:(CGPoint)origin end:(CGPoint)end color:(UIColor *)color lineWidth:(CGFloat)lineWidth;

@end
