//
//  LoginViewController.m
//  MiliCssApp
//
//  Created by Milizhu on 2018/3/23.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "LoginViewController.h"
#import "MLloginRequest.h"
@interface LoginViewController ()
{
    UITextField *account;
    UITextField *password;
    UIButton *submmit;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    [self setupviews];
    // Do any additional setup after loading the view.
}
-(void)setupviews{
//    用户名
    account = [[UITextField alloc]init];
    account.placeholder = @"请输入用户名";
    account.layer.borderColor = MLNaviColor.CGColor;
    account.layer.borderWidth = 1;
    [self.view addSubview:account];
    account.sd_layout
    .leftSpaceToView(self.view, 10)
    .rightSpaceToView(self.view, 10)
    .topSpaceToView(self.view, 80)
    .heightIs(50);
    //    用户名
    password = [[UITextField alloc]init];
    password.placeholder = @"请输入密码";
    password.layer.borderColor = MLNaviColor.CGColor;
    password.layer.borderWidth = 1;
    [self.view addSubview:password];
    password.sd_layout
    .leftSpaceToView(self.view, 10)
    .rightSpaceToView(self.view, 10)
    .topSpaceToView(account, 30)
    .heightIs(50);
    submmit = [[UIButton alloc]init];
    submmit.backgroundColor = MLNaviColor;
    [submmit setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:submmit];
    [submmit addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submmit];
    submmit.sd_layout
    .leftSpaceToView(self.view, 40)
    .rightSpaceToView(self.view, 40)
    .topSpaceToView(password, 30)
    .heightIs(50);
}
-(void)login{
//    [MLloginRequest PostLoginWithloginName:@"13951795032" WithPassword:@"ni111111" token:@"nist" Success:^(NSDictionary *dic) {
//        HLSLog(@"aa:%@",[Translatecode descriptionWithLocale:dic]);
//
//    } failure:^(NSError *error) {
//
//    }];
    DEF_PERSISTENT_SET_OBJECT(@"token123", @"token");
    [self back];
}
-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
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
