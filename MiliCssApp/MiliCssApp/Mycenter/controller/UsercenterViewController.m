//
//  UsercenterViewController.m
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/28.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "UsercenterViewController.h"
#import "WalletCenterViewController.h"
#import "LoginViewController.h"
#import "ChangeMyPSWViewController.h"
#import "MLMyRequest.h"
#import "APServiceTool.h"
@interface UsercenterViewController ()
{
    UIView *MycenterView;
    UILabel *QingChuNum;
}
@end

@implementation UsercenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";

    [self setupSubviews];
    // Do any additional setup after loading the view.
}
-(void)setupSubviews{
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
        .topSpaceToView(self.view, NaviHeight+12)
        .heightIs(204);
        
        
//     修改密码cell
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
        
        
        
        
        UILabel *motifypassword = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:passwordview];
        motifypassword.text = @"用户协议";
        motifypassword.sd_layout
        .centerYIs(25)
        .leftSpaceToView(passwordview, 30)
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
        //     修改密码cell
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
        
        
        
        
        UILabel *messagelab = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:messageview];
        messagelab.text = @"消息通知提醒";
        messagelab.sd_layout
        .centerYIs(25)
        .leftSpaceToView(messageview, 30)
        .heightIs(17);
        [messagelab setSingleLineAutoResizeWithMaxWidth:(120)];
        //  switch开关
        UISwitch *messageSwitch = [[UISwitch alloc]init];
        [messageview addSubview:messageSwitch];
        [messageSwitch sizeToFit];
        messageSwitch.centerY = 25;
        messageSwitch.x = SCREEN_WIDTH - 28- messageSwitch.width;
        messageSwitch.on = [self openThePushNotification];
        [messageSwitch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
        
        
        UIView *hlinemessage = [UIView new];
        hlinemessage.backgroundColor = MLBGColor;
        [MycenterView addSubview:hlinemessage];
        hlinemessage.sd_layout
        .topSpaceToView(MycenterView, 100)
        .leftSpaceToView(MycenterView, 30)
        .rightSpaceToView(MycenterView, 0)
        .heightIs(1);
        
        
        
        
        // 清除缓存
        UIView *QingChuview = [UIView new];
        QingChuview.backgroundColor = [UIColor whiteColor];
        [MycenterView addSubview:QingChuview];
        QingChuview.sd_layout
        .topSpaceToView(MycenterView, 101)
        .leftSpaceToView(MycenterView, 0)
        .rightSpaceToView(MycenterView, 0)
        .heightIs(50);
        
        UITapGestureRecognizer * tapQingChuview = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clear:)];
        [QingChuview addGestureRecognizer:tapQingChuview];
        
        
        
        UILabel *QingChulab = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:QingChuview];
        QingChulab.text = @"清除缓存";
        QingChulab.sd_layout
        .centerYIs(25)
        .leftSpaceToView(QingChuview, 30)
        .heightIs(17);
        [QingChulab setSingleLineAutoResizeWithMaxWidth:(120)];
        //        箭头2
        UIImageView *arrowQingChu = [[UIImageView alloc]init];
        arrowQingChu.image = [UIImage imageNamed:@"btn_arrow"];
        [QingChuview addSubview:arrowQingChu];
        [arrowQingChu sizeToFit];
        arrowQingChu.centerY = 25;
        arrowQingChu.x = SCREEN_WIDTH - 28- arrowQingChu.width;
        
        // 10.2MB
        QingChuNum= [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLDetailColor WithFatherView:QingChuview];
        QingChuNum.text = [NSString stringWithFormat:@"%.2fM",[[SDImageCache sharedImageCache] getSize]/1024/1024.00];//@"10.2MB";
        QingChuNum.sd_layout
        .centerYIs(25)
        .rightSpaceToView(arrowQingChu, 10)
        .heightIs(17);
        [QingChuNum setSingleLineAutoResizeWithMaxWidth:(120)];
        
        
        
        UIView *hline2 = [UIView new];
        hline2.backgroundColor = MLBGColor;
        [MycenterView addSubview:hline2];
        hline2.sd_layout
        .topSpaceToView(MycenterView, 151)
        .leftSpaceToView(MycenterView, 30)
        .rightSpaceToView(MycenterView, 0)
        .heightIs(1);
        
        
        
        
        
        
        
        
        
        
        
