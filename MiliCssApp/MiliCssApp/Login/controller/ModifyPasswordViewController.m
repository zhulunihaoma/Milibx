//
//  ModifyPasswordViewController.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/25.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "ModifyPasswordViewController.h"
#import "MLloginRequest.h"
#import "MD5Tool.h"
#import "HLSValidateCodeTool.h"
@interface ModifyPasswordViewController ()<UITextFieldDelegate>

{
    UITextField *NewPw;
    UITextField *MoreNewPw;
    UIButton *NewPwIocn;
    UIButton *NewMoreNewPw;
    UIButton *SureBtn;
    UITextField *selectField;
    UIView *NewPwBgView;
    UIView *MoreNewPwBgView;
    
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
      //新密码
    NewPwBgView = [[UIView alloc]init];
    NewPwBgView.x = 32;
    NewPwBgView.y =  NaviHeight +77;
    NewPwBgView.width = SCREEN_WIDTH - 64;
    NewPwBgView.height = 50;
    [self.view addSubview:NewPwBgView];
  
    
    NewPw = [[UITextField alloc]init];
    NewPw.placeholder = @"请输入新密码";
    [NewPwBgView addSubview:NewPw];
    NewPw.secureTextEntry = YES;
    NewPw.clearsOnBeginEditing = NO;
    NewPw.delegate = self;
    NewPw.x = 0;
    NewPw.y = 0;
    NewPw.width = SCREEN_WIDTH - 64-22;
    NewPw.height = 50;
    [self setBorderWithView:NewPwBgView top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];

//    [self setBorderWithView:NewPw top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];
    [NewPw addTarget:self action:@selector(EditingChanged:) forControlEvents:UIControlEventEditingChanged];
    UIButton *NewPwicon = [[UIButton alloc]init];
    
    NewPwicon.backgroundColor = [UIColor clearColor];
    [NewPwicon setImage:[UIImage imageNamed:@"button_login_password_nodisplayt"] forState:UIControlStateNormal];
    [NewPwicon setImage:[UIImage imageNamed:@"button_login_password_displayt"] forState:UIControlStateSelected];
    NewPwicon.tag = 100;
    NewPwicon.size = CGSizeMake(22, 22);
    NewPwicon.x = NewPw.width;
    NewPwicon.centerY = NewPw.height/2;
    [NewPwicon addTarget:self action:@selector(changestatte:) forControlEvents:UIControlEventTouchUpInside];
    
    [NewPwBgView addSubview:NewPwicon];
    
    
    //再次输入新密码
    MoreNewPwBgView = [[UIView alloc]init];
    
    MoreNewPwBgView.x = 32;
    MoreNewPwBgView.y = NewPwBgView.bottom+13;
    MoreNewPwBgView.width = SCREEN_WIDTH - 64;
    MoreNewPwBgView.height = 50;
    [self.view addSubview:MoreNewPwBgView];
    MoreNewPw = [[UITextField alloc]init];
    MoreNewPw.placeholder = @"再次输入新密码";
    MoreNewPw.clearsOnBeginEditing = NO;
    MoreNewPw.delegate = self;

    [MoreNewPwBgView addSubview:MoreNewPw];
    MoreNewPw.secureTextEntry = YES;

    MoreNewPw.x = 0;
    MoreNewPw.y = 0;
    MoreNewPw.width = SCREEN_WIDTH - 64-22;
    MoreNewPw.height = 50;
//    [self setBorderWithView:MoreNewPw top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];
    [self setBorderWithView:MoreNewPwBgView top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];

    [MoreNewPw addTarget:self action:@selector(EditingChanged:) forControlEvents:UIControlEventEditingChanged];
    
    UIButton *MoreNewPwicon = [[UIButton alloc]init];
    
    MoreNewPwicon.backgroundColor = [UIColor clearColor];
    [MoreNewPwicon setImage:[UIImage imageNamed:@"button_login_password_nodisplayt"] forState:UIControlStateNormal];
    [MoreNewPwicon setImage:[UIImage imageNamed:@"button_login_password_displayt"] forState:UIControlStateSelected];
    MoreNewPwicon.tag = 101;
    MoreNewPwicon.size = CGSizeMake(22, 22);
    MoreNewPwicon.x = MoreNewPw.width;
    MoreNewPwicon.centerY = MoreNewPw.height/2;
    [MoreNewPwicon addTarget:self action:@selector(changestatte:) forControlEvents:UIControlEventTouchUpInside];
    
    [MoreNewPwBgView addSubview:MoreNewPwicon];
    
    
    
    
    
    
    SureBtn = [[UIButton alloc]init];
   
    [SureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [self.view addSubview:SureBtn];
    [SureBtn addTarget:self action:@selector(Finish) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:SureBtn];
     [SureBtn setBackgroundImage:[UIImage imageNamed:@"btn_login"] forState:UIControlStateNormal];
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
-(void)EditingDidBegin:(id) sender{
    
    if (sender == NewPw) {
        [self setBorderWithView:NewPwBgView top:NO left:NO bottom:YES right:NO borderColor:MLNaviColor borderWidth:1];
        
        [self setBorderWithView:MoreNewPwBgView top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];
        
    }else{
        [self setBorderWithView:MoreNewPwBgView top:NO left:NO bottom:YES right:NO borderColor:MLNaviColor borderWidth:1];
        
        [self setBorderWithView:NewPwBgView top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];
        
    }
    
    
}

-(void)changestatte:(UIButton *)sender{
    sender.selected = !sender.selected;
    [self.view endEditing:YES];

    if (sender.selected) {
        if (sender.tag == 100) {
            NewPw.secureTextEntry = NO;
            
        }
        if (sender.tag == 101) {
            MoreNewPw.secureTextEntry = NO;
            
        }
    }else{
        if (sender.tag == 100) {
            NewPw.secureTextEntry = YES;
            
        }
        if (sender.tag == 101) {
            MoreNewPw.secureTextEntry = YES;
            
        }
    }
}
/**
 *  验证数据发送验证码
 */
- (BOOL)validateData {
    //密码
    if ([NewPw.text length] == 0 ) {
        
        [HLSLable lableWithText:@"密码不能为空"];
        
        return NO;
        
    }
    if ([MoreNewPw.text length] == 0 ) {
        
        [HLSLable lableWithText:@"确认密码不能为空"];
        
        return NO;
        
    }
    if ([NewPw.text length] < 6 ) {
        
        [HLSLable lableWithText:@"密码必须为6-18位"];
        
        return NO;
        
    }
    if ([MoreNewPw.text length] < 6 ) {
        
        [HLSLable lableWithText:@"确认密码必须为6-18位"];
        
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

-(void)Finish{
    if ([self validateData]) {

        [self showMLhud];
    [MLloginRequest PostForgetPassWithnewPwd:[MD5Tool md5:NewPw.text] confirmPwd:[MD5Tool md5:MoreNewPw.text] cardNo:self.cardNo Success:^(NSDictionary *dic) {
        HLSLog(@"完后修改:%@",dic);
        [self.HUD hideAnimated:YES];
        if ([[dic xyValueForKey:@"code"] integerValue] == SuccessCode) {
            [HLSLable lableWithText:@"修改完成"];
            [self.navigationController popToRootViewControllerAnimated:YES];

        }else{
            [HLSLable lableWithText:[dic xyValueForKey:@"message"]];
        }

    } failure:^(NSError *error) {
        [self.HUD hideAnimated:YES];

    }];
    }
    
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
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *updatedString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    textField.text = updatedString;
    
    return NO;
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
