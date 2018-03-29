//
//  ZLJumpView.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/3/29.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "ZLJumpView.h"
@interface ZLJumpView ()
@property (nonatomic, retain) UIControl *controlForDismiss;                     //没有按钮的时候，才会使用这个

@end


@implementation ZLJumpView
-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 200);
        
        
        self.backgroundColor = [UIColor whiteColor];
        [self setupBtn];
        
    }
    return self;
    
}

-(void)setOn{
    
    [self upView];
    
    
}
-(void)setupBtn{
    UIButton *cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 50, 20)];
    [cancelBtn addTarget:self action:@selector(Cancel) forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:HLSColor(20, 155, 232) forState:UIControlStateNormal];
    [self addSubview:cancelBtn];
    
    
    UIButton *finishBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-60, 10, 50, 20)];
    [finishBtn addTarget:self action:@selector(Finish) forControlEvents:UIControlEventTouchUpInside];
    [finishBtn setTitleColor:HLSColor(20, 155, 232) forState:UIControlStateNormal];
    
    [finishBtn setTitle:@"完成" forState:UIControlStateNormal];
    [self addSubview:finishBtn];
    
}


-(void)Cancel{
    [self downView];
    
}
-(void)Finish{
    [self downView];
    
}
//页面下沉
-(void)downView{
    
    [UIView animateWithDuration:0.1
                          delay:0.0
                        options:0
                     animations:^{
                         if (_controlForDismiss) {
                             [_controlForDismiss removeFromSuperview];
                             //把控制器去掉
                         }
                         
                         
                         [self setFrame:CGRectMake(0, SCREEN_HEIGHT-200, SCREEN_WIDTH, 200)];
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.1
                                               delay:0.0
                                             options:UIViewAnimationCurveEaseIn
                                          animations:^{
                                              [self setFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 200)];
                                          }
                                          completion:^(BOOL finished) {
                                              
                                              [self removeFromSuperview];
                                              //移除view
                                          }];
                     }];
    
    
    
    
    
    
}
-(void)upView{
    
    //添加控制（在没有取消按钮时候使用）
    _controlForDismiss = [[UIControl alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [CurrentWindow addSubview:_controlForDismiss];
    _controlForDismiss.backgroundColor = [UIColor colorWithRed:.16 green:.17 blue:.21 alpha:.5];
    [_controlForDismiss addTarget:self action:@selector(touchForDismissSelf:) forControlEvents:UIControlEventTouchUpInside];
    [CurrentWindow addSubview:self];
    
    
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:0
                     animations:^{
                         
                         [self setFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 200)];
                         
                         
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.3
                                               delay:0.0
                                             options:UIViewAnimationCurveEaseIn
                                          animations:^{
                                              [self setFrame:CGRectMake(0, SCREEN_HEIGHT-200, SCREEN_WIDTH, 200)];
                                              
                                              
                                          }
                                          completion:^(BOOL finished) {
                                              
                                          }];
                     }];
    
    
    
    
    
}


- (void)touchForDismissSelf:(id)sender
{
    //    NSDate *date = myDatePicker.date;
    //    long long time = [date timeIntervalSince1970];
    //    [self.delegate selectDateInterval:time];
    [self downView];
}


@end
