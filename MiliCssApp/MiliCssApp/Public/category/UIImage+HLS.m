//
//  UIImage+HLS.m
//  AutoBuy
//
//  Created by AutoBuy on 14/11/19.
//  Copyright (c) 2014年 HORIZON. All rights reserved.
//

#import "UIImage+HLS.h"

@implementation UIImage (HLS)

+ (UIImage *)imageWithName:(NSString *)name
{
    
    return [UIImage imageNamed:name];
}
+ (UIImage *)imageWithNamed:(NSString *)name {
    NSMutableString *mutableName = [NSMutableString stringWithString:name];
    if (kSCREENSIZE.height == 480) {
        
        
    }else if (kSCREENSIZE.height == 568) {
        
        
    }else if (kSCREENSIZE.height == 667){
        [mutableName appendString:@"6"];
        
    }else if (kSCREENSIZE.height == 736){
        [mutableName appendString:@"6+"];
    }
    return [UIImage imageNamed:mutableName];
}
+ (UIImage *)resizedImage:(NSString *)name
{
    return [self resizedImage:name leftScale:0.5 topScale:0.5];
}

+ (UIImage *)resizedImage:(NSString *)name leftScale:(CGFloat)leftScale topScale:(CGFloat)topScale
{
    UIImage *image = [self imageWithName:name];
    
    return [image stretchableImageWithLeftCapWidth:image.size.width * leftScale topCapHeight:image.size.height * topScale];
}


//对图片尺寸进行压缩--
- (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

+ (UIImage *)imageWithTitle:(NSString *)title fontSize:(CGFloat)size
{
    
    UIGraphicsBeginImageContext(CGSizeMake(320, 320));
    
//    UIColor *color = [UIColor colorWithRed:arc4random_uniform(255)/ 255.0f green:arc4random_uniform(255) / 255.0f blue:arc4random_uniform(255) /255.0f alpha:1.0];
    UIColor *color = MLBGColor;
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    
    [style setAlignment:NSTextAlignmentCenter];
    
    [title drawInRect:CGRectMake(0, 20, 320, 320) withAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:size], NSForegroundColorAttributeName: color, NSParagraphStyleAttributeName: style}];
    
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    

    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    imageView.contentMode = UIViewContentModeScaleToFill;
    imageView.backgroundColor = HLSColor(241, 245, 255);
//    imageView.layer.borderWidth = 10;
//    imageView.layer.cornerRadius = 30;
    imageView.layer.borderColor = HLSColor(0, 0, 0).CGColor;
    imageView.image = newImage;

    
    UIGraphicsBeginImageContextWithOptions(imageView.size, YES, 0.0);
    [imageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
    
}

+ (UIImage *)placeHolderImageWithName:(NSString *)name
{
    if (name.length == 0) {
        return nil;
    }
    unichar c = [name characterAtIndex:0];
    NSString *title;
    if (c >= 0x4E00 && c <= 0x9FFF) {
        //汉字
       title = [name substringToIndex:1];
    }else {
        //英文
        if (title.length > 1) {
            title = [name substringToIndex:2];
        }else {
            title = [name substringToIndex:1];
        }
       
        NSMutableString *otherTitle = [NSMutableString stringWithString:title];
        unichar otherC = [otherTitle characterAtIndex:0];
        if (otherC >= 97) {
            otherC -= 32;
        }
        [otherTitle replaceCharactersInRange:NSMakeRange(0, 1) withString:[NSString stringWithFormat:@"%c",otherC]];
        title = otherTitle;
    }
    


    return [UIImage imageWithTitle:title fontSize:220];
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
   
    return image;
}
+ (UIImage *)imageWithRandomColor
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 200.0f, 115.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextFillRect(context, CGRectMake(0, 5, 200, 105));
    
    CGContextSetFillColorWithColor(context, [MLBGColor CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, 200, 5));
    
    CGContextSetFillColorWithColor(context, [MLBGColor CGColor]);
    CGContextFillRect(context, CGRectMake(0, 110, 200, 5));
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithimage:(UIImage *)image
{
    CGFloat widthRate = image.size.width / 640;
    CGFloat heightRate = image.size.height / 1136;
    CGFloat rate = MAX(widthRate, heightRate);
    CGSize newSize = CGSizeMake(image.size.width / rate, image.size.height / rate);
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}
/**
 *  订单跟踪
 *
 *  @param rect <#rect description#>
 *
 *  @return <#return value description#>
 */
+ (UIImage *)imageWithRect:(CGRect)rect {
    UIGraphicsBeginImageContext(rect.size);
    
    UIColor *color = HLSOneColor(235);
    [color setStroke];
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(9, 0)];
    [bezierPath addLineToPoint:CGPointMake(9, rect.size.height)];
    [bezierPath closePath];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
