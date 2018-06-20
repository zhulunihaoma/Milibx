//
//  CustomNavigation.m
//  MARUICustomer
//
//  Created by 万存 on 15/7/8.
//  Copyright (c) 2015年 WanCun. All rights reserved.
//

#import "CustomNavigation.h"


@implementation CustomNavigation
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupSubviews];
        self.backgroundColor = MLNaviColor;
    }
    return self;
}
- (void)setupSubviews {
    UIImageView *backimg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bj_find"]];
    backimg.x= 0 ;
    backimg.y = 0;
    backimg.size = CGSizeMake(SCREEN_WIDTH, NaviHeight);
    [self addSubview:self.backimg = backimg];
    backimg.userInteractionEnabled = YES;
//    [self bringSubviewToFront:self.titleLabel];
    
    
    UIButton *leftBtn = [[UIButton alloc]init];
    [leftBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateHighlighted];
    leftBtn.y = StatueBarHeight;
    leftBtn.width = NaviHeight - StatueBarHeight;
    leftBtn.height = NaviHeight - StatueBarHeight;
    leftBtn.x = NaviLeftPadding;
    leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    leftBtn.contentMode = UIViewContentModeCenter;
    
    [self.backimg addSubview:self.leftBtn = leftBtn];
    
    UIButton *leftCloseBtn = [[UIButton alloc]init];
    [leftCloseBtn setImage:[UIImage imageNamed:@"close_btn"] forState:UIControlStateNormal];
    [leftCloseBtn setImage:[UIImage imageNamed:@"close_btn"] forState:UIControlStateHighlighted];
    leftCloseBtn.y = StatueBarHeight;
    leftCloseBtn.width = NaviHeight - StatueBarHeight;
    leftCloseBtn.height = NaviHeight - StatueBarHeight;
    leftCloseBtn.x = NaviLeftPadding+leftBtn.width;
    leftCloseBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    leftCloseBtn.contentMode = UIViewContentModeCenter;
    
    [self.backimg addSubview:self.leftCloseBtn = leftCloseBtn];
    [self.leftCloseBtn setHidden:YES];
    
    
    UIButton *rightBtn = [[UIButton alloc]init];
    rightBtn.y = StatueBarHeight;
    rightBtn.width = NaviHeight - StatueBarHeight;
    rightBtn.height = NaviHeight - StatueBarHeight;
    rightBtn.x = kSCREENSIZE.width - 15 - rightBtn.width;
    rightBtn.contentMode = UIViewContentModeCenter;
    
    [self.backimg addSubview:self.rightBtn = rightBtn];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.font = [UIFont systemFontOfSize:19];
    titleLabel.textColor = HLSOneColor(255);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.y = StatueBarHeight;
    titleLabel.width = kSCREENSIZE.width - 160;
    titleLabel.height = NaviHeight - StatueBarHeight;
    titleLabel.centerX = kSCREENSIZE.width / 2;
    [self.backimg addSubview:self.titleLabel = titleLabel];
    
    UIImageView *lineImageView = [[UIImageView alloc]init];
    lineImageView.backgroundColor = HLSColor(221, 221, 221);
    lineImageView.height = 1.0f;
    lineImageView.width = kSCREENSIZE.width;
    lineImageView.y = NaviHeight - lineImageView.height;
    [self.backimg addSubview:self.lineImageView = lineImageView];
}
@end
