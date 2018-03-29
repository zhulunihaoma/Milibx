//
//  BDCenterTopTableViewCell.m
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/27.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "BDCenterTopTableViewCell.h"
#import "BDInfoViewController.h"
@implementation BDCenterTopTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        self.separatorImageView.x = 0;
    }
    return self;
}
-(void)setupViews{
    UIImageView *bgimg = [[UIImageView alloc]init];
    bgimg.image = [UIImage imageNamed:@"bj_personal_head"];
    [self addSubview:bgimg];
    bgimg.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topEqualToView(self)
    .bottomEqualToView(self);
    UIView *topview = [[UIView alloc]init];
    [bgimg addSubview:topview];
    topview.sd_layout
    .widthIs(SCREEN_WIDTH)
    .leftEqualToView(bgimg)
    .rightEqualToView(bgimg)
    .heightIs(45)
    .topEqualToView(bgimg);
    topview.backgroundColor = COLORWithRGB(255, 255, 255, 0.2);
//    跳转到个人资料
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goinfo:)];
    [topview addGestureRecognizer:tap];
    bgimg.userInteractionEnabled = YES;

    topview.userInteractionEnabled = YES;
    
    UIImageView *nameicon = [[UIImageView alloc]init];
    nameicon.image = [UIImage imageNamed:@"icon_user_head"];
    [topview addSubview:nameicon];
   
    nameicon.sd_layout
    .centerYEqualToView(topview)
    .heightIs(20)
    .widthIs(20)
    .leftSpaceToView(topview, 20);
    UILabel *uname = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentLeft WithTextColor:[UIColor whiteColor] WithFatherView:topview];
    uname.text = @"丁爽杰";
    _uname = uname;
    uname.sd_layout
    .heightIs(16)
    .leftSpaceToView(nameicon, 10)
    .centerYEqualToView(topview);
    [uname setSingleLineAutoResizeWithMaxWidth:(120)];

//    账号
    UILabel *account = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentLeft WithTextColor:[UIColor whiteColor] WithFatherView:topview];
    account.text = @"账号:12112332";
    _account = account;
    account.sd_layout
    .heightIs(16)
    .leftSpaceToView(uname, 25)
    .centerYEqualToView(topview);
    [account setSingleLineAutoResizeWithMaxWidth:(120)];
    // 状态
    UILabel *state = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentLeft WithTextColor:[UIColor whiteColor] WithFatherView:topview];
    state.text = @"已冻结";
    _state = state;
    state.sd_layout
    .heightIs(16)
    .leftSpaceToView(account, 25)
    .centerYEqualToView(topview);
//    箭头
    UIImageView *arrow = [[UIImageView alloc]init];
    arrow.image = [UIImage imageNamed:@"button_arrow_head-1"];
    [topview addSubview:arrow];
    
    arrow.sd_layout
    .centerYEqualToView(topview)
    .heightIs(13)
    .widthIs(8)
    .rightSpaceToView(topview, 20);
//    账户金额
    UILabel *moneysum = [HLSLable LabelWithFont:14 WithTextalignment:NSTextAlignmentLeft WithTextColor:[UIColor whiteColor] WithFatherView:bgimg];
    moneysum.text = @"账户金额";
    moneysum.sd_layout
    .heightIs(16)
    .topSpaceToView(topview, 41)
    .centerXEqualToView(bgimg);
    [moneysum setSingleLineAutoResizeWithMaxWidth:(120)];
    
    //    账户金额数字
    UILabel *moneycount = [HLSLable LabelWithFont:42 WithTextalignment:NSTextAlignmentLeft WithTextColor:[UIColor whiteColor] WithFatherView:bgimg];
    moneycount.text = @"8000.00";
    moneycount.sd_layout
    .heightIs(42)
    .topSpaceToView(moneysum, 15)
    .centerXEqualToView(bgimg);
    [moneycount setSingleLineAutoResizeWithMaxWidth:(200)];
// 竖线
    UILabel *linelab = [HLSLable LabelWithFont:0 WithTextalignment:NSTextAlignmentLeft WithTextColor:[UIColor whiteColor] WithFatherView:bgimg];
    linelab.backgroundColor = [UIColor whiteColor];
    linelab.sd_layout
    .heightIs(40)
    .widthIs(1)
    .topSpaceToView(moneycount, 51)
    .centerXEqualToView(bgimg);
//    推广费总额(元)
    UILabel *prmotetitle = [HLSLable LabelWithFont:14 WithTextalignment:NSTextAlignmentRight WithTextColor:[UIColor whiteColor] WithFatherView:bgimg];
    prmotetitle.text = @"推广费总额(元)";
    prmotetitle.sd_layout
    .heightIs(14)
    .topEqualToView(linelab)
    .rightSpaceToView(linelab, 42);

    [prmotetitle setSingleLineAutoResizeWithMaxWidth:(200)];

    
    UILabel *prmotemoney = [HLSLable LabelWithFont:18 WithTextalignment:NSTextAlignmentRight WithTextColor:[UIColor whiteColor] WithFatherView:bgimg];
    prmotemoney.text = @"1800.00";
    prmotemoney.sd_layout
    .heightIs(18)
    .topSpaceToView(prmotetitle, 12)
    .centerXEqualToView(prmotetitle);
    [prmotemoney setSingleLineAutoResizeWithMaxWidth:(200)];
    //    待入账推广费(元)
    UILabel *togettitle = [HLSLable LabelWithFont:14 WithTextalignment:NSTextAlignmentRight WithTextColor:[UIColor whiteColor] WithFatherView:bgimg];
    togettitle.text = @"待入账推广费(元)";
    togettitle.sd_layout
    .heightIs(14)
    .topEqualToView(linelab)
    .leftSpaceToView(linelab, 42);
    
    [togettitle setSingleLineAutoResizeWithMaxWidth:(200)];
    
    
    UILabel *togetmoney = [HLSLable LabelWithFont:18 WithTextalignment:NSTextAlignmentRight WithTextColor:[UIColor whiteColor] WithFatherView:bgimg];
    togetmoney.text = @"1800.00";
    togetmoney.sd_layout
    .heightIs(18)
    .topSpaceToView(togettitle, 12)
    .centerXEqualToView(togettitle);
    [togetmoney setSingleLineAutoResizeWithMaxWidth:(200)];

}
-(void)setModel:(NSDictionary *)model{
}
-(void)goinfo:(UITapGestureRecognizer *)tap{
    BDInfoViewController *infovc = [[BDInfoViewController alloc]init];
    
    //获取此View的底层controller
    
    [[GetUnderController getvcwithtarget:self].navigationController pushViewController:infovc animated:YES];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
