//
//  TopImgBottomLabBtn.m
//  Cctobz
//
//  Created by 东方斑马 on 2017/5/18.
//  Copyright © 2017年 isu. All rights reserved.
//

#import "TopImgBottomLabBtn.h"
#define Btnwith 60
#define Btnheght 100

@implementation TopImgBottomLabBtn

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    //gao 45 kuan 60
    return CGRectMake(Btnwith/2-10, 6, 20, 20);
}



- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0,28, Btnwith, 15);
}

@end
