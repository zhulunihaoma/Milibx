//
//  NewsBigImgTableViewCell.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/29.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "NewsBigImgTableViewCell.h"

@implementation NewsBigImgTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setup];
    }
    return self;
}
-(void)setup{

self.News_img.sd_layout
    .topSpaceToView(self.contentView, 13)
    .leftSpaceToView(self.contentView, 13)
    .rightSpaceToView(self.contentView, 13)
    .heightIs(116);
    
    self.News_Tittle.sd_layout
    .topSpaceToView(self.News_img, 13)
    .leftSpaceToView(self.contentView, 13)
    .rightSpaceToView(self.contentView, 13)
    .heightIs(20);
    self.News_Tittle.numberOfLines = 1;
    
    
}
-(void)setModel:(NewsModel *)Model{
    self.News_Tittle.text = Model.articleTitle;
    [self.News_img sd_setImageWithURL:URLWith(Model.imgBigUrl) placeholderImage:HolderWith(@"img_loading_big")];
    self.News_Tag.text = Model.articleLabel;
    if (Model.articleLabel.length > 0) {
        self.News_Tag.hidden = NO;
        
    }else{
       self.News_ReadNum.sd_layout
        .leftSpaceToView(self.contentView, 15);
    }
    NSString *readno;
    if ([Model.readNo integerValue] >999) {
        readno = @"999+";
    }else{
        readno = Model.readNo;
    }
    self.News_ReadNum.text = [NSString stringWithFormat:@"阅读数 %@",readno];
    

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
