//
//  Home_PromoteTableViewCell.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/28.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "Home_PromoteTableViewCell.h"
#import "TBCityIconFont.h"
#import "UIImage+TBCityIconFont.h"
@implementation Home_PromoteTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        [self setupViews];
        
        
        self.separatorImageView.x = 0;
    }
    return self;
}
-(void)setupViews{
    UIImageView *TittleColor = [[UIImageView alloc] init];
    TittleColor.backgroundColor = MLNaviColor;
    [self addSubview:TittleColor];
    TittleColor.sd_layout
    .leftSpaceToView(self, 15)
    .topSpaceToView(self, 20)
    .heightIs(15)
    .widthIs(4);
    UILabel *ToolsTittle = [HLSLable LabelWithFont:14 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:self];
    [self addSubview:ToolsTittle];
    ToolsTittle.text = @"产品推广";
    ToolsTittle.sd_layout
    .leftSpaceToView(TittleColor, 9)
    .topSpaceToView(self, 20)
    .heightIs(20);
    [ToolsTittle setSingleLineAutoResizeWithMaxWidth:100];
    
//    更多
    UIButton *MoreBtn = [[UIButton alloc]init];
    [self addSubview:MoreBtn];
    [MoreBtn setTitleColor:MLDetailColor forState:UIControlStateNormal];
    [MoreBtn setTitle:@"更多 >" forState:UIControlStateNormal];
    MoreBtn.titleLabel.font = TextFontSize(12);
    MoreBtn.sd_layout
    .rightSpaceToView(self, 17)
    .topSpaceToView(self, 20)
    .heightIs(12)
    .widthIs(40);
//    产品列表
    NSArray *proarr = [[NSArray alloc]init];
    proarr = @[@"img_home_pruduct_1",@"img_home_pruduct_2"];
    
    for (int i = 0; i<proarr.count; i ++) {
        UIImageView *Pro_BgImg = [[UIImageView alloc]init];
        
        [self addSubview:Pro_BgImg];
        Pro_BgImg.image = [UIImage imageNamed:proarr[i]];
        
        Pro_BgImg.x = 5;
        if (i == 0) {
            Pro_BgImg.y = 51;

        }else{
            Pro_BgImg.y = 174;

        }
        Pro_BgImg.height = 119;
        Pro_BgImg.width = SCREEN_WIDTH-20+8;
        Pro_BgImg.layer.cornerRadius = 8;
        Pro_BgImg.layer.masksToBounds = YES;
//        tittle
        UILabel *Pro_Tittle = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:Pro_BgImg];
        Pro_Tittle.text = @"安心驾考宝";
        Pro_Tittle.sd_layout
        .leftSpaceToView(Pro_BgImg, 25)
        .topSpaceToView(Pro_BgImg, 25)
        .heightIs(17);
        [Pro_Tittle setSingleLineAutoResizeWithMaxWidth:100];
        
//        标签
        UIImageView *Pro_label = [[UIImageView alloc] init];
        Pro_label.backgroundColor = [UIColor orangeColor];
        [Pro_BgImg addSubview:Pro_label];
        Pro_label.sd_layout
        .leftSpaceToView(Pro_Tittle, 5)
        .topSpaceToView(Pro_BgImg, 25)
        .heightIs(11)
        .widthIs(40);
        
        
        //        des
        UILabel *Pro_des = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLDetailColor WithFatherView:Pro_BgImg];
        Pro_des.text = @"补考不要钱，重修不花钱";
        Pro_des.sd_layout
        .leftSpaceToView(Pro_BgImg, 25)
        .topSpaceToView(Pro_Tittle, 8)
        .heightIs(12);
        [Pro_des setSingleLineAutoResizeWithMaxWidth:150];
        //        des
        UILabel *Pro_count = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLNaviColor WithFatherView:Pro_BgImg];
        Pro_count.font = [UIFont fontWithName:@"iconfont" size:12];//设置label的字体
        Pro_count.text = @"共3款计划  \U0000e94d";

        Pro_count.sd_layout
        .leftSpaceToView(Pro_BgImg, 25)
        .topSpaceToView(Pro_des, 21)
        .heightIs(17);
        [Pro_count setSingleLineAutoResizeWithMaxWidth:150];
       

    }
    

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
