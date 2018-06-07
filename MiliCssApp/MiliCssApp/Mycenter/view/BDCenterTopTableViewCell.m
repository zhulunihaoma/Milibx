//
//  BDCenterTopTableViewCell.m
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/27.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "BDCenterTopTableViewCell.h"
#import "BDInfoViewController.h"
#import "UsercenterViewController.h"
#import "MessagesListViewController.h"
#import "UserInfoViewController.h"
#import "MLNormalWebViewController.h"
#import "PosterViewController.h"

@implementation BDCenterTopTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        self.separatorImageView.hidden = YES;
        self.contentView.backgroundColor = MLBGColor;
    }
    return self;
}
-(void)setupViews{
    UIView *BgView = [UIView new];
    BgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 382+NaviHeight);

    [self.contentView addSubview:BgView];
    BgView.backgroundColor = MLBGColor;
    
    UIView *MytopView = [UIView new];
    MytopView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 382+NaviHeight);
    [BgView addSubview:MytopView];
    MytopView.backgroundColor = MLBGColor;

    
    UIImageView *bgimg = [[UIImageView alloc]init];
    bgimg.image = [UIImage imageNamed:@"bj_me"];
    [MytopView addSubview:bgimg];
    bgimg.userInteractionEnabled = YES;

    bgimg.sd_layout
    .leftEqualToView(MytopView)
    .rightEqualToView(MytopView)
    .topEqualToView(MytopView)
    .heightIs(228+NaviHeight);
    
//    设置以及消息中心
    UIButton *AppSetBtn = [[UIButton alloc]init];
    [bgimg addSubview:AppSetBtn];
    [AppSetBtn setImage:[UIImage imageNamed:@"btn_me_set"] forState:UIControlStateNormal];
    
    [AppSetBtn sizeToFit];
    AppSetBtn.x = 13;
    AppSetBtn.y =6+StatueBarHeight;
    [AppSetBtn addTarget:self action:@selector(GoSet) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *AppMessageBtn = [[UIButton alloc]init];
    [bgimg addSubview:AppMessageBtn];
    [AppMessageBtn setImage:[UIImage imageNamed:@"btn_me_message"] forState:UIControlStateNormal];
    [AppMessageBtn sizeToFit];
    AppMessageBtn.x = SCREEN_WIDTH - 13 - AppMessageBtn.width;
    AppMessageBtn.y =6+StatueBarHeight;
    [AppMessageBtn addTarget:self action:@selector(GoMessage) forControlEvents:UIControlEventTouchUpInside];
    
    
    // 消息上的红点
    UILabel *UnreadNum = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentCenter WithTextColor:[UIColor whiteColor] WithFatherView:AppMessageBtn];
    UnreadNum.sd_layout
    .heightIs(16)
    .widthIs(16)
    .topSpaceToView(AppMessageBtn, -5)
    .rightSpaceToView(AppMessageBtn, -5);
    UnreadNum.text = @"1";
    UnreadNum.backgroundColor = [UIColor redColor];
    UnreadNum.layer.cornerRadius = 8;
    UnreadNum.layer.masksToBounds = YES;
    
    
//    我的
    UILabel *MyTittle = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentLeft WithTextColor:[UIColor whiteColor] WithFatherView:bgimg];
    MyTittle.text = @"我的";
    MyTittle.sd_layout
    .heightIs(16)
    .centerXEqualToView(bgimg)
    .centerYEqualToView(AppMessageBtn);
    [MyTittle setSingleLineAutoResizeWithMaxWidth:(50)];
    
    
//    头像
    
    UIImageView *Headimg = [[UIImageView alloc]init];
    Headimg.image = [UIImage imageNamed:@"img_me_tx_default"];
    [bgimg addSubview:Headimg];
    Headimg.sd_layout
    .topSpaceToView(MyTittle, 21)
    .centerXEqualToView(bgimg)
    .widthIs(40)
    .heightIs(40);
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gouserinfo)];
    [Headimg addGestureRecognizer:tap];
    Headimg.userInteractionEnabled = YES;

    
    // 昵称
    UILabel *MyName = [HLSLable LabelWithFont:14 WithTextalignment:NSTextAlignmentLeft WithTextColor:[UIColor whiteColor] WithFatherView:bgimg];
    MyName.text = @"朱璐";
    MyName.sd_layout
    .heightIs(16)
    .centerXEqualToView(bgimg)
    .topSpaceToView(Headimg, 8);
    [MyName setSingleLineAutoResizeWithMaxWidth:(50)];
    
    
