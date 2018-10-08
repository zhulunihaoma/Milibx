//
//  AddTittleBG.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/8/8.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "AddTittleBG.h"

@implementation AddTittleBG
+ (void)AddTittleBGWithTittlelab:(UILabel *)tittlelab{
    CALayer *subLayer=[CALayer layer];
    
    CGRect fixframe= tittlelab.layer.frame;
    
    
    
    subLayer.frame= CGRectMake(0, 10, tittlelab.text.length * 16, 12);
    
    subLayer.backgroundColor=MLTitleBGColor.CGColor;
    
    subLayer.masksToBounds=NO;
    
    
    [tittlelab.layer insertSublayer:subLayer below:tittlelab.layer];
    
    
    
}

@end
