//
//  ChangeMyPSWViewController.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/6/6.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "ChangeMyPSWViewController.h"
#import "MD5Tool.h"
#import "MLloginRequest.h"
#import "HLSValidateCodeTool.h"
@interface ChangeMyPSWViewController ()
{
    UITextField *OldPw;

    UITextField *NewPw;
    UITextField *MoreNewPw;
    UIButton *NewPwIocn;
    UIButton *NewMoreNewPw;
    UIButton *SureBtn;
    UITextField *selectField;
    UIView *OldPwBgView;
    UIView *NewPwBgView;
    UIView *MoreNewPwBgView;

}
@end

@implementation ChangeMyPSWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改密码";
    self.navigationView.backgroundColor = [UIColor whiteColor];

    [self.navigationView.leftBtn setImage:[UIImage imageNamed:@"back-btn"] forState:UIControlStateNormal];
    [self.navigationView.leftBtn setImage:[UIImage imageNamed:@"back-btn"] forState:UIControlStateHighlighted];
    self.navigationView.lineImageView.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationView.backimg.hidden = YES;
    [self.navigationView addSubview:self.navigationView.titleLabel];
    [self.navigationView bringSubviewToFront:self.navigationView.titleLabel];
    self.navigationView.titleLabel.textColor = MLTittleColor;
    
    [self.navigationView addSubview:self.navigationView.leftBtn];
    [self.navigationView bringSubviewToFront:self.navigationView.leftBtn];

    
    
    [self setupviews];
    
    //    back-btn
    // Do any additional setup after loading the view.
}

