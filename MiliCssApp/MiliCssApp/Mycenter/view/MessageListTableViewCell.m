//
//  MessageListTableViewCell.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/31.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "MessageListTableViewCell.h"

@implementation MessageListTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        self.backgroundColor = [UIColor whiteColor];
        self.separatorImageView.hidden = YES;
        self.layer.cornerRadius = 8;
        self.layer.masksToBounds = YES;
    }
    return self;
}
-(void)setupViews{
//左侧图片
    self.LeftImg = [[UIImageView alloc]init];
    self.LeftImg.image = [UIImage imageNamed:@"btn_me_function_4"];
    [self addSubview:self.LeftImg];
    self.LeftImg.sd_layout
    .heightIs(45)
    .widthIs(45)
    .leftSpaceToView(self, 15)
    .centerYEqualToView(self);
    
    // 名称
    _TittleLab = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentRight WithTextColor:MLTittleColor WithFatherView:self];
    _TittleLab.sd_layout
    .heightIs(17)
    .topSpaceToView(self, 20)
    .leftSpaceToView(self.LeftImg, 11);
    [_TittleLab setSingleLineAutoResizeWithMaxWidth:(200)];
    
    _TittleLab.text = @"用户出单通知";
    
    // time
    _TimeLab = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentRight WithTextColor:MLDetailColor WithFatherView:self];
    _TimeLab.sd_layout
    .heightIs(12)
    .topSpaceToView(self, 23)
    .rightSpaceToView(self, 13);
    [_TimeLab setSingleLineAutoResizeWithMaxWidth:(80)];
    
    _TimeLab.text = @"18/05/18";
    
    // des
    _DesLab = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentRight WithTextColor:MLDetailColor WithFatherView:self];
    _DesLab.sd_layout
    .heightIs(12)
    .topSpaceToView(_TittleLab, 12)
    .leftEqualToView(_TittleLab)
    .rightSpaceToView(self, 21);
    
    _DesLab.text = @"下级代理张教练已出单，您获得了20元净利润来了";
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
