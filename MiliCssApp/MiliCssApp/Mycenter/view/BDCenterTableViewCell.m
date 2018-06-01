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
    
    UIView *BBgView = [UIView new];
    BBgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50);
    [self.contentView addSubview:BBgView];
    BBgView.backgroundColor = [UIColor redColor];
    
    UIView *BgView = [UIView new];
    BgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50);
    BgView.layer.masksToBounds = YES;
    BgView.layer.cornerRadius = 8;
    [BBgView addSubview:BgView];
    BBgView.backgroundColor = MLBGColor;
    
    
    
    UIView *topView = [UIView new];
    topView.frame = CGRectMake(9, 0, SCREEN_WIDTH-18, 50);
    [BgView addSubview:topView];
    topView.backgroundColor = [UIColor whiteColor];
    topView.layer.masksToBounds = YES;
    topView.layer.cornerRadius = 8;

    //        self.layer.cornerRadius = 8;

    //图标
    _leftimg = [[UIImageView alloc]init];
    [BgView addSubview:_leftimg];
    _leftimg.sd_layout
    .rightSpaceToView(BgView, 24)
    .centerYEqualToView(BgView)
    .widthIs(28)
    .heightIs(28);
    _leftimg.image = [UIImage imageNamed:@"btn_arrow"];

//    标题
    _titlelab = [[UILabel alloc]init];
    _titlelab.font = TextFontSize(16);
    _titlelab.textColor = MLTittleColor;

    [BgView addSubview:_titlelab];
    _titlelab.textAlignment = NSTextAlignmentLeft;
    _titlelab.sd_layout
    .leftSpaceToView(BgView, 32)
    .widthIs(100)
    .heightIs(20)
    .centerYEqualToView(BgView);
}
-(void)setModel:(NSDictionary *)model{
    _titlelab.text = model[@"tittle"];
   
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
