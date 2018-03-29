//
//  BDInfo_TopTableViewCell.m
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/28.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "BDInfo_TopTableViewCell.h"

@implementation BDInfo_TopTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        self.separatorImageView.x = 31;
    }
    return self;
}
-(void)setupViews{
   
    // 标题
    _titlelab = [[UILabel alloc]init];
    _titlelab.font = TextFontSize(17);
    _titlelab.textColor = MLTittleColor;
    
    [self addSubview:_titlelab];
    _titlelab.textAlignment = NSTextAlignmentLeft;
    _titlelab.sd_layout
    .leftSpaceToView(self, 30)
    .heightIs(20)
    .centerYEqualToView(self);
    [_titlelab setSingleLineAutoResizeWithMaxWidth:(200)];
    // detail
    
    _detaillab = [[UILabel alloc]init];
    _detaillab.font = TextFontSize(17);
    _detaillab.textColor = MLDetailColor;
    
    [self addSubview:_detaillab];
    _detaillab.textAlignment = NSTextAlignmentLeft;
    _detaillab.sd_layout
    .rightSpaceToView(self, 30)
    .heightIs(20)
    .centerYEqualToView(self);
    [_detaillab setSingleLineAutoResizeWithMaxWidth:(200)];
}
-(void)setName:(NSString *)name{
    _detaillab.text = name;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
