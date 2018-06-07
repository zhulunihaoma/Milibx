//
//  HKNewsButton.m
//  HKNewsBannerView
//
//  Created by Mac on 16/7/9.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "HKNewsButton.h"

@implementation HKNewsButton
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        self.titleEdgeInsets = UIEdgeInsetsMake(0, -12, 20, 0);
        self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        self.titleLabel.font = TextFontSize(14);
        self.backgroundColor = [UIColor whiteColor];
        self.imageEdgeInsets = UIEdgeInsetsMake(20, 0, 0, 120);
//
        _deslab = [[UILabel alloc]init];
//        _deslab.text = @"aaa";
        _deslab.textColor = HLSColor(255, 117, 16);
        _deslab.font = TextFontSize(12);
        _deslab.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_deslab];
        _deslab.sd_layout
        .topSpaceToView(self, 20)
        .leftSpaceToView(self, 15)
        .widthIs(100)
        .heightIs(17);
    }
    
    return self;
}

- (void)setHighlighted:(BOOL)highlighted
{}
@end