-(void)setupviews{
    
    //旧的密码
    OldPwBgView = [[UIView alloc]init];
    OldPwBgView.x = 32;
    OldPwBgView.y =  NaviHeight +77;
    OldPwBgView.width = SCREEN_WIDTH - 64;
    OldPwBgView.height = 50;
    [self.view addSubview:OldPwBgView];
    OldPw = [[UITextField alloc]init];
    OldPw.placeholder = @"请输入原密码";
    [OldPwBgView addSubview:OldPw];
    
    OldPw.x = 0;
    OldPw.y = 0;
    OldPw.width = SCREEN_WIDTH - 64-22;
    OldPw.height = 50;
    OldPw.secureTextEntry = YES;
    [self setBorderWithView:OldPwBgView top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];
    [OldPw addTarget:self action:@selector(PasswordEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    
    UIButton *passwordicon_old = [[UIButton alloc]init];
    
    passwordicon_old.backgroundColor = [UIColor clearColor];
    [passwordicon_old setImage:[UIImage imageNamed:@"button_login_password_nodisplayt"] forState:UIControlStateNormal];
    [passwordicon_old setImage:[UIImage imageNamed:@"button_login_password_displayt"] forState:UIControlStateSelected];
    
    passwordicon_old.size = CGSizeMake(23, 23);
    passwordicon_old.x = OldPw.width ;
    passwordicon_old.centerY = OldPw.height/2;
    [passwordicon_old addTarget:self action:@selector(changestatte_old:) forControlEvents:UIControlEventTouchUpInside];
    
    [OldPwBgView addSubview:passwordicon_old];
    
   
    
    
    
    //新的密码
    NewPwBgView = [[UIView alloc]init];
    NewPwBgView.x = 32;
    NewPwBgView.y =  OldPwBgView.bottom +16;
    NewPwBgView.width = SCREEN_WIDTH - 64;
    NewPwBgView.height = 50;
    [self.view addSubview:NewPwBgView];
    NewPw = [[UITextField alloc]init];
    NewPw.placeholder = @"请输入新密码";
    [NewPwBgView addSubview:NewPw];
    
    NewPw.x = 0;
    NewPw.y = 0;
    NewPw.width = SCREEN_WIDTH - 64-22;
    NewPw.height = 50;
    NewPw.secureTextEntry = YES;
    [self setBorderWithView:NewPwBgView top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];
    [NewPw addTarget:self action:@selector(PasswordEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    
    UIButton *passwordicon_new = [[UIButton alloc]init];
    
    passwordicon_new.backgroundColor = [UIColor clearColor];
    [passwordicon_new setImage:[UIImage imageNamed:@"button_login_password_nodisplayt"] forState:UIControlStateNormal];
    [passwordicon_new setImage:[UIImage imageNamed:@"button_login_password_displayt"] forState:UIControlStateSelected];
    
    passwordicon_new.size = CGSizeMake(23, 23);
    passwordicon_new.x = OldPw.width ;
    passwordicon_new.centerY = OldPw.height/2;
    [passwordicon_new addTarget:self action:@selector(changestatte_new:) forControlEvents:UIControlEventTouchUpInside];
    
    [NewPwBgView addSubview:passwordicon_new];
    
    
    
    
    
    
    
    
    
    //新的密码
    MoreNewPwBgView = [[UIView alloc]init];
    MoreNewPwBgView.x = 32;
    MoreNewPwBgView.y =  NewPwBgView.bottom +16;
    MoreNewPwBgView.width = SCREEN_WIDTH - 64;
    MoreNewPwBgView.height = 50;
    [self.view addSubview:MoreNewPwBgView];
    MoreNewPw = [[UITextField alloc]init];
    MoreNewPw.placeholder = @"请输入新密码";
    [MoreNewPwBgView addSubview:MoreNewPw];
    
    MoreNewPw.x = 0;
    MoreNewPw.y = 0;
    MoreNewPw.width = SCREEN_WIDTH - 64-22;
    MoreNewPw.height = 50;
    MoreNewPw.secureTextEntry = YES;
    [self setBorderWithView:MoreNewPwBgView top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];
    [MoreNewPw addTarget:self action:@selector(PasswordEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    
    UIButton *passwordicon_morenew = [[UIButton alloc]init];
    
    passwordicon_morenew.backgroundColor = [UIColor clearColor];
    [passwordicon_morenew setImage:[UIImage imageNamed:@"button_login_password_nodisplayt"] forState:UIControlStateNormal];
    [passwordicon_morenew setImage:[UIImage imageNamed:@"button_login_password_displayt"] forState:UIControlStateSelected];
    
    passwordicon_morenew.size = CGSizeMake(23, 23);
    passwordicon_morenew.x = OldPw.width ;
    passwordicon_morenew.centerY = OldPw.height/2;
    [passwordicon_morenew addTarget:self action:@selector(changestatte_morenew:) forControlEvents:UIControlEventTouchUpInside];
    
    [MoreNewPwBgView addSubview:passwordicon_morenew];
    
    
   
    
    
    
    
    SureBtn = [[UIButton alloc]init];
    [SureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [self.view addSubview:SureBtn];
    [SureBtn setBackgroundImage:[UIImage imageNamed:@"btn_login"] forState:UIControlStateNormal];
    
  
    [SureBtn addTarget:self action:@selector(SureBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:SureBtn];
    SureBtn.x = 22;
    SureBtn.y = MoreNewPwBgView.bottom+60;
    SureBtn.width = SCREEN_WIDTH - 44;
    SureBtn.height = 65;
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
-(void)changestatte_old:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        OldPw.secureTextEntry = NO;
    }else{
        OldPw.secureTextEntry = YES;
        
    }
}
-(void)changestatte_new:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        NewPw.secureTextEntry = NO;
    }else{
        NewPw.secureTextEntry = YES;
        
    }
}
-(void)changestatte_morenew:(UIButton *)sender{
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
/**
 *  验证数据发送验证码
 */
- (BOOL)validateData {
    //密码
    if ([NewPw.text length] < 6 ) {
        
        [HLSLable lableWithText:@"密码必须为6-18位"];
        
        return NO;
        
    }
    if ([MoreNewPw.text length] < 6 ) {
        
        [HLSLable lableWithText:@"密码必须为6-18位"];
        
        return NO;
        
    }
    if (![MoreNewPw.text isEqualToString:NewPw.text]) {
        
        [HLSLable lableWithText:@"两次输入密码不一致"];
        
        return NO;
        
    }
    if (![HLSValidateCodeTool IsContainTwoCharacter:NewPw.text]) {
        
        [HLSLable lableWithText:@"您的密码过于简单"];
        
        return NO;
        
    }
    
    return YES;
}

-(void)SureBtn{
    if ([self validateData]) {

    [self showMLhud];
    [MLloginRequest PostmodifyPwdWitholdPwd:[MD5Tool md5:OldPw.text] newPwd:[MD5Tool md5:NewPw.text] confirmPwd:[MD5Tool md5:MoreNewPw.text] Success:^(NSDictionary *dic) {
        [self.HUD hideAnimated:YES];
        
        if ([[dic xyValueForKey:@"code"] integerValue] == SuccessCode) {
            [HLSLable lableWithText:@"修改成功"];
            [self.navigationController popViewControllerAnimated:YES];

        }else{
            [HLSLable lableWithText:[dic xyValueForKey:@"message"]];
        }
        
    } failure:^(NSError *error) {
        [self.HUD hideAnimated:YES];

    }];
    
    }
}

#pragma mark --EditingChanged
-(void)PasswordEditingChanged:(UITextField *)TextField{
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