//    推广费
    UILabel *PromoteCount = [HLSLable LabelWithFont:18 WithTextalignment:NSTextAlignmentCenter WithTextColor:[UIColor whiteColor] WithFatherView:bgimg];
    PromoteCount.text = @"10000";
    PromoteCount.sd_layout
    .heightIs(18)
    .leftSpaceToView(bgimg, 32)
    .widthIs(80)
    .topSpaceToView(MyName, 30);
//    [PromoteCount setSingleLineAutoResizeWithMaxWidth:(100)];
    
    
    UILabel *PromoteTittle = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentCenter WithTextColor:[UIColor whiteColor] WithFatherView:bgimg];
    PromoteTittle.text = @"推广费（元）";
    PromoteTittle.sd_layout
    .heightIs(12)
    .widthIs(80)
    .leftSpaceToView(bgimg, 32)
    .topSpaceToView(PromoteCount, 9);
//    [PromoteTittle setSingleLineAutoResizeWithMaxWidth:(100)];
    
    
    
    //    保费
    UILabel *BaoCount = [HLSLable LabelWithFont:18 WithTextalignment:NSTextAlignmentCenter WithTextColor:[UIColor whiteColor] WithFatherView:bgimg];
    BaoCount.text = @"10000";
    BaoCount.sd_layout
    .heightIs(18)
    .centerXEqualToView(bgimg)
    .widthIs(80)
    .topSpaceToView(MyName, 30);
    //    [PromoteCount setSingleLineAutoResizeWithMaxWidth:(100)];
    
    
    UILabel *BaoTittle = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentCenter WithTextColor:[UIColor whiteColor] WithFatherView:bgimg];
    BaoTittle.text = @"保费（元）";
    BaoTittle.sd_layout
    .heightIs(12)
    .widthIs(80)
    .centerXEqualToView(bgimg)
    .topSpaceToView(BaoCount, 9);
    //    [PromoteTittle setSingleLineAutoResizeWithMaxWidth:(100)];
    
    
    
    //    余额
    UILabel *YuCount = [HLSLable LabelWithFont:18 WithTextalignment:NSTextAlignmentCenter WithTextColor:[UIColor whiteColor] WithFatherView:bgimg];
    YuCount.text = @"10000";
    YuCount.sd_layout
    .heightIs(18)
    .rightSpaceToView(bgimg, 32)
    .widthIs(80)
    .topSpaceToView(MyName, 30);
    //    [PromoteCount setSingleLineAutoResizeWithMaxWidth:(100)];
    
    
    UILabel *YuTittle = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentCenter WithTextColor:[UIColor whiteColor] WithFatherView:bgimg];
    YuTittle.text = @"余额（元）";
    YuTittle.sd_layout
    .heightIs(12)
    .widthIs(80)
    .rightSpaceToView(bgimg, 32)
    .topSpaceToView(YuCount, 9);
    //    [PromoteTittle setSingleLineAutoResizeWithMaxWidth:(100)];
    
    
    
    
    UIView *topview = [[UIView alloc]init];
    [bgimg addSubview:topview];
    topview.sd_layout
    .widthIs(SCREEN_WIDTH-18)
    .leftSpaceToView(bgimg, 9)
    .rightSpaceToView(bgimg, 9)
    .heightIs(225)
    .topSpaceToView(bgimg, 157+NaviHeight);
    topview.layer.cornerRadius = 8;
    topview.layer.masksToBounds = YES;
    topview.backgroundColor = [UIColor whiteColor];

    NSArray *titles = @[@"业绩报表",@"下级管理",@"海报"];
    NSArray *pics = @[@"btn_me_function_1",@"btn_me_function_2",@"btn_me_function_3"];
    
    [self makeEqualWidthBtnNum:3 Names:titles Imgs:pics inView:topview LRpadding:40 viewPadding:57 y:25 titlefont:12  titleColor:MLTittleColor withtag:0];
    NSArray *TitlesBttom = @[@"我的订单",@"轻松理赔",@""];
    NSArray *PicsBttom = @[@"btn_me_function_3",@"btn_me_function_4",@""];
    
    [self makeEqualWidthBtnNum:3 Names:TitlesBttom Imgs:PicsBttom inView:topview LRpadding:40 viewPadding:57 y:120 titlefont:12  titleColor:MLTittleColor withtag:3];
}
-(void)makeEqualWidthBtnNum:(NSInteger)num Names:(NSArray *)names Imgs:(NSArray *)imgs inView:(UIView *)containerView LRpadding:(CGFloat)LRpadding viewPadding :(CGFloat)viewPadding y:(CGFloat)y titlefont:(NSInteger)font titleColor:(UIColor *)color withtag:(NSInteger)tag
{
    NSMutableArray *arr = [NSMutableArray new];
    
    for (int i = 0; i < num; i ++) {
        UIButton *btn = [[UIButton alloc]init];
        btn.userInteractionEnabled= YES;
        btn.tag = tag+i;
        [arr addObject:btn];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
    //    NSArray *arrstr = @[@"品牌",@"品牌",@"品牌",@"品牌",@"啦啦啦啦啦",];
    int i = 0;
    
    UIButton *lastView;
    for (UIButton *view in arr) {
        [containerView addSubview:view];
        if (lastView) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(lastView.mas_top);
                make.left.equalTo(lastView.mas_right).offset(viewPadding);
                make.width.equalTo(lastView);
                make.height.mas_equalTo(lastView.mas_width);
                
            }];
        }else
        {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(containerView).offset(LRpadding);
                make.top.mas_equalTo(y);
                make.height.mas_equalTo(view.mas_width);
            }];
            
        }
        
        view.layer.cornerRadius = view.height/2;
        [view setImage:[UIImage imageNamed:imgs[i]] forState:UIControlStateNormal];
        UILabel *lab = [UILabel new];
        [containerView addSubview:lab];
        lab.text = names[i];
        lab.font = [UIFont systemFontOfSize:font];
        lab.textColor = color;
        [lab sizeToFit];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(view.mas_centerX);
            make.centerY.mas_equalTo(view.mas_centerY).offset(40);
            
        }];
        lastView=view;
        i++;
        
    }
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(containerView).offset(-LRpadding);
    }];
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


