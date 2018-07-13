//
//  ComDetailCell.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/3/29.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "ComDetailCell.h"

@implementation ComDetailCell


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
   
  
    //分成比例
    UILabel *degreetittle = [HLSLable LabelWithFont:14 WithTextalignment:NSTextAlignmentRight WithTextColor:MLNaviColor WithFatherView:self];
    degreetittle.sd_layout
    .heightIs(16)
    .widthIs(43)
    .topSpaceToView(name, 25)
    .leftSpaceToView(self, 30);
    [degreetittle setSingleLineAutoResizeWithMaxWidth:(200)];
   
    
    name.text = @"安心驾考宝";
    degreetittle.text = @"分成比例:75%";
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
