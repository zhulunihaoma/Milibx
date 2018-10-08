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
        self.separatorImageView.hidden = YES;
      
        self.contentView.backgroundColor = MLBGColor;
    }
    return self;
}
-(void)setupViews{
    
    

    //        self.layer.cornerRadius = 8;

    //图标
    _leftimg = [[UIImageView alloc]init];
    [self.contentView addSubview:_leftimg];
    _leftimg.sd_layout
    .rightSpaceToView(self.contentView, 24)
    .centerYEqualToView(self.contentView)
    .widthIs(28)
    .heightIs(28);
    _leftimg.image = [UIImage imageNamed:@"btn_arrow"];

//    标题
    _titlelab = [[UILabel alloc]init];
    _titlelab.font = TextFontSize(16);
    _titlelab.textColor = MLTittleColor;

    [self.contentView addSubview:_titlelab];
    _titlelab.textAlignment = NSTextAlignmentLeft;
    _titlelab.sd_layout
    .leftSpaceToView(self.contentView, 35)
    .widthIs(100)
    .heightIs(20)
    .centerYEqualToView(self.contentView);
}
-(void)setModel:(NSDictionary *)model{
    _titlelab.text = model[@"tittle"];
   
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