// 修改密码
        UIView *walletview = [UIView new];
        walletview.backgroundColor = [UIColor whiteColor];
        [MycenterView addSubview:walletview];
        walletview.sd_layout
        .topSpaceToView(MycenterView, 152)
        .leftSpaceToView(MycenterView, 0)
        .rightSpaceToView(MycenterView, 0)
        .heightIs(50);
        
        //    跳转到修改密码
        UITapGestureRecognizer * tapwallet = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ChangePsw:)];
        [walletview addGestureRecognizer:tapwallet];
        
        
        
        UILabel *wallet = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:walletview];
        wallet.text = @"修改密码";
        wallet.sd_layout
        .centerYIs(25)
        .leftSpaceToView(walletview, 30)
        .heightIs(17);
        [wallet setSingleLineAutoResizeWithMaxWidth:(120)];
        //        箭头2
        UIImageView *arrow2 = [[UIImageView alloc]init];
        arrow2.image = [UIImage imageNamed:@"btn_arrow"];
        [walletview addSubview:arrow2];
        [arrow2 sizeToFit];
        arrow2.centerY = 25;
        arrow2.x = SCREEN_WIDTH - 28- arrow2.width;

        UIButton *ExitBtn = [[UIButton alloc]init];
        [self.view addSubview:ExitBtn];
        [ExitBtn setBackgroundImage:[UIImage imageNamed:@"btn_set"] forState:UIControlStateNormal];

        ExitBtn.width = SCREEN_WIDTH-14;
        ExitBtn.height = 65;
        ExitBtn.x = 7;
        ExitBtn.y = 241+NaviHeight;
       
      
        [ExitBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [ExitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [ExitBtn addTarget:self action:@selector(exit) forControlEvents:UIControlEventTouchUpInside];
        ExitBtn.titleLabel.font = [UIFont systemFontOfSize:16];
//        ExitBtn.backgroundColor = HLSColor(255,85,85);
        ExitBtn.layer.cornerRadius = 8;
        
        
//        底部信息
        UILabel *bottom3 = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentCenter WithTextColor:MLNaviColor WithFatherView:self.view];
        NSDictionary * dict = [NSBundle mainBundle].infoDictionary;
        NSString * version = [dict valueForKey:@"CFBundleShortVersionString"];
        bottom3.text = [NSString stringWithFormat:@"当前版本号：%@",version] ;
        bottom3.sd_layout
        .centerYIs(SCREEN_HEIGHT - 85)
        .centerXEqualToView(self.view)
        .heightIs(12);
        [bottom3 setSingleLineAutoResizeWithMaxWidth:(120)];
        
        
        
        UILabel *bottom2 = [HLSLable LabelWithFont:11 WithTextalignment:NSTextAlignmentCenter WithTextColor:MLDetailColor WithFatherView:self.view];
        
        bottom2.text = [NSString stringWithFormat:@"Copyright ©2018 南京一滴泉信息科技有限公司"] ;
        bottom2.sd_layout
        .topSpaceToView(bottom3, 20)
        .centerXEqualToView(self.view)
        .heightIs(12);
        [bottom2 setSingleLineAutoResizeWithMaxWidth:(260)];
        
        UILabel *bottom1 = [HLSLable LabelWithFont:11 WithTextalignment:NSTextAlignmentCenter WithTextColor:MLDetailColor WithFatherView:self.view];
        
        bottom1.text = [NSString stringWithFormat:@"all Rights Reserved"] ;
        bottom1.sd_layout
        .topSpaceToView(bottom2, 10)
        .centerXEqualToView(self.view)
        .heightIs(12);
        [bottom1 setSingleLineAutoResizeWithMaxWidth:(160)];
        
        
        
        
        
    }
    
    return MycenterView;
}


-(void)goAgreement:(UITapGestureRecognizer *)tap{
    
    MLNormalWebViewController *WebVc = [[MLNormalWebViewController alloc]init];
    WebVc.TittleStr = @"用户协议";
    WebVc.UrlStr = @"/product/userAgreement";

    [self.navigationController pushViewController:WebVc animated:YES];
    
}

-(void)clear:(UITapGestureRecognizer *)tap{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定删除缓存？" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];
        QingChuNum.text = [NSString stringWithFormat:@"%.2fM",[[SDImageCache sharedImageCache] getSize]/1024/1024.00];

    }];
    
    UIAlertAction *cancelaction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    
    [alert addAction:cancelaction];
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
  
    
}
//修改密码
-(void)ChangePsw:(UITapGestureRecognizer *)tap{
    ChangeMyPSWViewController *cvc = [[ChangeMyPSWViewController alloc]init];
    [self.navigationController pushViewController:cvc animated:YES];
    
    
}



-(void)exit{
    [self logout];

//    [self showMLhud];
    [MLMyRequest PostlogoutSuccess:^(NSDictionary *dic) {
        HLSLog(@"退出登录后的返回---%@",dic);
//        [self.HUD hideAnimated:YES];

        if ([[dic xyValueForKey:@"code"] integerValue] == SuccessCode) {

        }else{
            [HLSLable lableWithText:[dic xyValueForKey:@"message"]];
        }
    } failure:^(NSError *error) {
//        [self.HUD hideAnimated:YES];

    }];
    
    
   
    
}

-(void)logout{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"确定退出？" preferredStyle:UIAlertControllerStyleAlert];
    __weak typeof(self) weakself = self;
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定退出" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [mUserDefaults removeObjectForKey:KUserInfoDic];
        [mUserDefaults setObject:@"1" forKey:@"isTag"];
        [mUserDefaults synchronize];
        
        [APServiceTool setTag];
        //刷新个人中心
        [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadperson" object:self];
        
        
        LoginViewController *lvc = [[LoginViewController alloc]init];
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:lvc];
        navi.navigationBarHidden = YES;
        //        [self.delegate relogin];
        [self presentViewController:navi animated:YES completion:^{
            [self.navigationController popToRootViewControllerAnimated:YES];
            self.tabBarController.selectedIndex = 0;
            
        }];
        
        
        
        
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:cancel];
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
}


/**
 系统通知是否打开
 @return 是否打开
 */
//检测通知是否打开iOS8以后有所变化 所以需要适配iOS7
- (BOOL)openThePushNotification{
    
    if ([[UIApplication sharedApplication] currentUserNotificationSettings].types  == UIUserNotificationTypeNone) {
   
                    return NO;
                }else{
                    
                    return YES;
    }
}
-(void)switchAction:(id)sender
{
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
   
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
