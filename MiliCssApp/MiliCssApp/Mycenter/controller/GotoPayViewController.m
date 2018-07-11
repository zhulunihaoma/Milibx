//
//  GotoPayViewController.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/6/5.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "GotoPayViewController.h"
#import "MLMyRequest.h"
#import "ZLPayTool.h"
@interface GotoPayViewController ()
{
    UIView *MycenterView;
    UIButton *submmit;
    NSMutableDictionary *DataDic;

}
@property(nonatomic,strong)UILabel *nameLabel;
@end

@implementation GotoPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"等待支付";
    HLSLog(@"---支付orderid%@",self.OrderId);
//    self.OrderId = @"18071011224910000002";
    //支付信息返回通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alipayresult:) name:@"alipayResult" object:nil];
    
    [self RequestData];
//    MLNormalWebViewController *vc = [MLNormalWebViewController new];
//    vc.TittleStr = @"下级管理";
//    vc.UrlStr = [NSString stringWithFormat:@"/order/orderdetailunauth/%@",@"18062620171410000034"];
//    [self.navigationController pushViewController:vc animated:YES];
//
    // Do any additional setup after loading the view.
    
}
-(void)RequestData{
    [self showMLhud];

    [MLMyRequest PostpayOrderDetailWithorderCode:self.OrderId Success:^(NSDictionary *dic) {
        HLSLog(@"aa:%@",dic);
        
        [self.HUD hideAnimated:YES];
        if ([[dic xyValueForKey:@"code"] integerValue] == SuccessCode) {
            DataDic = [dic xyValueForKey:@"result"];
            [self SetupSubViews];

        }else{
            [HLSLable lableWithText:[dic xyValueForKey:@"message"]];
            
        }
        
    } failure:^(NSError *error) {
        [self.HUD hideAnimated:YES];

    }];
    }

