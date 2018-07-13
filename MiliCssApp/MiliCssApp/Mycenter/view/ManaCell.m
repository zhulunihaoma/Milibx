//
//  ManaCell.m
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/28.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "ManaCell.h"

@implementation ManaCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        self.backgroundColor = [UIColor whiteColor];
        self.separatorImageView.hidden = YES;
    }
    return self;
}
-(void)setupViews{
    // 名称
    UILabel *name = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentRight WithTextColor:MLTittleColor WithFatherView:self];
    name.sd_layout
    .heightIs(17)
    .topSpaceToView(self, 21)
    .leftSpaceToView(self, 26);
    [name setSingleLineAutoResizeWithMaxWidth:(200)];
    
    // 状态
    UILabel *state = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentRight WithTextColor:[UIColor whiteColor] WithFatherView:self];
    state.backgroundColor = HLSOneColor(192);
    state.sd_layout
    .heightIs(16)
    .widthIs(43)
    .centerYEqualToView(name)
    .leftSpaceToView(name, 8);
    [state setSingleLineAutoResizeWithMaxWidth:(200)];
    
    // 累计总保费：
    UILabel *baofei = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentRight WithTextColor:MLTittleColor WithFatherView:self];
    baofei.sd_layout
    .heightIs(12)
    .topSpaceToView(name, 11)
    .leftSpaceToView(self, 26);
    [baofei setSingleLineAutoResizeWithMaxWidth:(200)];
    
    
    // 30000元
    UILabel *baofeinum = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentRight WithTextColor:HLSColor(255,123,6) WithFatherView:self];
    baofeinum.sd_layout
    .heightIs(12)
    .topSpaceToView(name, 11)
    .leftSpaceToView(baofei,0);
    [baofeinum setSingleLineAutoResizeWithMaxWidth:(200)];
    
    // 30000元
    UILabel *datetime = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentRight WithTextColor:MLTittleColor WithFatherView:self];
    datetime.sd_layout
    .heightIs(12)
    .topSpaceToView(name, 11)
    .leftSpaceToView(baofeinum, 29);
    [datetime setSingleLineAutoResizeWithMaxWidth:(200)];
    
    
    
    name.text = @"朱璐";
    state.text = @"已冻结";
    baofei.text = @"累计总保费：";

    baofeinum.text = @"30000元";

    datetime.text = @"加入日期：2017-08-30";


}
-(void)setModel:(NSDictionary *)model{

    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
