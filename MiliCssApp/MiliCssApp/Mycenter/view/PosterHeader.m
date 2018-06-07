//
//  PosterHeader.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/6/4.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "PosterHeader.h"

@implementation PosterHeader

-(instancetype)initWithFrame:(CGRect)frame{
    self= [super initWithFrame:frame];
    if (self) {
        
        //        前面的绿色标签
        UIImageView *GreenView = [[UIImageView alloc]init];
        [self addSubview:GreenView];
        GreenView.backgroundColor = MLNaviColor;
        GreenView.sd_layout
        .leftSpaceToView(self,17)
        .centerYEqualToView(self)
        .widthIs(4)
        .heightIs(16);
        
        self.nameLabel = [UILabel new];
        [self addSubview:self.nameLabel];
        self.nameLabel.sd_layout
        .leftSpaceToView(GreenView,10)
        .rightSpaceToView(self,100)
        .heightIs(20)
        .centerYEqualToView(self);
        self.nameLabel.textColor = HLSOneColor(134);
        self.nameLabel.font = TextFontSize(14);
        
        
        
    }
    return self;
}
@end
