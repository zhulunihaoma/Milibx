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
    self.LeftImg.image = [UIImage imageNamed:@"ico_message_1"];
    [self addSubview:self.LeftImg];
    self.LeftImg.sd_layout
    .heightIs(45)
    .widthIs(45)
    .leftSpaceToView(self, 15)
    .centerYEqualToView(self);
//    红色点
    self.Redimg = [[UIImageView alloc]init];
    [self.LeftImg addSubview:self.Redimg];
    self.Redimg.sd_layout
    .heightIs(10)
    .widthIs(10)
    .rightSpaceToView(self.LeftImg, -5)
    .topSpaceToView(self.LeftImg, -5);
    
    
    // 名称
    _TittleLab = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:self];
    _TittleLab.sd_layout
    .heightIs(17)
    .topSpaceToView(self, 20)
    .leftSpaceToView(self.LeftImg, 11);
    [_TittleLab setSingleLineAutoResizeWithMaxWidth:(200)];
    
    _TittleLab.text = @"";
    
    // time
    _TimeLab = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLDetailColor WithFatherView:self];
    _TimeLab.sd_layout
    .heightIs(12)
    .topSpaceToView(self, 23)
    .rightSpaceToView(self, 13);
    [_TimeLab setSingleLineAutoResizeWithMaxWidth:(80)];
    
    _TimeLab.text = @"18/05/18";
    
    // des
    _DesLab = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLDetailColor WithFatherView:self];
    _DesLab.sd_layout
    .heightIs(12)
    .topSpaceToView(_TittleLab, 12)
    .leftEqualToView(_TittleLab)
    .rightSpaceToView(self, 21);
    
    _DesLab.text = @"";
}
-(void)setModel:(MessageModel *)Model{
    _Model = Model;
    NSString *Typeimg;
    switch ([Model.infoType integerValue]) {
        case 1:
            Typeimg = @"ico_message_1";
            break;
        case 2:
            Typeimg = @"ico_message_3";
            break;
        case 3:
            Typeimg = @"ico_message_4";
            break;
        case 4:
            Typeimg = @"ico_message_5";
            break;
        case 5:
            Typeimg = @"ico_message_2";
            break;
        default:
            break;
    }
    if (Model) {
        _TittleLab.text = Model.infoTitle;
        _DesLab.text = Model.infoContent;
        _TimeLab.text = [[Model.gmtCreate substringToIndex:10] stringByReplacingOccurrencesOfString:@"-" withString:@"/"];
        self.LeftImg.image = [UIImage imageNamed:Typeimg];
        if ([Model.status integerValue] == 1) {
            self.Redimg.image = [UIImage imageNamed:@"img_newmessage"];

        }
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
