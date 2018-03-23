//
//  CustomNavigation.h
//  MARUICustomer
//
//  Created by 万存 on 15/7/8.
//  Copyright (c) 2015年 WanCun. All rights reserved.
//

#import <UIKit/UIKit.h>

#define StatueBarHeight 20
#define NaviHeight 64
#define NaviLeftPadding 10
@interface CustomNavigation : UIView

/**
 *  navi左边按钮
 */
@property (nonatomic,strong) UIButton * leftBtn;
/**
 *  navi右边按钮
 */
@property (nonatomic,strong) UIButton * rightBtn;
/**
 *  标题
 */
@property (nonatomic,strong) UILabel * titleLabel;
/**
 *  最下面的线
 */
@property (nonatomic,strong) UIImageView * lineImageView;

@end
