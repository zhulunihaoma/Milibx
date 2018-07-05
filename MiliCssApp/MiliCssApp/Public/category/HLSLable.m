//
//  HLSLable.m
//  autoBuy
//
//  Created by AutoBuy on 14/12/2.
//  Copyright (c) 2014年 HORIZON. All rights reserved.
//

#import "HLSLable.h"
#import "LoginViewController.h"
@implementation HLSLable

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

+ (void)lableWithText:(NSString *)text {
    if ([text isEqualToString:@"10016020"]) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您的账号已经在其他地方登录，为了保证您的账户安全，请您重新登录。" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
            LoginViewController *lvc = [[LoginViewController alloc]init];
            UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:lvc];
            nvc.navigationBarHidden = YES;
            [[GetUnderController getCurrentVC] presentViewController:nvc animated:YES completion:nil];

        }];
        
        
        
        [alert addAction:action];
        
        [[GetUnderController getCurrentVC] presentViewController:alert animated:YES completion:nil];
        
     
        return;
    }
    if ([text isEqualToString:@"10013333"]) {
        
        LoginViewController *lvc = [[LoginViewController alloc]init];
        UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:lvc];
        nvc.navigationBarHidden = YES;
        [[GetUnderController getCurrentVC] presentViewController:nvc animated:YES completion:nil];

        return;
    }
    HLSLable *lable = [[HLSLable alloc]init];
    
    lable.alpha = 0;
    lable.textAlignment = NSTextAlignmentCenter;
    lable.text = text;
    
    lable.font = [UIFont systemFontOfSize:13];
    lable.textColor = [UIColor whiteColor];
    lable.backgroundColor = HLSColor(120, 121, 123);
    lable.layer.cornerRadius = 4;
    lable.layer.masksToBounds = YES;
    [lable sizeToFit];
    if (lable.width < 100) {
        lable.width = 100;
    }
    lable.height = 50;
    lable.width += 20;
    lable.centerX = kSCREENSIZE.width * 0.5;
    lable.centerY = kSCREENSIZE.height * 0.5 - 32;
    [[UIApplication sharedApplication].keyWindow addSubview:lable];
    
    
    lable.alpha = 0.8;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)),dispatch_get_main_queue(), ^{
        
        //2秒以后移除view
        
        [lable removeFromSuperview];
        
    });

//    [UIView animateWithDuration:3.0 animations:^{
//        lable.alpha = 0.8;
//        
//        
//        
//    } completion:^(BOOL finished) {
//        
//        
//        
//    }];
//    [UIView animateWithDuration:3.0 animations:^{
//        
//        lable.alpha = 0;
//        
//        
//        
//    } completion:^(BOOL finished) {
//        [lable removeFromSuperview];
//    }];
//    
    

}


+ (void)lableWithText:(NSString *)text inView:(UIView *)view{
    
    //    CGRect rect = [text boundingRectWithSize:CGSizeMake(300, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
    HLSLable *lable = [[HLSLable alloc]init];
    //    lable.frame = CGRectMake((kSCREENSIZE.width - rect.size.width)/2, kSCREENSIZE.height - 100, rect.size.width, 20);
    
    lable.alpha = 0;
    lable.textAlignment = NSTextAlignmentCenter;
    lable.text = text;
    
    lable.font = [UIFont systemFontOfSize:13];
    lable.textColor = [UIColor whiteColor];
    lable.backgroundColor = HLSColor(120, 121, 123);
    lable.layer.cornerRadius = 4;
    lable.layer.masksToBounds = YES;
    [lable sizeToFit];
    if (lable.width < 100) {
        lable.width = 100;
    }
    lable.height = 50;
    lable.width += 20;
    lable.centerX = kSCREENSIZE.width * 0.5;
    lable.centerY = kSCREENSIZE.height * 0.5 - 32;
    
    [view becomeFirstResponder];
    
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    
    if ([window isKeyWindow] == NO)
    {
        [window becomeKeyWindow];
        [window makeKeyAndVisible];
    }
    
    [window addSubview:lable];
    
    
    lable.alpha = 0.8;
//    [UIView animateWithDuration:3.0 animations:^{
//        lable.alpha = 0;
//    } completion:^(BOOL finished) {
//        
//        [lable removeFromSuperview];
//        
//        
//    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)),dispatch_get_main_queue(), ^{
        
        //2秒以后移除view
        
        [lable removeFromSuperview];
        
    });
    
}

+(UILabel *)LabelWithFont:(NSInteger)font WithTextalignment:(NSTextAlignment)Alignment WithTextColor:(UIColor *)textColor WithFatherView:(UIView*)fview{
    UILabel *lab = [[UILabel alloc]init];
    lab.textAlignment = Alignment;
    lab.font = [UIFont systemFontOfSize:font];
    lab.textColor = textColor;
    
    if (fview != nil) {
        [fview addSubview:lab];
    }
    
    return lab;
}


@end
