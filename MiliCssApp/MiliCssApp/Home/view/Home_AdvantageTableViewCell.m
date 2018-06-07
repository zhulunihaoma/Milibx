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
        
        self.separatorImageView.hidden = YES;
    }
    return self;
}
-(void)setupViews{
    UIImageView *AdvantageImg = [UIImageView new];
    AdvantageImg.image = [UIImage imageNamed:@"img_home_advantage"];
    [AdvantageImg sizeToFit];
    [self addSubview:AdvantageImg];
    [AdvantageImg mas_makeConstraints:^(MASConstraintMaker *make) {
     make.edges.equalTo(self);
        
    }];
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
