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
    .heightIs(16);
    self.News_Tittle.numberOfLines = 1;
    
    
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