-(void)alipayresult:(NSNotification *)notification{
    NSDictionary *dic = notification.userInfo;
    switch ([[dic xyValueForKey:@"resultStatus"] integerValue]) {
        case 9000:
        {
            [HLSLable lableWithText:@"订单支付成功"];
            MLNormalWebViewController *vc = [MLNormalWebViewController new];
            vc.TittleStr = @"下级管理";
            vc.UrlStr = [NSString stringWithFormat:@"/order/orderdetailunauth/%@",self.OrderId];
            [self.navigationController pushViewController:vc animated:YES];
            
//            [self.navigationController popToRootViewControllerAnimated:YES];
        }
            break;
        case 8000:
        {
            [HLSLable lableWithText:@"正在处理中，支付结果未知"];
//            [self.navigationController popToRootViewControllerAnimated:YES];
        }
            break;
            
        case 4000:
        {
            [HLSLable lableWithText:@"订单支付失败"];
//            [self.navigationController popToRootViewControllerAnimated:YES];
        }
            break;
            
        case 5000:
        {
            [HLSLable lableWithText:@"重复请求"];
//            [self.navigationController popToRootViewControllerAnimated:YES];
        }
            break;
            
        case 6001:
        {
            [HLSLable lableWithText:@"用户中途取消，请重新支付"];
//            [self.navigationController popToRootViewControllerAnimated:YES];
        }
            break;
            
        case 6002:
        {
            [HLSLable lableWithText:@"网络连接出错"];
//            [self.navigationController popToRootViewControllerAnimated:YES];
        }
            break;
        default:
            break;
    }
    
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
    .rightSpaceToView(self.view, 9);

//    倒计时iocn
    UIImageView *TimeIcon = [[UIImageView alloc]init];
    [TopView addSubview:TimeIcon];
    TimeIcon.image = [UIImage imageNamed:@"img_time"];
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
    
    [ProNameLab setSingleLineAutoResizeWithMaxWidth:(SCREEN_WIDTH - 165)];
    
    ProNameLab.text = [DataDic xyValueForKey:@"productName"];
    // 订单号
    UILabel *OrderNameLab = [HLSLable LabelWithFont:14 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLDetailColor WithFatherView:TopView];
    OrderNameLab.sd_layout
    .heightIs(14)
    .topSpaceToView(ProNameLab, 17)
    .leftSpaceToView(TopView, 21);
    
    [OrderNameLab setSingleLineAutoResizeWithMaxWidth:(250)];
    
    OrderNameLab.text = [NSString stringWithFormat:@"订单号：%@",[DataDic xyValueForKey:@"orderCode"]];
    [TopView setupAutoHeightWithBottomView:OrderNameLab bottomMargin:10];

//    价格
    UILabel *Price1 = [HLSLable LabelWithFont:Fit6(24) WithTextalignment:NSTextAlignmentRight WithTextColor:HLSColor(255, 123, 6) WithFatherView:TopView];
    Price1.sd_layout
    .heightIs(24)
    .topSpaceToView(LineImg, 28)
    .rightSpaceToView(TopView, 21);
    
    [Price1 setSingleLineAutoResizeWithMaxWidth:(145)];
    
    Price1.text = [NSString stringWithFormat:@"¥%@",[DataDic xyValueForKey:@"policyAmount"]];
    
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
    
    submmit = [[UIButton alloc]init];
    [submmit setTitle:@"支付" forState:UIControlStateNormal];
    [self.view addSubview:submmit];
    [submmit addTarget:self action:@selector(gotopay) forControlEvents:UIControlEventTouchUpInside];
    [submmit setBackgroundImage:[UIImage imageNamed:@"btn_login"] forState:UIControlStateNormal];
    
    submmit.x = 22;
    submmit.y = NaviHeight+421;
    submmit.height  = 65;
    submmit.width = SCREEN_WIDTH - 44;
    
    submmit.layer.cornerRadius = 6;
    submmit.titleLabel.font = TextFontSize(17);

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
        .heightIs(51);
        
        
        // 微信支付cell
//        UIView *passwordview = [UIView new];
//        passwordview.backgroundColor = [UIColor whiteColor];
//        [MycenterView addSubview:passwordview];
//        passwordview.sd_layout
//        .topSpaceToView(MycenterView, 0)
//        .leftSpaceToView(MycenterView, 0)
//        .rightSpaceToView(MycenterView, 0)
//        .heightIs(50);
//        //    跳转到钱包
//        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goAgreement:)];
//        [passwordview addGestureRecognizer:tap];
//        passwordview.userInteractionEnabled = YES;
//
//
////        iocn
//        UIImageView *PayIcon = [[UIImageView alloc]init];
//        [passwordview addSubview:PayIcon];
//        PayIcon.image = [UIImage imageNamed:@"icon_wechat"];
//        PayIcon.sd_layout
//        .centerYEqualToView(passwordview)
//        .heightIs(35)
//        .widthIs(35)
//        .leftSpaceToView(passwordview, 23);
//
//
//
//        UILabel *motifypassword = [HLSLable LabelWithFont:16 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:passwordview];
//        motifypassword.text = @"微信支付";
//        motifypassword.sd_layout
//        .centerYIs(25)
//        .leftSpaceToView(PayIcon, 13)
//        .heightIs(17);
//        [motifypassword setSingleLineAutoResizeWithMaxWidth:(120)];
//        //        箭头
//        //        按钮
//        UIButton *ChooseBtnWechat = [[UIButton alloc]init];
//        [ChooseBtnWechat setImage:[UIImage imageNamed:@"btn_choose_default"] forState:UIControlStateNormal];
//        [ChooseBtnWechat setImage:[UIImage imageNamed:@"btn_choose"] forState:UIControlStateSelected];
//        [ChooseBtnWechat addTarget:self action:@selector(Changepayway:) forControlEvents:UIControlEventTouchUpInside];
//        [passwordview addSubview:ChooseBtnWechat];
//        ChooseBtnWechat.sd_layout
//        .heightIs(18)
//        .widthIs(18)
//        .rightSpaceToView(passwordview, 20)
//        .centerYEqualToView(passwordview);
//
//
//        UIView *hline1 = [UIView new];
//        hline1.backgroundColor = MLBGColor;
//        [MycenterView addSubview:hline1];
//        hline1.sd_layout
//        .topSpaceToView(MycenterView, 50)
//        .leftSpaceToView(MycenterView, 30)
//        .rightSpaceToView(MycenterView, 0)
//        .heightIs(1);
//
        
        
#pragma mark -- 消息通知
        // 支付宝支付cell
        UIView *messageview = [UIView new];
        messageview.backgroundColor = [UIColor whiteColor];
        [MycenterView addSubview:messageview];
        messageview.sd_layout
        .topSpaceToView(MycenterView, 0)
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
        PayIcon2.image = [UIImage imageNamed:@"icon_Alipay"];
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
        
//        按钮
        UIButton *ChooseBtnAli = [[UIButton alloc]init];
        [ChooseBtnAli setImage:[UIImage imageNamed:@"btn_choose_default"] forState:UIControlStateNormal];
        [ChooseBtnAli setImage:[UIImage imageNamed:@"btn_choose"] forState:UIControlStateSelected];
//        [ChooseBtnAli addTarget:self action:@selector(Changepayway:) forControlEvents:UIControlEventTouchUpInside];
        ChooseBtnAli.selected = YES;
        [messageview addSubview:ChooseBtnAli];
        ChooseBtnAli.sd_layout
        .heightIs(18)
        .widthIs(18)
        .rightSpaceToView(messageview, 20)
        .centerYEqualToView(messageview);
        
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
-(void)gotopay{
    [self showMLhud];
    
    [MLMyRequest PostgotopayInfoWithorderId:self.OrderId returnUrl:nil payment:@"alipayApp" Success:^(NSDictionary *dic) {
  
        HLSLog(@"aa:%@",dic);
        
        [self.HUD hideAnimated:YES];
        if ([[dic xyValueForKey:@"code"] integerValue] == SuccessCode) {
            [ZLPayTool payWithalipayWithpayStr:[dic xyValueForKey:@"result"]];
//            [HLSLable lableWithText:@"登录成功！"];
        }else{
            [HLSLable lableWithText:[dic xyValueForKey:@"message"]];
        }
        
    } failure:^(NSError *error) {
        [self.HUD hideAnimated:YES];
    }];
}

-(void)Changepayway:(UIButton *)sender{
    sender.selected = !sender.selected;
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
