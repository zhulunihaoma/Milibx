//
//  ModifyPasswordViewController.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/25.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "ModifyPasswordViewController.h"

@interface ModifyPasswordViewController ()

{
    UITextField *NewPw;
    UITextField *MoreNewPw;
    UIButton *NewPwIocn;
    UIButton *NewMoreNewPw;
    UIButton *SureBtn;
    UITextField *selectField;
    
}
@end

@implementation ModifyPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改密码";
    self.navigationView.backgroundColor = [UIColor whiteColor];
    [self.navigationView.leftBtn setImage:[UIImage imageNamed:@"back-btn"] forState:UIControlStateNormal];
    [self.navigationView.leftBtn setImage:[UIImage imageNamed:@"back-btn"] forState:UIControlStateHighlighted];
    self.navigationView.lineImageView.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];

    [self setupviews];
    
    //    back-btn
    // Do any additional setup after loading the view.
}

-(void)setupviews{
    
    //    身份证号码
    NewPw = [[UITextField alloc]init];
    NewPw.placeholder = @"请输入新密码";
    [self.view addSubview:NewPw];
    NewPw.x = 32;
    NewPw.y = NaviHeight +77;
    NewPw.width = SCREEN_WIDTH - 64;
    NewPw.height = 50;
    [self setBorderWithView:NewPw top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];
    [NewPw addTarget:self action:@selector(EditingChanged:) forControlEvents:UIControlEventEditingChanged];
    UIButton *NewPwicon = [[UIButton alloc]init];
    
    NewPwicon.backgroundColor = [UIColor clearColor];
    [NewPwicon setImage:[UIImage imageNamed:@"button_login_password_nodisplayt"] forState:UIControlStateNormal];
    [NewPwicon setImage:[UIImage imageNamed:@"button_login_password_displayt"] forState:UIControlStateSelected];
    
    NewPwicon.size = CGSizeMake(22, 22);
    NewPwicon.x = NewPw.width - 25;
    NewPwicon.centerY = NewPw.height/2;
    [NewPwicon addTarget:self action:@selector(changestatte:) forControlEvents:UIControlEventTouchUpInside];
    
    [NewPw addSubview:NewPwicon];
    
    
    //  手机号码
    MoreNewPw = [[UITextField alloc]init];
    MoreNewPw.placeholder = @"再次输入新密码";
    [self.view addSubview:MoreNewPw];
    
    MoreNewPw.x = 32;
    MoreNewPw.y = NewPw.bottom+13;
    MoreNewPw.width = SCREEN_WIDTH - 64;
    MoreNewPw.height = 50;
    [self setBorderWithView:MoreNewPw top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];
    [MoreNewPw addTarget:self action:@selector(EditingChanged:) forControlEvents:UIControlEventEditingChanged];
    
    UIButton *MoreNewPwicon = [[UIButton alloc]init];
    
    MoreNewPwicon.backgroundColor = [UIColor clearColor];
    [MoreNewPwicon setImage:[UIImage imageNamed:@"button_login_password_nodisplayt"] forState:UIControlStateNormal];
    [MoreNewPwicon setImage:[UIImage imageNamed:@"button_login_password_displayt"] forState:UIControlStateSelected];
    
    MoreNewPwicon.size = CGSizeMake(22, 22);
    MoreNewPwicon.x = MoreNewPw.width - 25;
    MoreNewPwicon.centerY = MoreNewPw.height/2;
    [MoreNewPwicon addTarget:self action:@selector(changestatte:) forControlEvents:UIControlEventTouchUpInside];
    
    [MoreNewPw addSubview:MoreNewPwicon];
    
    
    
    
    
    
    SureBtn = [[UIButton alloc]init];
    SureBtn.backgroundColor = MLNaviColor;
    [SureBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [self.view addSubview:SureBtn];
    [SureBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:SureBtn];
    SureBtn.x = 32;
    SureBtn.y = MoreNewPw.bottom+60;
    SureBtn.width = SCREEN_WIDTH - 64;
    SureBtn.height = 50;
    SureBtn.layer.cornerRadius = 6;
    SureBtn.titleLabel.font = TextFontSize(17);
    [NewPw addTarget:self action:@selector(EditingDidBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [MoreNewPw addTarget:self action:@selector(EditingDidBegin:) forControlEvents:UIControlEventEditingDidBegin];
    
    
    
}
- (void)setBorderWithView:(UIView *)view top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width
{
    if (top) {
        CALayer *layer = [[CALayer alloc]init];
        layer.frame = CGRectMake(0, 0, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (left) {
        CALayer *layer = [[CALayer alloc]init];
        layer.frame = CGRectMake(0, 0, width, view.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (bottom) {
        CALayer *layer = [[CALayer alloc]init];
        layer.frame = CGRectMake(0, view.frame.size.height - width, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (right) {
        CALayer *layer = [[CALayer alloc]init];
        layer.frame = CGRectMake(view.frame.size.width - width, 0, width, view.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
}
-(void)EditingDidBegin:(id)sender{
    
    [self setBorderWithView:selectField top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];
    [self setBorderWithView:sender top:NO left:NO bottom:YES right:NO borderColor:MLNaviColor borderWidth:1];
    selectField = sender;
    
    
}
-(void)changestatte:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        MoreNewPw.secureTextEntry = NO;
    }else{
        MoreNewPw.secureTextEntry = YES;
        
    }
}
-(void)forgetps{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)login{
    
    
    
    //    [MLloginRequest PostLoginWithloginName:NewPw.text WithMoreNewPw:[MD5Tool md5:MoreNewPw.text] token:nil Success:^(NSDictionary *dic) {
    //        HLSLog(@"aa:%@",dic);
    //        //        [self back];
    //        NSMutableDictionary *userdic = [dic xyValueForKey:@"result"];
    //        DEF_PERSISTENT_SET_OBJECT(userdic, @"userinfo");
    //        userstring = [JSONTool dictionaryToJson:[HLSPersonalInfoTool getUserinfo]];
    //        HLSLog(@"--本地%@",userstring);
    //        [self initwebview];
    //
    //        [HLSLable lableWithText:@"登录成功！"];
    //
    //    } failure:^(NSError *error) {
    //
    //    }];
}

#pragma mark --EditingChanged
-(void)EditingChanged:(UITextField *)TextField{
    if (TextField == NewPw) {
        if (TextField.text.length >18) {
            TextField.text = [TextField.text substringToIndex:18];
        }
    }
    if (TextField == MoreNewPw) {
        if (TextField.text.length >11) {
            TextField.text = [TextField.text substringToIndex:11];
        }
    }
   
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
