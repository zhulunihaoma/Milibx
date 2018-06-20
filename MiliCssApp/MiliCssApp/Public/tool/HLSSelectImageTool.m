//
//  HLSSelectImageTool.m
//  车源通
//
//  Created by AutoBuy on 15/4/16.
//  Copyright (c) 2015年 HORIZON. All rights reserved.
//

#import "HLSSelectImageTool.h"
#import "UIImage+HLS.h"
@implementation HLSSelectImageTool
+ (NSData *)selectImageWithImage:(UIImage *)image {
    

    //设置image的尺寸

    CGSize imagesize = image.size;
    float x = 1080 / imagesize.width;
    float y = 1080 / imagesize.height;
    
    float xy = MIN(roundf(x), roundf(y)) >= 1 ? 0.8 : MIN(x, y);
    imagesize.height = imagesize.height * xy;
    imagesize.width = imagesize.width * xy;
    image = [image imageWithImage:image scaledToSize:imagesize];
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.8);
    
    UIImage *currentImage = [UIImage imageWithData:imageData];
    while (imageData.length > 100 * 1024) {
        
        imageData = [self selectImageWithImage:currentImage];
        
    }

    return imageData;
}

@end
