//
//  NewsSmallImgTableViewCell.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/29.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "NewsSmallImgTableViewCell.h"

@implementation NewsSmallImgTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self buildview];
        self.backgroundColor = [UIColor whiteColor];

    }
    return self;
}
-(void)buildview{

    self.News_img.sd_layout
    .topSpaceToView(self.contentView, 20)
    .bottomSpaceToView(self.contentView, 20)
    .rightSpaceToView(self.contentView, 17)
    .widthIs(100);
    
    self.News_Tittle.sd_layout
    .topSpaceToView(self.contentView, 20)
    .leftSpaceToView(self.contentView, 18)
    .widthIs(196)
    .heightIs(38);
    self.News_Tittle.numberOfLines = 2;
    
}
-(void)setModel:(NewsModel *)Model{
    self.News_Tittle.text = Model.articleTitle;
    [self.News_img sd_setImageWithURL:URLWith(Model.imgBigUrl) placeholderImage:HolderWith(@"img_loading_small")];
    self.News_Tag.text = Model.articleLabel;
    self.News_ReadNum.text = [NSString stringWithFormat:@"阅读数 %@",Model.readNo];
    
    
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
