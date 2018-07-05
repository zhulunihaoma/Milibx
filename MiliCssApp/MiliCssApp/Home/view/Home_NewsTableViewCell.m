//
//  Home_NewsTableViewCell.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/28.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "Home_NewsTableViewCell.h"
#import "HKNewsBannerView.h"
#import "FindViewController.h"
#import "HKNewsBannerView.h"
@interface Home_NewsTableViewCell ()
{
    HKNewsBannerView *newsView;
}
@end
@implementation Home_NewsTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        [self setupViews];
//        self.backgroundColor = [UIColor lightGrayColor];
        
        self.separatorImageView.hidden = YES;
    }
    return self;
}
-(void)setupViews{
}


-(void)setDataDic:(NSMutableDictionary *)DataDic{
//    [self makeBroadcasts:DataDic];

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
