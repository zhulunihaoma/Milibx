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
      
        UILabel *title = [HLSLable LabelWithFont:16 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:self];
        title.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
        

        title.sd_layout
        .centerYEqualToView(self)
        .leftSpaceToView(self, 17)
        .heightIs(17);
        [title setSingleLineAutoResizeWithMaxWidth:(120)];
        _title = title;

    }
    return self;
}

-(void)setTittlename:(NSString *)titlename{
    _title.text = titlename;
    [AddTittleBG AddTittleBGWithTittlelab:_title];

}

@end
