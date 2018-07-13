//
//  AddCell.m
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/28.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "AddCell.h"

@implementation AddCell

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

    // 输入框
    
    UITextField *inputfield = [[UITextField alloc]init];
    inputfield.font = TextFontSize(17);
    inputfield.textColor = MLTittleColor;
    
    [self addSubview:inputfield];
    inputfield.sd_layout
    .leftSpaceToView(self, 140)
    .heightIs(20)
    .widthIs(200)
    .centerYEqualToView(self);
    _inputfield = inputfield;
//  右侧选择
    //    箭头
    UIImageView *arrow = [[UIImageView alloc]init];
    arrow.image = [UIImage imageNamed:@"img_achievement_arrow"];
    [self addSubview:arrow];
    [arrow sizeToFit];
    arrow.centerY = 25;
    arrow.x = SCREEN_WIDTH - 10- arrow.width;
    
    _arrow = arrow;
    // 输入框
    
    UITextField *choosefild = [[UITextField alloc]init];
    choosefild.font = TextFontSize(17);
    choosefild.textColor = MLTittleColor;
    choosefild.placeholder = @"请选择";
    choosefild.textAlignment = NSTextAlignmentRight;
    [self addSubview:choosefild];
    choosefild.sd_layout
    .rightSpaceToView(self, 40)
    .heightIs(20)
    .widthIs(200)
    .centerYEqualToView(self);
    _choosefild = choosefild;
    
    
    _choosefild.hidden = YES;
    _arrow.hidden = YES;

}
-(void)setIschoose:(BOOL)Ischoose{
    _choosefild.hidden = NO;
    _arrow.hidden = NO;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
