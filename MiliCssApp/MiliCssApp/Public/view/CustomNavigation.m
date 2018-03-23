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
    UIButton *leftBtn = [[UIButton alloc]init];
    [leftBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateHighlighted];
    leftBtn.y = StatueBarHeight;
    leftBtn.width = NaviHeight - StatueBarHeight;
    leftBtn.height = NaviHeight - StatueBarHeight;
    leftBtn.x = NaviLeftPadding;
    leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    leftBtn.contentMode = UIViewContentModeCenter;
    
    [self addSubview:self.leftBtn = leftBtn];
    
    UIButton *rightBtn = [[UIButton alloc]init];
    rightBtn.y = StatueBarHeight;
    rightBtn.width = NaviHeight - StatueBarHeight;
    rightBtn.height = NaviHeight - StatueBarHeight;
    rightBtn.x = kSCREENSIZE.width - 15 - rightBtn.width;
    rightBtn.contentMode = UIViewContentModeCenter;
    
    [self addSubview:self.rightBtn = rightBtn];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.font = [UIFont systemFontOfSize:19];
    titleLabel.textColor = HLSOneColor(0);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.y = StatueBarHeight;
    titleLabel.width = kSCREENSIZE.width - 160;
    titleLabel.height = NaviHeight - StatueBarHeight;
    titleLabel.centerX = kSCREENSIZE.width / 2;
    [self addSubview:self.titleLabel = titleLabel];
    
    UIImageView *lineImageView = [[UIImageView alloc]init];
    lineImageView.backgroundColor = HLSColor(221, 221, 221);
    lineImageView.height = 1.0f;
    lineImageView.width = kSCREENSIZE.width;
    lineImageView.y = NaviHeight - lineImageView.height;
    [self addSubview:self.lineImageView = lineImageView];
}
@end