-(void)gouserinfo{
    UserInfoViewController *uvc = [[UserInfoViewController alloc]init];
    [[GetUnderController getvcwithtarget:self].navigationController pushViewController:uvc animated:YES];
}
-(void)GoMessage{
    MessagesListViewController *uvc = [[MessagesListViewController alloc]init];
    [[GetUnderController getvcwithtarget:self].navigationController pushViewController:uvc animated:YES];
}

-(void)GoSet{
    UsercenterViewController *uvc = [[UsercenterViewController alloc]init];
    [[GetUnderController getvcwithtarget:self].navigationController pushViewController:uvc animated:YES];
}
#pragma mark -- 中间入口点击方法
-(void)btnClick:(UIButton *)sender{
    HLSLog(@"--%ld",sender.tag);
    if(sender.tag==0){//业绩报表
        MLNormalWebViewController *vc = [MLNormalWebViewController new];
        vc.TittleStr = @"业绩报表";
        [[GetUnderController getvcwithtarget:self].navigationController pushViewController:vc animated:YES];

    }
    
    if(sender.tag==1){//下级管理
        MLNormalWebViewController *vc = [MLNormalWebViewController new];
        vc.TittleStr = @"下级管理";
        [[GetUnderController getvcwithtarget:self].navigationController pushViewController:vc animated:YES];
    }
    if (sender.tag == 2) {//海报
        PosterViewController *vc = [PosterViewController new];

        [[GetUnderController getvcwithtarget:self].navigationController pushViewController:vc animated:YES];

    }
    if(sender.tag==3){//我的订单
        MLNormalWebViewController *vc = [MLNormalWebViewController new];
        vc.TittleStr = @"我的订单";
        [[GetUnderController getvcwithtarget:self].navigationController pushViewController:vc animated:YES];
    }
    if(sender.tag==4){//轻松理赔
        MLNormalWebViewController *vc = [MLNormalWebViewController new];
        vc.TittleStr = @"轻松理赔";
        [[GetUnderController getvcwithtarget:self].navigationController pushViewController:vc animated:YES];
    }
    
   
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
