//
//  CheckIdViewController.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/25.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "CheckIdViewController.h"
#import "MLloginRequest.h"
#import "ModifyPasswordViewController.h"
#import "HLSValidateCodeTool.h"
@interface CheckIdViewController ()
{
    UITextField *Idcard;
    UITextField *PhoneNum;
    UITextField *TestNum;
    UIButton *SendMsgBtn;

    UIButton *NextBtn;
    UITextField *selectField;

}
@end

@implementation CheckIdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"身份验证";
    self.navigationView.backgroundColor = [UIColor whiteColor];
    [self.navigationView.leftBtn setImage:[UIImage imageNamed:@"back-btn"] forState:UIControlStateNormal];
    [self.navigationView.leftBtn setImage:[UIImage imageNamed:@"back-btn"] forState:UIControlStateHighlighted];
    self.navigationView.lineImageView.hidden = YES;
    [self setupviews];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationView.backimg.hidden = YES;
    [self.navigationView addSubview:self.navigationView.titleLabel];
    [self.navigationView bringSubviewToFront:self.navigationView.titleLabel];
    self.navigationView.titleLabel.textColor = MLTittleColor;
    
    [self.navigationView addSubview:self.navigationView.leftBtn];
    [self.navigationView bringSubviewToFront:self.navigationView.leftBtn];


//    back-btn
    // Do any additional setup after loading the view.
}

