//
//  AutoBtns.h
//  Cctobz
//
//  Created by 东方斑马 on 2017/3/5.
//  Copyright © 2017年 isu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoBtns : UIView
@property(nonatomic,copy)void(^BtnBlock)(NSInteger  btntag);

@property(nonatomic,strong)NSArray *names;
@property(nonatomic,strong)NSArray *imgs;
-(void)makeEqualWidthBtnNum:(NSInteger)num Names:(NSArray *)names Imgs:(NSArray *)imgs inView:(UIView *)containerView LRpadding:(CGFloat)LRpadding viewPadding :(CGFloat)viewPadding y:(CGFloat)y titlefont:(NSInteger)font titleColor:(UIColor *)color;
-(id)initWitWidthBtnNum:(NSInteger)num Names:(NSArray *)names Imgs:(NSArray *)imgs inView:(UIView *)containerView LRpadding:(CGFloat)LRpadding viewPadding :(CGFloat)viewPadding y:(CGFloat)y titlefont:(NSInteger)font titleColor:(UIColor *)color;



@end
