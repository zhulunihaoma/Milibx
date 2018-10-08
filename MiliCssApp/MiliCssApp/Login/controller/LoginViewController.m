//
//  LoginViewController.m
//  MiliCssApp
//
//  Created by Milizhu on 2018/3/23.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "LoginViewController.h"
#import "MLloginRequest.h"
#import "MD5Tool.h"
#import "JSONTool.h"
#import "HLSPersonalInfoTool.h"
#import "UIImage+GIF.h"
#import "CheckIdViewController.h"
#import <WebKit/WebKit.h>
#import "APServiceTool.h"
#import "ChangeMyPSWViewController.h"
@interface LoginViewController ()<WKNavigationDelegate, WKUIDelegate,UITextFieldDelegate>
{
    UITextField *account;
    UITextField *password;
    UIButton *submmit;
    NSString *userstring;
    NSString *WAPSESSIONID;

    CALayer *player;
    UIView *selectField;
    UIView *PswBgView;
}
@property(nonatomic,strong)WKWebView *webView;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    [mUserDefaults removeObjectForKey:KUserInfoDic];
    [mUserDefaults setObject:@"1" forKey:@"isTag"];
    [APServiceTool setTag];

    [mUserDefaults synchronize];
    
    self.navigationView.backgroundColor = [UIColor whiteColor];
    [self setupviews];
    self.navigationView.lineImageView.hidden = YES;
    self.navigationView.backimg.hidden = YES;
    [self.navigationView.leftBtn setImage:[UIImage imageNamed:@"back-btn"] forState:UIControlStateNormal];
    [self.navigationView.leftBtn setImage:[UIImage imageNamed:@"back-btn"] forState:UIControlStateHighlighted];
    [self.navigationView addSubview:self.navigationView.leftBtn];
    [self.navigationView bringSubviewToFront:self.navigationView.leftBtn];

    [self.navigationView addSubview:self.navigationView.titleLabel];
    [self.navigationView bringSubviewToFront:self.navigationView.titleLabel];
    self.navigationView.titleLabel.textColor = MLTittleColor;
    selectField = [UITextField new];

    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
-(void)pauseLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

//继续gif的方法
-(void)resumeLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] -    pausedTime;
    layer.beginTime = timeSincePause;
}
-(void)initwebview{
    
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 450+NaviHeight, SCREEN_WIDTH, 100)];
    self.webView.allowsBackForwardNavigationGestures = YES;
    [self.view addSubview:self.webView];
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
    NSString *tempUrl = [NSString stringWithFormat:@"%@/initdata",RequestWebUrl];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:tempUrl] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    [self.webView loadRequest:request];

}



