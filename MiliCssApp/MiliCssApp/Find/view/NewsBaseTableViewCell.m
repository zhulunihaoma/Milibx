//
//  NewsBaseTableViewCell.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/29.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "NewsBaseTableViewCell.h"

@implementation NewsBaseTableViewCell
+(NSString *)cellIdentifierForRow:(NSDictionary *)model{
    return nil;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //        [self setupViews];
        self.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 8;
        self.layer.masksToBounds = YES;
        [self setupViews];
        self.separatorImageView.hidden = YES;
    }
    return self;
}
-(void)setupViews{
//   图片
    self.News_img  =[UIImageView new];
    self.News_img.backgroundColor = MLNaviColor;
    [self.contentView addSubview:self.News_img];
// 标题
    self.News_Tittle = [HLSLable LabelWithFont:16 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:self.contentView];
    self.News_Tittle.text = @"银保监猜想：险企的大金融时代即将来临";
    
//    标签
    self.News_Tag = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentCenter WithTextColor:MLNaviColor WithFatherView:self.contentView];
    self.News_Tag.text = @"怎么买保险";
    self.News_Tag.layer.borderColor = MLNaviColor.CGColor;
    self.News_Tag.layer.borderWidth = 1;
    self.News_Tag.layer.cornerRadius = 3;
    self.News_Tag.layer.masksToBounds = YES;
    self.News_Tag.hidden = YES;
    // 阅读数
    self.News_ReadNum = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLDetailColor WithFatherView:self.contentView];
    self.News_ReadNum.text = @"阅读 999";
    
    
    self.News_Tag.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .bottomSpaceToView(self.contentView, 15)
    .widthIs(72)
    .heightIs(23);
    
    self.News_ReadNum.sd_layout
    .leftSpaceToView(self.News_Tag, 12)
    .centerYEqualToView(self.News_Tag)
    .widthIs(72)
    .heightIs(23);
    
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
