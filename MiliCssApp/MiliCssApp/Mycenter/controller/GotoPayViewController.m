//
//  GotoPayViewController.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/6/5.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "GotoPayViewController.h"

@interface GotoPayViewController ()
{
    UIView *MycenterView;

}
@property(nonatomic,strong)UILabel *nameLabel;
@end

@implementation GotoPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"去支付";
    [self SetupSubViews];
    // Do any additional setup after loading the view.
}
-(void)SetupSubViews{
    UIView *TopView = [[UIView alloc]init];
    [self.view addSubview:TopView];
    TopView.backgroundColor = [UIColor whiteColor];
    TopView.layer.cornerRadius = 8;
    TopView.layer.masksToBounds = YES;
    TopView.sd_layout
    .leftSpaceToView(self.view, 9)
    .topSpaceToView(self.view, NaviHeight+18)
    .rightSpaceToView(self.view, 9)
    .heightIs(229);
//    倒计时iocn
    UIImageView *TimeIcon = [[UIImageView alloc]init];
    [TopView addSubview:TimeIcon];
    TimeIcon.image = [UIImage imageNamed:@"ico_home_3"];
    TimeIcon.sd_layout
    .topSpaceToView(TopView, 25)
    .heightIs(66)
    .widthIs(66)
    .centerXEqualToView(TopView);
//    提示标题
    
    UILabel *TittleLab = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentCenter WithTextColor:MLTittleColor WithFatherView:TopView];
    TittleLab.sd_layout
    .heightIs(17)
    .topSpaceToView(TimeIcon, 17)
    .centerXEqualToView(TopView);
    [TittleLab setSingleLineAutoResizeWithMaxWidth:(200)];
    
    TittleLab.text = @"订单已生成，等待支付";
    
//    横线
    UIImageView *LineImg = [[UIImageView alloc]init];
    [TopView addSubview:LineImg];
    LineImg.backgroundColor = HLSColor(229, 235, 232);
    LineImg.sd_layout
    .leftSpaceToView(TopView, 21)
    .topSpaceToView(TittleLab, 27)
    .rightSpaceToView(TopView, 21)
    .heightIs(1);
//    proname
    UILabel *ProNameLab = [HLSLable LabelWithFont:14 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLDetailColor WithFatherView:TopView];
    ProNameLab.sd_layout
    .autoHeightRatio(0)
    .topSpaceToView(LineImg, 17)
    .leftSpaceToView(TopView, 21);
    
    [ProNameLab setSingleLineAutoResizeWithMaxWidth:(250)];
    
    ProNameLab.text = @"惠就医-少儿意外/疾病门诊有保版本";
    // 订单号
    UILabel *OrderNameLab = [HLSLable LabelWithFont:14 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLDetailColor WithFatherView:TopView];
    OrderNameLab.sd_layout
    .heightIs(14)
    .topSpaceToView(ProNameLab, 17)
    .leftSpaceToView(TopView, 21);
    
    [OrderNameLab setSingleLineAutoResizeWithMaxWidth:(250)];
    
    OrderNameLab.text = @"订单号：2132231313213213424";
    
//    价格
    UILabel *Price1 = [HLSLable LabelWithFont:24 WithTextalignment:NSTextAlignmentLeft WithTextColor:HLSColor(255, 123, 6) WithFatherView:TopView];
    Price1.sd_layout
    .heightIs(24)
    .topSpaceToView(LineImg, 28)
    .rightSpaceToView(TopView, 21);
    
    [Price1 setSingleLineAutoResizeWithMaxWidth:(100)];
    
    Price1.text = @"¥200元";
    
    //        前面的绿色标签
    UIImageView *GreenView = [[UIImageView alloc]init];
    [self.view addSubview:GreenView];
    GreenView.backgroundColor = MLNaviColor;
    GreenView.sd_layout
    .leftSpaceToView(self,20)
    .topSpaceToView(TopView, 20)
    .widthIs(4)
    .heightIs(16);
    
    self.nameLabel = [UILabel new];
    [self.view addSubview:self.nameLabel];
    self.nameLabel.text = @"请选择支付方式";
    self.nameLabel.textColor = MLDetailColor;
    self.nameLabel.font = TextFontSize(14);
    self.nameLabel.sd_layout
    .leftSpaceToView(GreenView,10)
    .rightSpaceToView(self.view,100)
    .heightIs(20)
    .centerYEqualToView(GreenView);
    self.nameLabel.textColor = HLSOneColor(134);
    self.nameLabel.font = TextFontSize(14);

    [self MycenterView];

}
-(UIView *)MycenterView{
    if (!MycenterView) {
        MycenterView = [[UIView alloc]init];
        MycenterView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:MycenterView];
        MycenterView.layer.cornerRadius = 8;
        MycenterView.layer.masksToBounds = YES;
        
        MycenterView.sd_layout
        .leftSpaceToView(self.view, 9)
        .rightSpaceToView(self.view, 9)
        .topSpaceToView(self.nameLabel,12)
        .heightIs(101);
        
        
        // 微信支付cell
        UIView *passwordview = [UIView new];
        passwordview.backgroundColor = [UIColor whiteColor];
        [MycenterView addSubview:passwordview];
        passwordview.sd_layout
        .topSpaceToView(MycenterView, 0)
        .leftSpaceToView(MycenterView, 0)
        .rightSpaceToView(MycenterView, 0)
        .heightIs(50);
        //    跳转到钱包
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goAgreement:)];
        [passwordview addGestureRecognizer:tap];
        passwordview.userInteractionEnabled = YES;
        
        
