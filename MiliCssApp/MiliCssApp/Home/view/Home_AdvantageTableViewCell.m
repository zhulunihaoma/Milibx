//
//  Home_AdvantageTableViewCell.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/28.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "Home_AdvantageTableViewCell.h"

@implementation Home_AdvantageTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //        [self setupViews];
        [self setupViews];
        self.contentView.backgroundColor = MLBGColor;

        self.separatorImageView.hidden = YES;
    }
    return self;
}
-(void)setupViews{
    UIView *contentView = [[UIView alloc]init];
    [self.contentView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
        //        make.edges.mas_offset(UIEdgeInsetsMake(20, 20, 20, 20));
        
        
    }];
    contentView.backgroundColor =MLBGColor;

    UIImageView *AdvantageImg = [UIImageView new];
    AdvantageImg.image = [UIImage imageNamed:@"img_home_down"];
    [AdvantageImg sizeToFit];
    [contentView addSubview:AdvantageImg];
    AdvantageImg.centerX = SCREEN_WIDTH/2;
    AdvantageImg.y = 9;
    self.contentView.userInteractionEnabled = NO;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