-(void)setupviews{
    
    //    身份证号码
    Idcard = [[UITextField alloc]init];
    Idcard.placeholder = @"请输入身份证号码";
    Idcard.clearButtonMode= YES;
    [self.view addSubview:Idcard];
    Idcard.x = 32;
    Idcard.y = NaviHeight +77;
    Idcard.width = SCREEN_WIDTH - 64;
    Idcard.height = 50;
    [self setBorderWithView:Idcard top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];
    [Idcard addTarget:self action:@selector(EditingChanged:) forControlEvents:UIControlEventEditingChanged];

    
    
    //  手机号码
    PhoneNum = [[UITextField alloc]init];
    PhoneNum.placeholder = @"请输入手机号";
    [self.view addSubview:PhoneNum];
    
    PhoneNum.x = 32;
    PhoneNum.y = Idcard.bottom+13;
    PhoneNum.width = SCREEN_WIDTH - 64;
    PhoneNum.height = 50;
    PhoneNum.clearButtonMode= YES;
    [self setBorderWithView:PhoneNum top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];
    [PhoneNum addTarget:self action:@selector(EditingChanged:) forControlEvents:UIControlEventEditingChanged];

    
    //  验证码
    TestNum = [[UITextField alloc]init];
    TestNum.placeholder = @"请输入验证码";
    [self.view addSubview:TestNum];
    TestNum.x = 32;
    TestNum.y = PhoneNum.bottom+13;
    TestNum.width = SCREEN_WIDTH - 64;
    TestNum.height = 50;
    [self setBorderWithView:TestNum top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];
    [TestNum addTarget:self action:@selector(EditingChanged:) forControlEvents:UIControlEventEditingChanged];

    
    SendMsgBtn = [[UIButton alloc]init];
    
    SendMsgBtn.backgroundColor = [UIColor clearColor];
    SendMsgBtn.backgroundColor = MLNaviColor;
    [SendMsgBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
    SendMsgBtn.titleLabel.font = TextFontSize(14);

    
    SendMsgBtn.size = CGSizeMake(85, 35);
    SendMsgBtn.x = PhoneNum.width - 87;
    SendMsgBtn.centerY = PhoneNum.height/2;
    [SendMsgBtn addTarget:self action:@selector(SendMeesage:) forControlEvents:UIControlEventTouchUpInside];
    
    [TestNum addSubview:SendMsgBtn];
    
    
    
    
    
    
    NextBtn = [[UIButton alloc]init];
    [NextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [self.view addSubview:NextBtn];
    [NextBtn addTarget:self action:@selector(GoNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:NextBtn];
    [NextBtn setBackgroundImage:[UIImage imageNamed:@"btn_login"] forState:UIControlStateNormal];

    NextBtn.x = 22;
    NextBtn.y = TestNum.bottom+60;
    NextBtn.width = SCREEN_WIDTH - 44;
    NextBtn.height = 65;
    
    
    
    
    NextBtn.layer.cornerRadius = 6;
    NextBtn.titleLabel.font = TextFontSize(17);
    [PhoneNum addTarget:self action:@selector(EditingDidBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [Idcard addTarget:self action:@selector(EditingDidBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [TestNum addTarget:self action:@selector(EditingDidBegin:) forControlEvents:UIControlEventEditingDidBegin];

  
    
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
//发送验证码
-(void)SendMeesage:(UIButton *)sender{
    if ([self validateData]) {

    [self showMLhud];
    [MLloginRequest PostCertifyNumWithphoneNo:PhoneNum.text templateCode:@"1013" Success:^(NSDictionary *dic) {
        HLSLog(@"--验证码%@---",dic);

        [self.HUD hideAnimated:YES];
        if ([[dic xyValueForKey:@"code"] integerValue] == SuccessCode) {
            [self startTime];
        }else{
            [HLSLable lableWithText:[dic xyValueForKey:@"message"]];
        }
    } failure:^(NSError *error) {
        [self.HUD hideAnimated:YES];
    }];
    }
}
/**
 *  验证数据发送验证码
 */
- (BOOL)validateData {
    //手机号不能为空
    if ([PhoneNum.text length] == 0) {
        
        [HLSLable lableWithText:@"请输入手机号"];
        
        return NO;
        
    }
   
    
    if (![HLSValidateCodeTool isValidateMobile:PhoneNum.text]) {
        [HLSLable lableWithText:@"请输入正确格式的手机号"];

        return NO;
        
    }
    
    return YES;
}

//计时器的方法
-(void)startTime{
    
    __block int timeout = 60; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0)
        { //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [SendMsgBtn setTitle:@"重新发送" forState:UIControlStateNormal];
                SendMsgBtn.userInteractionEnabled = YES;
                [SendMsgBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//                SendMsgBtn.layer.cornerRadius = 2;
//                SendMsgBtn.layer.masksToBounds = YES;
                SendMsgBtn.backgroundColor = HLSColor(24, 198, 131);
            });
        }
        else
        {
            int seconds = timeout % 100;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [SendMsgBtn setTitle:[NSString stringWithFormat:@"已发送(%@)",strTime] forState:UIControlStateNormal];
                SendMsgBtn.userInteractionEnabled = NO;
                SendMsgBtn.layer.borderWidth = 0;
                SendMsgBtn.backgroundColor = HLSOneColor(204);
                [SendMsgBtn setTitleColor:HLSOneColor(999999) forState:UIControlStateNormal];
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
    
}


-(void)EditingDidBegin:(id)sender{
    
    [self setBorderWithView:selectField top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];
    [self setBorderWithView:sender top:NO left:NO bottom:YES right:NO borderColor:MLNaviColor borderWidth:1];
    selectField = sender;
    
    
}
-(void)changestatte:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        PhoneNum.secureTextEntry = NO;
    }else{
        PhoneNum.secureTextEntry = YES;
        
    }
}
/**
 *  验证数据下一部
 */
- (BOOL)validateDataNext{
    //手机号不能为空
    if ([Idcard.text length] == 0) {
        
        [HLSLable lableWithText:@"身份证号码不能为空"];
        
        return NO;
        
    }
    if ([PhoneNum.text length] == 0) {
        
        [HLSLable lableWithText:@"手机号不能为空"];
        
        return NO;
        
    }
    
    
    if ([TestNum.text length] == 0) {
        
        [HLSLable lableWithText:@"验证码不能为空"];
        
        return NO;
        
    }
    if (![HLSValidateCodeTool validateIDCardNumber:Idcard.text]) {
        [HLSLable lableWithText:@"请输入正确身份证号码"];
        
        return NO;
        
    }
    if (![HLSValidateCodeTool isValidateMobile:PhoneNum.text]) {
        [HLSLable lableWithText:@"请输入正确手机号"];
        
        return NO;
        
    }
    if ([TestNum.text length] != 6) {
        
        [HLSLable lableWithText:@"请输入正确验证码"];
        
        return NO;
        
    }

    
   
    
    return YES;
}
-(void)GoNext{
//    ModifyPasswordViewController *mvc = [[ModifyPasswordViewController alloc]init];
//    mvc.cardNo = Idcard.text;
//    [self.navigationController pushViewController:mvc animated:YES];
    if ([self validateDataNext]) {
        [self showMLhud];
    [MLloginRequest PostverifyResetPwdCodeByAppWithphoneCode:TestNum.text WithphoneNo:PhoneNum.text templateCode:@"1013" cardNo:Idcard.text Success:^(NSDictionary *dic) {
        HLSLog(@"--验证%@---",dic);
        [self.HUD hideAnimated:YES];

        if ([[dic xyValueForKey:@"code"] integerValue] == SuccessCode) {
                    ModifyPasswordViewController *mvc = [[ModifyPasswordViewController alloc]init];
                    mvc.cardNo = Idcard.text;
                    [self.navigationController pushViewController:mvc animated:YES];
        }else{
            [HLSLable lableWithText:[dic xyValueForKey:@"message"]];
        }


    } failure:^(NSError *error) {
        [self.HUD hideAnimated:YES];

    }];

    }

}
-(void)login{
    
    
    
//    [MLloginRequest PostLoginWithloginName:Idcard.text WithPhoneNum:[MD5Tool md5:PhoneNum.text] token:nil Success:^(NSDictionary *dic) {
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
    if (TextField == Idcard) {
        if (TextField.text.length >18) {
            TextField.text = [TextField.text substringToIndex:18];
        }
    }
    if (TextField == PhoneNum) {
        if (TextField.text.length >11) {
            TextField.text = [TextField.text substringToIndex:11];
        }
    }
    if (TextField == TestNum) {
        if (TextField.text.length >6) {
            TextField.text = [TextField.text substringToIndex:6];
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