//        iocn
        UIImageView *PayIcon = [[UIImageView alloc]init];
        [passwordview addSubview:PayIcon];
        PayIcon.image = [UIImage imageNamed:@"ico_home_3"];
        PayIcon.sd_layout
        .centerYEqualToView(passwordview)
        .heightIs(35)
        .widthIs(35)
        .leftSpaceToView(passwordview, 23);
        
        
        
        UILabel *motifypassword = [HLSLable LabelWithFont:16 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:passwordview];
        motifypassword.text = @"微信支付";
        motifypassword.sd_layout
        .centerYIs(25)
        .leftSpaceToView(PayIcon, 13)
        .heightIs(17);
        [motifypassword setSingleLineAutoResizeWithMaxWidth:(120)];
        //        箭头
        UIImageView *arrow1 = [[UIImageView alloc]init];
        arrow1.image = [UIImage imageNamed:@"btn_arrow"];
        [passwordview addSubview:arrow1];
        [arrow1 sizeToFit];
        arrow1.centerY = 25;
        arrow1.x = SCREEN_WIDTH - 28- arrow1.width;
        
        
        UIView *hline1 = [UIView new];
        hline1.backgroundColor = MLBGColor;
        [MycenterView addSubview:hline1];
        hline1.sd_layout
        .topSpaceToView(MycenterView, 50)
        .leftSpaceToView(MycenterView, 30)
        .rightSpaceToView(MycenterView, 0)
        .heightIs(1);
        
        
        
#pragma mark -- 消息通知
        // 支付宝支付cell
        UIView *messageview = [UIView new];
        messageview.backgroundColor = [UIColor whiteColor];
        [MycenterView addSubview:messageview];
        messageview.sd_layout
        .topSpaceToView(MycenterView, 51)
        .leftSpaceToView(MycenterView, 0)
        .rightSpaceToView(MycenterView, 0)
        .heightIs(50);
        //    跳转到钱包
        UITapGestureRecognizer * messageviewtap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gopassword:)];
        [messageview addGestureRecognizer:messageviewtap];
        messageview.userInteractionEnabled = YES;
        
        //        iocn
        UIImageView *PayIcon2 = [[UIImageView alloc]init];
        [messageview addSubview:PayIcon2];
        PayIcon2.image = [UIImage imageNamed:@"ico_home_3"];
        PayIcon2.sd_layout
        .centerYEqualToView(messageview)
        .heightIs(35)
        .widthIs(35)
        .leftSpaceToView(messageview, 23);
        
        
        
        UILabel *messagelab = [HLSLable LabelWithFont:16 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:messageview];
        messagelab.text = @"支付宝支付";
        messagelab.sd_layout
        .centerYIs(25)
        .leftSpaceToView(PayIcon2, 13)
        .heightIs(17);
        [messagelab setSingleLineAutoResizeWithMaxWidth:(120)];
        //  switch开关
        UISwitch *messageSwitch = [[UISwitch alloc]init];
        [messageview addSubview:messageSwitch];
        [messageSwitch sizeToFit];
        messageSwitch.centerY = 25;
        messageSwitch.x = SCREEN_WIDTH - 28- messageSwitch.width;
        
        
        UIView *hlinemessage = [UIView new];
        hlinemessage.backgroundColor = MLBGColor;
        [MycenterView addSubview:hlinemessage];
        hlinemessage.sd_layout
        .topSpaceToView(MycenterView, 100)
        .leftSpaceToView(MycenterView, 30)
        .rightSpaceToView(MycenterView, 0)
        .heightIs(1);
        
        
        
    
        
        
        
    }
    
    return MycenterView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