-(void)setupviews{
//    gif动图

    UIImageView *logo_gif = [[UIImageView alloc]init];
    
   
    logo_gif.image = [UIImage imageNamed:@"login_logo"];

    
    [self.view addSubview:logo_gif];
    
    logo_gif.sd_layout
    .heightIs(Fit6(133))
    .widthIs(Fit6(133))
    .topSpaceToView(self.view, NaviHeight+37)
    .centerXEqualToView(self.view);


//    用户名
    account = [[UITextField alloc]init];
    account.placeholder = @"请输入用户名或手机号";
//    account.layer.borderColor = MLNaviColor.CGColor;
//    account.layer.borderWidth = 1;
    account.clearButtonMode= YES;
    [self.view addSubview:account];
    account.x = 32;
    account.y = NaviHeight +203;
    account.width = SCREEN_WIDTH - 64;
    account.height = 50;
    [self setBorderWithView:account top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];
    [account addTarget:self action:@selector(AccountEditingChanged:) forControlEvents:UIControlEventEditingChanged];



    // 密码
//密码底部的 背景图
    PswBgView = [[UIView alloc]init];
    PswBgView.x = 32;
    PswBgView.y = account.bottom+13;
    PswBgView.width = SCREEN_WIDTH - 64;
    PswBgView.height = 50;
    [self.view addSubview:PswBgView];
    password = [[UITextField alloc]init];
    password.placeholder = @"请输入密码";
    [PswBgView addSubview:password];
    password.clearsOnBeginEditing = NO;
    password.delegate = self;
    password.x = 0;
    password.y = 0;
    password.width = SCREEN_WIDTH - 64-22;
    password.height = 50;
    password.secureTextEntry = YES;
    [self setBorderWithView:PswBgView top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];
    [password addTarget:self action:@selector(PasswordEditingChanged:) forControlEvents:UIControlEventEditingChanged];

    UIButton *passwordicon = [[UIButton alloc]init];
    
    passwordicon.backgroundColor = [UIColor clearColor];
    [passwordicon setImage:[UIImage imageNamed:@"button_login_password_nodisplayt"] forState:UIControlStateNormal];
    [passwordicon setImage:[UIImage imageNamed:@"button_login_password_displayt"] forState:UIControlStateSelected];

    passwordicon.size = CGSizeMake(23, 23);
    passwordicon.x = password.width ;
    passwordicon.centerY = password.height/2;
    [passwordicon addTarget:self action:@selector(changestatte:) forControlEvents:UIControlEventTouchUpInside];

    [PswBgView addSubview:passwordicon];
    
    
    
    

    
    submmit = [[UIButton alloc]init];
    [submmit setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:submmit];
    [submmit addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [submmit setBackgroundImage:[UIImage imageNamed:@"btn_login_default"] forState:UIControlStateNormal];
    [submmit setBackgroundImage:[UIImage imageNamed:@"btn_login"] forState:UIControlStateSelected];

    submmit.userInteractionEnabled = NO;
    [submmit setTitleColor:HLSHexColor(0xc0edc6) forState:UIControlStateNormal];
    [submmit setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];

    submmit.x = 22;
    submmit.y = PswBgView.bottom+60;
    submmit.height  = 65;
    submmit.width = SCREEN_WIDTH - 44;
    
    submmit.layer.cornerRadius = 6;
    submmit.titleLabel.font = TextFontSize(17);
    [password addTarget:self action:@selector(EditingDidBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [account addTarget:self action:@selector(EditingDidBegin:) forControlEvents:UIControlEventEditingDidBegin];

//    忘记密码
    UILabel *forgetps = [HLSLable LabelWithFont:14 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLNaviColor WithFatherView:self.view];
    forgetps.text = @"忘记密码";
    //    跳转忘记密码
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(forgetps)];
    [forgetps addGestureRecognizer:tap];
    forgetps.userInteractionEnabled = YES;
    forgetps.sd_layout
    .topSpaceToView(PswBgView, 15)
    .rightSpaceToView(self.view, 34)
    .heightIs(24);
    [forgetps setSingleLineAutoResizeWithMaxWidth:(100)];
    
}
//
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
   
    
    if (sender == password) {
        [self setBorderWithView:PswBgView top:NO left:NO bottom:YES right:NO borderColor:MLNaviColor borderWidth:1];

        [self setBorderWithView:account top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];

    }else{
        [self setBorderWithView:account top:NO left:NO bottom:YES right:NO borderColor:MLNaviColor borderWidth:1];
        
        [self setBorderWithView:PswBgView top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];

    }


}
-(void)changestatte:(UIButton *)sender{
    [self.view endEditing:YES];

    sender.selected = !sender.selected;

    if (sender.selected) {
        password.secureTextEntry = NO;
    }else{
        password.secureTextEntry = YES;

    }
}
-(void)forgetps{
    CheckIdViewController *cvc = [[CheckIdViewController alloc]init];
    
    [self.navigationController pushViewController:cvc animated:YES];
}
/**
 *  验证数据下一部
 */
- (BOOL)validateData{
    //手机号不能为空
    if ([account.text length] == 0 || [password.text length] == 0 ) {
        
//        [HLSLable lableWithText:@"请输入用户名或密码"];
        
        return NO;
        
    }
    
    
    return YES;
}
-(void)login{
    if (![self validateData]) {
        return;
    }

    [self showMLhud];

    [MLloginRequest PostLoginWithloginName:account.text WithPassword:[MD5Tool md5:password.text] token:nil Success:^(NSDictionary *dic) {
        HLSLog(@"aa:%@",dic);

        [self.HUD hideAnimated:YES];
        if ([[dic xyValueForKey:@"code"] integerValue] == SuccessCode) {
            //        [self back];

            NSMutableDictionary *userdic = [NSMutableDictionary dictionaryWithDictionary:[dic xyValueForKey:@"result"]];
            NSMutableDictionary *Myuserinfo = [NSMutableDictionary dictionaryWithDictionary:[userdic xyValueForKey:@"user"]];
            NSArray* arr = [Myuserinfo allKeys];
            for(NSString *str in arr)
            {
                id obj = [Myuserinfo objectForKey:str];// judge NSNull
                
                BOOL isNull = [obj isEqual:[NSNull null]];
                if (isNull) {
                    [Myuserinfo setValue:@"" forKey:str];
                }
//                NSLog("%@", [yourdictonary objectForKey:str]);
            }
            [userdic setValue:Myuserinfo forKey:@"user"];

            
            DEF_PERSISTENT_SET_OBJECT(userdic, KUserInfoDic);
            userstring = [JSONTool dictionaryToJson:[HLSPersonalInfoTool getUserinfo]];
            NSString *session = [HLSPersonalInfoTool getCookies];
            NSString *merchantCode = [HLSPersonalInfoTool getmerchantCode];

            HLSLog(@"--本地%@---%@---%@",userstring,session,merchantCode);
            [[NSNotificationCenter defaultCenter] postNotificationName:@"home" object:self];
            
            
            [APServiceTool setTag];
            
            [HLSLable lableWithText:@"登录成功！"];
            if ([[Myuserinfo xyValueForKey:@"fistLogin"] integerValue] == 0) {
                
            [self initwebview];
            }else{
                ChangeMyPSWViewController *cvc = [[ChangeMyPSWViewController alloc]init];
                cvc.type = 1;//1 为第一次登陆
                [self.navigationController pushViewController:cvc animated:YES];
            }
           
        }else{
            [HLSLable lableWithText:[dic xyValueForKey:@"message"]];
        }

    } failure:^(NSError *error) {
        [self.HUD hideAnimated:YES];

    }];
}
-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];

}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    //设置JS
      NSString *strcookie =  [NSString stringWithFormat:@"%@",[HLSPersonalInfoTool getWAPSESSIONID]];
    NSString *inputValueJS = [NSString stringWithFormat:@"setUserInfo('%@','%@')",userstring,strcookie];

    //执行JS
    [webView evaluateJavaScript:inputValueJS completionHandler:^(id _Nullable response, NSError * _Nullable error) {
       
        [self back];
        if (_isgohome == 1) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"gohome" object:self];
            
        }else{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"gotomy" object:self];

        }
        NSLog(@"---返回value: %@ error: %@", response, error);
    }];
}
#pragma mark --EditingChanged
-(void)AccountEditingChanged:(UITextField *)TextField{
    if (TextField.text.length >0 && password.text.length > 0) {
//        [submmit setBackgroundImage:[UIImage imageNamed:@"btn_login"] forState:UIControlStateSelected];

        submmit.selected = YES;
        submmit.userInteractionEnabled = YES;
    }else{
//        [submmit setBackgroundImage:[UIImage imageNamed:@"btn_login_default"] forState:UIControlStateSelected];

        submmit.userInteractionEnabled = NO;

        submmit.selected = NO;
        
    }
    if (TextField.text.length >15) {
        TextField.text = [TextField.text substringToIndex:15];
    }
}
-(void)PasswordEditingChanged:(UITextField *)TextField{
    if (TextField.text.length >0 && account.text.length > 0) {
//        [submmit setBackgroundImage:[UIImage imageNamed:@"btn_login"] forState:UIControlStateSelected];

        submmit.selected = YES;
        submmit.userInteractionEnabled = YES;
    }else{
//        [submmit setBackgroundImage:[UIImage imageNamed:@"btn_login_default"] forState:UIControlStateSelected];

        submmit.userInteractionEnabled = NO;
        submmit.selected = NO;

    }
    if (TextField.text.length >18) {
        TextField.text = [TextField.text substringToIndex:15];
    }
    
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

    NSString *updatedString = [textField.text stringByReplacingCharactersInRange:range withString:string];

    textField.text = updatedString;
    if (textField.text.length >0 && account.text.length > 0) {
        
        submmit.selected = YES;
        submmit.userInteractionEnabled = YES;
    }else{
        
        submmit.userInteractionEnabled = NO;
        submmit.selected = NO;
        
    }
    if (textField.text.length == 0) {
//        submmit.userInteractionEnabled = NO;
//        submmit.selected = NO;
        return YES;
        

        
    }else{
        return NO;

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
