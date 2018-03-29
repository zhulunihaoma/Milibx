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
    .leftSpaceToView(_titlelab, 10)
    .heightIs(20)
    .widthIs(200)
    .centerYEqualToView(self);
    _inputfield = inputfield;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
