//
//  Home_ToolsTableViewCell.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/28.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "Home_ToolsTableViewCell.h"
#import "MLNormalWebViewController.h"
@implementation Home_ToolsTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        [self setupViews];
        
        
        self.separatorImageView.hidden = YES;
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
    ToolsTittle.text = @"服务工具";
    ToolsTittle.sd_layout
    .leftSpaceToView(TittleColor, 9)
    .topSpaceToView(self, 20)
    .heightIs(20);
    [ToolsTittle setSingleLineAutoResizeWithMaxWidth:100];

    UIScrollView *ToolsScrollView = [[UIScrollView alloc]init];
    [self addSubview:ToolsScrollView];
    ToolsScrollView.sd_layout
    .leftSpaceToView(self, 10)
    .rightSpaceToView(self, 10)
    .topSpaceToView(ToolsTittle, 15)
    .heightIs(85)
    .widthIs(SCREEN_WIDTH-20);
    ToolsScrollView.contentSize = CGSizeMake((167*3)-10, 85);
    ToolsScrollView.backgroundColor = [UIColor whiteColor];
    ToolsScrollView.showsHorizontalScrollIndicator = NO;
    UIImageView *Lipei = [[UIImageView alloc] init];
//    Lipei.backgroundColor = MLNaviColor;
    Lipei.image = [UIImage imageNamed:@"ico_home_4"];
    [ToolsScrollView addSubview:Lipei];
    Lipei.sd_layout
    .leftSpaceToView(ToolsScrollView, 0)
    .topSpaceToView(ToolsScrollView, 0)
    .heightIs(85)
    .widthIs(157);
    // 理赔跳转
    UITapGestureRecognizer * tapLipei = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapLipei)];
    [Lipei addGestureRecognizer:tapLipei];
    Lipei.userInteractionEnabled = YES;
    
    UIImageView *GongLue = [[UIImageView alloc] init];
//    GongLue.backgroundColor = MLNaviColor;
    GongLue.image = [UIImage imageNamed:@"ico_home_5"];
    [ToolsScrollView addSubview:GongLue];
    GongLue.sd_layout
    .leftSpaceToView(Lipei, 10)
    .topSpaceToView(ToolsScrollView, 0)
    .heightIs(85)
    .widthIs(157);
    // 攻略跳转
    UITapGestureRecognizer * tapGongLue = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGongLue)];
    [GongLue addGestureRecognizer:tapGongLue];
    GongLue.userInteractionEnabled = YES;
    
    
    
    UIImageView *MyOrder = [[UIImageView alloc] init];
    MyOrder.image = [UIImage imageNamed:@"ico_home_6"];
//    MyOrder.backgroundColor = MLNaviColor;
    [ToolsScrollView addSubview:MyOrder];
    MyOrder.sd_layout
    .leftSpaceToView(GongLue, 10)
    .topSpaceToView(ToolsScrollView, 0)
    .heightIs(85)
    .widthIs(157);
    // 订单跳转
    UITapGestureRecognizer * tapMyOrder = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapMyOrder)];
    [MyOrder addGestureRecognizer:tapMyOrder];
    MyOrder.userInteractionEnabled = YES;
}
//点击理赔
-(void)tapLipei{
    MLNormalWebViewController *vc = [MLNormalWebViewController new];
    vc.UrlStr = @"/product/claim";
    [[GetUnderController getvcwithtarget:self].navigationController pushViewController:vc animated:YES];
    
}
//点击订单列表
-(void)tapGongLue{
    MLNormalWebViewController *vc = [MLNormalWebViewController new];
    vc.UrlStr = @"/order/agentOrder";
    [[GetUnderController getvcwithtarget:self].navigationController pushViewController:vc animated:YES];
}
//点击攻略
-(void)tapMyOrder{
      [GetUnderController getvcwithtarget:self].tabBarController.selectedIndex = 1;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"milisay" object:self];

}
-(void)initscrollView{
  
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
