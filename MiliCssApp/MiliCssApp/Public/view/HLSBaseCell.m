//
//  HLSBaseCell.m
//  车源网
//
//  Created by k1er on 14/12/25.
//  Copyright (c) 2014年 HORIZON. All rights reserved.
//

#import "HLSBaseCell.h"
#import "UIImage+HLS.h"
@implementation HLSBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.separatorImageView = [[UIImageView alloc] initWithImage:[UIImage imageWithColor:HLSColor(215, 215, 215)]];
        self.textLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.separatorImageView];
        self.lineHeight = 1.0f;
        self.selectionStyle = UITableViewCellSelectionStyleNone;


    }
    return self;
}
// 配置cell高亮状态
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    if (highlighted &&_Isdeseled) {
        self.contentView.backgroundColor = MLBGColor;
    } else {
        // 增加延迟消失动画效果，提升用户体验
        [UIView animateWithDuration:0.1 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.contentView.backgroundColor = [UIColor whiteColor];
        } completion:nil];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.separatorImageView.height = self.lineHeight;
    self.separatorImageView.width = kSCREENSIZE.width;
//    self.separatorImageView.x = 0;
    self.separatorImageView.y = self.height - self.lineHeight;

}

@end
