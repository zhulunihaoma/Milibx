//
//  Wallet_Image_TittleCell.m
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/30.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "Wallet_Image_TittleCell.h"

@implementation Wallet_Image_TittleCell


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
    //图片
    UIImageView *icon = [[UIImageView alloc]init];
    icon.image = [UIImage imageNamed:@"img_achievement_arrow"];
    [self addSubview:icon];
    [icon sizeToFit];
    icon.sd_layout
    .leftSpaceToView(self, 30)
    .centerYEqualToView(self);
    
    // 名称
    UILabel *name = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentRight WithTextColor:MLTittleColor WithFatherView:self];
    name.sd_layout
    .heightIs(17)
    .topSpaceToView(self, 17)
    .leftSpaceToView(self, 30);
    [name setSingleLineAutoResizeWithMaxWidth:(200)];
    
    
   
    
    name.text = @"明细记录";
   
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}




@end
