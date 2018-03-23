//
//  UILabel+Line.m
//  Banchetong
//
//  Created by horizon on 15/11/4.
//  Copyright © 2015年 horizon. All rights reserved.
//

#import "UIView+Line.h"

@implementation UIView (Line)
+(UIView *)createTextVWithLine:(BOOL)haveBtn WithLineColor:(UIColor *)lineColor WithPlaceholder:(NSString *)holderStr WithFatherView:(UIView *)fatherView WithTag:(NSInteger)tag{

    UIView *bgView = [[UIView alloc]init];
    //    bgView.backgroundColor = HLSGrayColor;
    //    bgView.size = CGSizeMake(SCREEN_WIDTH, 90);
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 50));
    }];
    [fatherView addSubview:bgView];
    
    
    UITextField *unameField = [[UITextField alloc]init];
    [bgView addSubview:unameField];
//    unameField.delegate = ;

    
    CGFloat width;
    if (haveBtn) {
        width = SCREEN_WIDTH-190;
        
    }else{
        width = SCREEN_WIDTH-70;
        
        
    }
    
    unameField.frame = CGRectMake(35,0,width , 49);
    unameField.font = [UIFont systemFontOfSize:15];
    unameField.textColor = [UIColor blackColor];
    unameField.textAlignment = NSTextAlignmentLeft;
    unameField.placeholder = holderStr;
    unameField.tag = tag;
    
    if (tag == 1000|| tag == 4000) {
        unameField.keyboardType = UIKeyboardTypeNumberPad;
    }
    

    if (haveBtn) {
        //创建发送验证码的按钮
        UIButton *testBtn = [[UIButton alloc]init];
        [bgView addSubview:testBtn];
        testBtn.frame = CGRectMake(unameField.right, unameField.y+7, 120, unameField.height-14);
        
        testBtn.backgroundColor = HLSColor(20, 150, 255);
        testBtn.layer.cornerRadius = 10;
        [testBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        [testBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [testBtn addTarget:self action:@selector(sendTest) forControlEvents:UIControlEventTouchUpInside];
        testBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        
        testBtn.layer.cornerRadius = 4;
        //        testBtn.layer.borderColor = HLSColor(221, 221, 221).CGColor;
        //        testBtn.layer.borderWidth = 0.5;
    }
    //创建line
    UILabel *line = [[UILabel alloc]init];
    line.frame = CGRectMake(20, unameField.bottom, SCREEN_WIDTH-40, 0.5);
    line.backgroundColor = lineColor;
    [bgView addSubview:line];
    
    
    return bgView;
    


}
+(UIView *)createTextVWithLine:(BOOL)haveBtn WithLineColor:(UIColor *)lineColor WithPlaceholder:(NSString *)holderStr WithFatherView:(UIView *)fatherView WithMM:(BOOL)mm{

    
    UIView *bgView = [[UIView alloc]init];
    //    bgView.backgroundColor = HLSGrayColor;
    //    bgView.size = CGSizeMake(SCREEN_WIDTH, 90);
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 50));
    }];
    [fatherView addSubview:bgView];
    
    
    UITextField *unameField = [[UITextField alloc]init];
    [bgView addSubview:unameField];
    CGFloat width;
    if (haveBtn) {
        width = SCREEN_WIDTH-190;
        
    }else{
        width = SCREEN_WIDTH-70;
        
        
    }
    if (mm) {
        unameField.secureTextEntry = YES;
    }
    unameField.frame = CGRectMake(35,0,width , 49);
    unameField.font = [UIFont systemFontOfSize:15];
    unameField.textColor = [UIColor blackColor];
    unameField.textAlignment = NSTextAlignmentLeft;
    unameField.placeholder = holderStr;
    if (haveBtn) {
        //创建发送验证码的按钮
        UIButton *testBtn = [[UIButton alloc]init];
        [bgView addSubview:testBtn];
        testBtn.frame = CGRectMake(unameField.right, unameField.y+7, 120, unameField.height-14);
        
        testBtn.backgroundColor = HLSColor(20, 150, 255);
        testBtn.layer.cornerRadius = 10;
        [testBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        [testBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [testBtn addTarget:self action:@selector(sendTest) forControlEvents:UIControlEventTouchUpInside];
        testBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        
        testBtn.layer.cornerRadius = 4;
        //        testBtn.layer.borderColor = HLSColor(221, 221, 221).CGColor;
        //        testBtn.layer.borderWidth = 0.5;
    }
    //创建line
    UILabel *line = [[UILabel alloc]init];
    line.frame = CGRectMake(20, unameField.bottom, SCREEN_WIDTH-40, 0.5);
    line.backgroundColor = lineColor;
    [bgView addSubview:line];
    
    
    return bgView;
    
}


@end
