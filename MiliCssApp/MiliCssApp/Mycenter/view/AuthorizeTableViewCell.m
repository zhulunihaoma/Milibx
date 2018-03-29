//
//  AuthorizeTableViewCell.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/3/29.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "AuthorizeTableViewCell.h"

@implementation AuthorizeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        self.backgroundColor = [UIColor whiteColor];
        self.separatorImageView.x = 30;
    }
    return self;
}
-(void)setupViews{
    // 名称
    UILabel *name = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentRight WithTextColor:MLTittleColor WithFatherView:self];
    name.sd_layout
    .heightIs(17)
    .topSpaceToView(self, 17)
    .leftSpaceToView(self, 30);
    [name setSingleLineAutoResizeWithMaxWidth:(200)];
//    开关
   UISwitch *SwitchButton = [[UISwitch alloc]init];
    SwitchButton.onTintColor = HLSColor(0, 125, 255);
    
    [self addSubview:SwitchButton];
    SwitchButton.on = YES;
    SwitchButton.sd_layout
    .heightIs(10)
    .widthIs(30)
    .topEqualToView(name)
    .rightSpaceToView(self, 23);
    
//    分成比例
    UIView *degreeview = [[UIView alloc]init];
    degreeview.backgroundColor = COLORWithRGB(0, 125, 255, 0.1);

    [self addSubview:degreeview];
    degreeview.sd_layout
    .leftSpaceToView(self, 30)
    .rightSpaceToView(self, 25)
    .topSpaceToView(name, 20)
    .heightIs(32);
    //分成比例
    UILabel *degreetittle = [HLSLable LabelWithFont:14 WithTextalignment:NSTextAlignmentRight WithTextColor:MLTittleColor WithFatherView:degreeview];
    degreetittle.sd_layout
    .heightIs(16)
    .widthIs(43)
    .centerYEqualToView(degreeview)
    .leftSpaceToView(degreeview, 12);
    [degreetittle setSingleLineAutoResizeWithMaxWidth:(200)];
    // 输入框
    
    UITextField *degreenum = [[UITextField alloc]init];
    degreenum.font = TextFontSize(17);
    degreenum.textColor = MLTittleColor;
    degreenum.placeholder = @"%";
    degreenum.textAlignment = NSTextAlignmentRight;
    [degreeview addSubview:degreenum];
    degreenum.sd_layout
    .rightSpaceToView(degreeview, 11)
    .heightIs(20)
    .widthIs(200)
    .centerYEqualToView(degreeview);
    
    
    name.text = @"朱璐";
    degreetittle.text = @"分成比例:";
//    degreenum.text = @"累计总保费：";
//
//    baofeinum.text = @"30000元";
//
//    datetime.text = @"加入日期：2017-08-30";
//
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
