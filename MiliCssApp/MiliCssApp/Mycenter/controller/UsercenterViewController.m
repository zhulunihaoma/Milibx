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
@interface UsercenterViewController ()
{
    UIView *MycenterView;
}
@end

@implementation UsercenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心";

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
        MycenterView.sd_layout
        .leftSpaceToView(self.view, 0)
        .rightSpaceToView(self.view, 0)
        .topSpaceToView(self.view, NaviHeight)
        .heightIs(102);
        
        
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
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gopassword:)];
        [passwordview addGestureRecognizer:tap];
        passwordview.userInteractionEnabled = YES;
        
        
        
        
        UILabel *motifypassword = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:passwordview];
        motifypassword.text = @"修改密码";
        motifypassword.sd_layout
        .centerYIs(25)
        .leftSpaceToView(passwordview, 30)
        .heightIs(17);
        [motifypassword setSingleLineAutoResizeWithMaxWidth:(120)];
//        箭头
        UIImageView *arrow1 = [[UIImageView alloc]init];
        arrow1.image = [UIImage imageNamed:@"img_achievement_arrow"];
        [passwordview addSubview:arrow1];
        [arrow1 sizeToFit];
        arrow1.centerY = 25;
        arrow1.x = SCREEN_WIDTH - 10- arrow1.width;
        
        
        UIView *hline1 = [UIView new];
        hline1.backgroundColor = HLSOneColor(215);
        [MycenterView addSubview:hline1];
        hline1.sd_layout
        .topSpaceToView(MycenterView, 50)
        .leftSpaceToView(MycenterView, 30)
        .rightSpaceToView(MycenterView, 0)
        .heightIs(1);
        
        
        
        
        
        
//        我的钱包cell
        UIView *walletview = [UIView new];
        walletview.backgroundColor = [UIColor whiteColor];
        [MycenterView addSubview:walletview];
        walletview.sd_layout
        .topSpaceToView(MycenterView, 51)
        .leftSpaceToView(MycenterView, 0)
        .rightSpaceToView(MycenterView, 0)
        .heightIs(50);
        
        //    跳转到钱包
        UITapGestureRecognizer * tapwallet = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gowallet:)];
        [walletview addGestureRecognizer:tapwallet];
        
        
        
        UILabel *wallet = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:walletview];
        wallet.text = @"我的钱包";
        wallet.sd_layout
        .centerYIs(25)
        .leftSpaceToView(walletview, 30)
        .heightIs(17);
        [wallet setSingleLineAutoResizeWithMaxWidth:(120)];
        //        箭头2
        UIImageView *arrow2 = [[UIImageView alloc]init];
        arrow2.image = [UIImage imageNamed:@"img_achievement_arrow"];
        [walletview addSubview:arrow2];
        [arrow2 sizeToFit];
        arrow2.centerY = 25;
        arrow2.x = SCREEN_WIDTH - 10- arrow2.width;
        UIView *hline2 = [UIView new];
        hline2.backgroundColor = HLSOneColor(215);
        [MycenterView addSubview:hline2];
        hline2.sd_layout
        .topSpaceToView(MycenterView, 101)
        .leftSpaceToView(MycenterView, 0)
        .rightSpaceToView(MycenterView, 0)
        .heightIs(1);
        
        UIButton *ExitBtn = [[UIButton alloc]init];
        [self.view addSubview:ExitBtn];
        [ExitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.view.mas_centerX);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-66, 46));
            make.top.mas_equalTo(@(131+NaviHeight));
        }];
        [ExitBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [ExitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [ExitBtn addTarget:self action:@selector(exit) forControlEvents:UIControlEventTouchUpInside];
        ExitBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        ExitBtn.backgroundColor = HLSColor(255,85,85);
        ExitBtn.layer.cornerRadius = 3;
        
        
    }
    
    return MycenterView;
}

-(void)gopassword:(UITapGestureRecognizer *)tap{
    
  
    
}
-(void)gowallet:(UITapGestureRecognizer *)tap{
    WalletCenterViewController *wvc = [[WalletCenterViewController alloc]init];
    
    //获取此View的底层controller
    
    [self.navigationController pushViewController:wvc animated:YES];
    
}
-(void)exit{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"确定退出？" preferredStyle:UIAlertControllerStyleAlert];
    __weak typeof(self) weakself = self;
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定退出" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        DEF_PERSISTENT_SET_OBJECT(@"", @"token");

        [mUserDefaults removeObjectForKey:KUserInfoDic];
        [mUserDefaults setObject:@"1" forKey:@"isTag"];
        [mUserDefaults synchronize];
        
//        [APServiceTool setTag];
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
