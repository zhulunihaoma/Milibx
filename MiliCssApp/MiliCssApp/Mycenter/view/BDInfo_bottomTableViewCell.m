//
//  BDInfo_bottomTableViewCell.m
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/28.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "BDInfo_bottomTableViewCell.h"

@implementation BDInfo_bottomTableViewCell


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
    
    // 地区
    _arealab = [[UILabel alloc]init];
    _arealab.font = TextFontSize(17);
    _arealab.textColor = MLTittleColor;
    
    [self addSubview:_arealab];
    _arealab.textAlignment = NSTextAlignmentLeft;
    _arealab.sd_layout
    .leftSpaceToView(self, 32)
    .topSpaceToView(self, 18)
    .heightIs(17);
    [_arealab setSingleLineAutoResizeWithMaxWidth:(200)];
    // 产品名称
    
    _proname = [[UILabel alloc]init];
    _proname.font = TextFontSize(17);
    _proname.textColor = MLTittleColor;
    _proname.layer.cornerRadius = 2;
    _proname.layer.backgroundColor = COLORWithRGB(0, 125, 125, 0.1).CGColor;
    [self addSubview:_proname];
    _proname.textAlignment = NSTextAlignmentLeft;
    _proname.sd_layout
    .leftSpaceToView(self, 32)
    .rightSpaceToView(self, 24)
    .heightIs(32)
    .centerYEqualToView(self);
    
    // 费率
    
    _degreelab = [[UILabel alloc]init];
    _degreelab.font = TextFontSize(14);
    _degreelab.textColor = MLNaviColor;
    
    [self addSubview:_degreelab];
    _degreelab.textAlignment = NSTextAlignmentLeft;
    _degreelab.sd_layout
    .leftSpaceToView(self, 43)
    .topSpaceToView(_proname, 13)
    .heightIs(17)
    .centerYEqualToView(self);
    [_degreelab setSingleLineAutoResizeWithMaxWidth:(300)];

}
-(void)setModel:(NSString *)model{
    _arealab.text = @"东京";
    _proname.text = @"  东京旅游保障";
    _degreelab.text = @"推广费费率:99%";

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
