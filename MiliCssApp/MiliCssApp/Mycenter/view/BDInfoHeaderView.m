//
//  BDInfoHeaderView.m
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/28.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "BDInfoHeaderView.h"

@implementation BDInfoHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *vline = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:self];
        vline.backgroundColor = MLNaviColor;
        vline.height = 16;
        vline.width = 4;
        vline.x = 19;
        vline.centerY = 25.5;
        UILabel *title = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:self];
        title.sd_layout
        .centerYEqualToView(self)
        .leftSpaceToView(vline, 8)
        .heightIs(17);
        [title setSingleLineAutoResizeWithMaxWidth:(120)];
        _title = title;
    }
    return self;
}

-(void)setTittlename:(NSString *)titlename{
    _title.text = titlename;
    
}

@end
