//
//  BDCenterTableViewCell.m
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/27.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "BDCenterTableViewCell.h"

@implementation BDCenterTableViewCell

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
    //图标
    _leftimg = [[UIImageView alloc]init];
    [self addSubview:_leftimg];
    _leftimg.sd_layout
    .leftSpaceToView(self, 27)
    .centerYEqualToView(self)
    .widthIs(28)
    .heightIs(28);
//    标题
    _titlelab = [[UILabel alloc]init];
    _titlelab.font = TextFontSize(17);
    _titlelab.textColor = MLTittleColor;

    [self addSubview:_titlelab];
    _titlelab.textAlignment = NSTextAlignmentLeft;
    _titlelab.sd_layout
    .leftSpaceToView(_leftimg, 13)
    .widthIs(100)
    .heightIs(20)
    .centerYEqualToView(self);
}
-(void)setModel:(NSDictionary *)model{
    _leftimg.image = [UIImage imageNamed:model[@"image"]];
    _titlelab.text = model[@"tittle"];
   
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
