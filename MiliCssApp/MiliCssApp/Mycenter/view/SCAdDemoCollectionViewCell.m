//
//  SCAdDemoCollectionViewCell.m
//  SCAdViewDemo
//
//  Created by 陈世翰 on 17/2/7.
//  Copyright © 2017年 Coder Chan. All rights reserved.
//

#import "SCAdDemoCollectionViewCell.h"
#import "HeroModel.h"
@implementation SCAdDemoCollectionViewCell
-(void)setModel:(id)model{
   
    if ([model isKindOfClass:[HeroModel class]]) {
        HeroModel *h_model = model;
//        _showImage.image = [UIImage imageNamed:h_model.imageName];
        [_showImage sd_setImageWithURL:URLWith(h_model.imageName) placeholderImage:HolderWith(nil)];
//        [frontimg sd_setImageWithURL:URLWith(@"group1/M00/00/08/wKitIFsOxciAXDdVAAl5WLU-YRY861.jpg")];

    }else{
    NSString *imageName = model;
//    _showImage.image = [UIImage imageNamed:imageName];
        [_showImage sd_setImageWithURL:URLWith(@"https://mfs.milibx.com/group1/M00/00/08/wKitIFsOxciAXDdVAAl5WLU-YRY861.jpg") placeholderImage:HolderWith(nil)];
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    _showImage.contentMode = UIViewContentModeCenter;
    [_showImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self);
//        make.edges.mas_offset(UIEdgeInsetsMake(20, 20, 20, 20));
        make.left.mas_equalTo(self.bgView).offset(20);
        make.right.mas_equalTo(self.bgView).offset(20);
        make.top.mas_equalTo(self.bgView).offset(20);
        make.bottom.mas_equalTo(self.bgView).offset(20);

       
    }];
//    _showImage.sd_layout
//    .topSpaceToView(self, 10)
//    .leftSpaceToView(self, 10)
//    .bottomSpaceToView(self, 10)
//    .rightSpaceToView(self, 10);
    self.bgView.layer.masksToBounds = YES;
    self.bgView.layer.cornerRadius = 8;
    self.bgView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.bgView.layer.borderWidth = 10;
    self.bgView.layer.masksToBounds = YES;
    self.bgView.layer.cornerRadius = 8;
    self.bgView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.bgView.layer.shadowOpacity = 0.5;
    self.bgView.layer.shadowRadius = 2.0f;
    self.bgView.layer.shadowOffset = CGSizeMake(1, 1);
//    self.clipsToBounds =NO;
//    self.bgView.clipsToBounds =NO;
}

@end
