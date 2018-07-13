//
//  UserinfoBaseInfoCell.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/7/5.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "UserinfoBaseInfoCell.h"

@implementation UserinfoBaseInfoCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
                [self setupViews];
        
        self.separatorImageView.x = 21;
        self.separatorImageView.height = 0.6;
        self.separatorImageView.backgroundColor = HLSColor(229, 235, 232);
    }
    return self;
}
-(void)setupViews{
    self.textLabel.textColor = MLDetailColor;
    self.detailTextLabel.textColor = MLTittleColor;
    

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
