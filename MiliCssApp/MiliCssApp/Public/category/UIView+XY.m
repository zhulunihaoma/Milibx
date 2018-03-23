//
//  UIView+XY.m
//  XYLol
//
//  Created by mac on 14-7-6.
//  Copyright (c) 2014年 k1er. All rights reserved.
//

#import "UIView+XY.h"

@implementation UIView (XY)

- (void)setX:(CGFloat)x
{
    CGSize size = self.frame.size;
    CGPoint point = self.frame.origin;
    self.frame = (CGRect){ CGPointMake(x, point.y) , size};
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGSize size = self.frame.size;
    CGPoint point = self.frame.origin;
    self.frame = (CGRect){ CGPointMake(point.x, y) , size};
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGSize size = self.frame.size;
    CGPoint point = self.frame.origin;
    self.frame = (CGRect){point, {width, size.height}};
}

- (CGFloat)width
{
    return self.frame.size.width;
}


- (void)setHeight:(CGFloat)height
{
    CGSize size = self.frame.size;
    CGPoint point = self.frame.origin;
    self.frame = (CGRect){point, {size.width, height}};
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    self.width = size.width;
    self.height = size.height;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin
{
    self.x = origin.x;
    self.y = origin.y;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint point = self.center;
    point.x = centerX;
    self.center = point;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint point = self.center;
    point.y = centerY;
    self.center = point;
}

- (CGFloat)bottom
{
    return self.y + self.height;
}

- (CGFloat)right
{
    return self.x + self.width;
}

- (void)setRight:(CGFloat)right
{
    CGFloat x = right - self.width;
    [self setX:x];
}

- (void)setBottom:(CGFloat)bottom
{
    CGFloat y = bottom - self.height;
    [self setY:y];
}

- (void)drawLineWithOrigin:(CGPoint)origin end:(CGPoint)end color:(UIColor *)color lineWidth:(CGFloat)lineWidth
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetLineWidth(context, lineWidth);
    //起点
    CGContextMoveToPoint(context, origin.x, origin.y);
    
    //终点
    CGContextAddLineToPoint(context, end.x, end.y);
    
    CGContextStrokePath(context);
}


@end
