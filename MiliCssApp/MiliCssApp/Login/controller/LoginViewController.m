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

@interface LoginViewController ()<WKNavigationDelegate,WKUIDelegate>
{
    UITextField *account;
    UITextField *password;
    UIButton *submmit;
    NSString *userstring;
    CALayer *player;
    UITextField *selectField;
}
@property(nonatomic,strong)WKWebView *webView;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    self.navigationView.backgroundColor = [UIColor whiteColor];
    [self setupviews];
    self.navigationView.lineImageView.hidden = YES;
    self.navigationView.backimg.hidden = YES;
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
    NSString *sesionstr = [HLSPersonalInfoTool getWAPSESSIONID];
    NSString *cookiestr = [NSString stringWithFormat:@"document.cookie ='WAPSESSIONID=%@';",sesionstr];
    WKUserContentController* userContentController = WKUserContentController.new;
    WKUserScript * cookieScript = [[WKUserScript alloc] initWithSource: cookiestr injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:NO];
    
    [userContentController addUserScript:cookieScript];
    WKWebViewConfiguration * config = [[WKWebViewConfiguration alloc] init];
    config.userContentController = userContentController;
    //    WKCookiesManager * cookieManager = [WKCookiesManager shareCookies];
    //    config.processPool = cookieManager.processPool;
    WKPreferences * prefer = [[WKPreferences alloc] init];
    prefer.javaScriptEnabled = YES;
    prefer.javaScriptCanOpenWindowsAutomatically = YES;
    config.preferences = prefer;
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 500, SCREEN_WIDTH, 100) configuration:config];
    self.webView.allowsBackForwardNavigationGestures = YES;
    [self.view addSubview:self.webView];
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
    NSString *tempUrl = [NSString stringWithFormat:@"%@webapp/initdata",RequestWebUrl];
    
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:tempUrl] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    [self.webView loadRequest:request];

 

}



-(void)setupviews{
//    gif动图

    UIImageView *logo_gif = [[UIImageView alloc]init];
    
    NSString  *filePath = [[NSBundle bundleWithPath:[[NSBundle mainBundle] bundlePath]]pathForResource:@"login" ofType:@"gif"];
    NSData  *imageData = [NSData dataWithContentsOfFile:filePath];
    logo_gif.backgroundColor = [UIColor clearColor];
    logo_gif.image = [UIImage sd_animatedGIFWithData:imageData];
    
  
    
    
    
    [self.view addSubview:logo_gif];
    player = logo_gif.layer;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.4 * NSEC_PER_SEC)),dispatch_get_main_queue(), ^{
        
        [self pauseLayer:player];
        
    });
    logo_gif.sd_layout
    .heightIs(22)
    .widthIs(26)
    .topSpaceToView(self.view, NaviHeight+63)
    .leftSpaceToView(self.view, 30);
//    标题
    UILabel *title = [HLSLable LabelWithFont:24 WithTextalignment:NSTextAlignmentLeft WithTextColor:HLSOneColor(17) WithFatherView:self.view];
    title.text = @"欢迎来到米粒保险";
   
    title.sd_layout
    .centerYEqualToView(logo_gif)
    .leftSpaceToView(logo_gif, 15)
    .heightIs(24);
    [title setSingleLineAutoResizeWithMaxWidth:(500)];
//    _title = title;
    
    
    
//    用户名
    account = [[UITextField alloc]init];
    account.placeholder = @"请输入用户名";
//    account.layer.borderColor = MLNaviColor.CGColor;
//    account.layer.borderWidth = 1;
    account.clearButtonMode= YES;
    [self.view addSubview:account];
    account.x = 32;
    account.y = NaviHeight +146;
    account.width = SCREEN_WIDTH - 64;
    account.height = 50;
    [self setBorderWithView:account top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];
    [account addTarget:self action:@selector(AccountEditingChanged:) forControlEvents:UIControlEventEditingChanged];



    //    用户名
    password = [[UITextField alloc]init];
    password.placeholder = @"请输入密码";
    [self.view addSubview:password];
    
    password.x = 32;
    password.y = account.bottom+13;
    password.width = SCREEN_WIDTH - 64;
    password.height = 50;
    password.secureTextEntry = YES;
    [self setBorderWithView:password top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];
    [password addTarget:self action:@selector(PasswordEditingChanged:) forControlEvents:UIControlEventEditingChanged];

    UIButton *passwordicon = [[UIButton alloc]init];
    
    passwordicon.backgroundColor = [UIColor clearColor];
    [passwordicon setImage:[UIImage imageNamed:@"button_login_password_nodisplayt"] forState:UIControlStateNormal];
    [passwordicon setImage:[UIImage imageNamed:@"button_login_password_displayt"] forState:UIControlStateSelected];

    passwordicon.size = CGSizeMake(22, 22);
    passwordicon.x = password.width - 25;
    passwordicon.centerY = password.height/2;
    [passwordicon addTarget:self action:@selector(changestatte:) forControlEvents:UIControlEventTouchUpInside];

    [password addSubview:passwordicon];

    
    
    
    

    
    submmit = [[UIButton alloc]init];
    submmit.backgroundColor = MLNaviColor;
    [submmit setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:submmit];
    [submmit addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submmit];
    submmit.x = 32;
    submmit.y = password.bottom+60;
    submmit.width = SCREEN_WIDTH - 64;
    submmit.height = 50;
    submmit.layer.cornerRadius = 6;
    submmit.titleLabel.font = TextFontSize(17);
    [password addTarget:self action:@selector(EditingDidBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [account addTarget:self action:@selector(EditingDidBegin:) forControlEvents:UIControlEventEditingDidBegin];

//    忘记密码
    //    标题
    UILabel *forgetps = [HLSLable LabelWithFont:14 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLNaviColor WithFatherView:self.view];
    forgetps.text = @"忘记密码";
    //    跳转忘记密码
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(forgetps)];
    [forgetps addGestureRecognizer:tap];
    forgetps.userInteractionEnabled = YES;
    forgetps.sd_layout
    .topSpaceToView(self.view, NaviHeight+265)
    .rightSpaceToView(self.view, 34)
    .heightIs(24);
    [forgetps setSingleLineAutoResizeWithMaxWidth:(100)];
    
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
        password.secureTextEntry = NO;
    }else{
        password.secureTextEntry = YES;

    }
}
-(void)forgetps{
    CheckIdViewController *cvc = [[CheckIdViewController alloc]init];
    
    [self.navigationController pushViewController:cvc animated:YES];
}
-(void)login{
    [MLloginRequest PostLoginWithloginName:account.text WithPassword:[MD5Tool md5:password.text] token:nil Success:^(NSDictionary *dic) {
        HLSLog(@"aa:%@",dic);
//        [self back];
        NSMutableDictionary *userdic = [dic xyValueForKey:@"result"];
        DEF_PERSISTENT_SET_OBJECT(userdic, KUserInfoDic);
        userstring = [JSONTool dictionaryToJson:[HLSPersonalInfoTool getUserinfo]];
        HLSLog(@"--本地%@",userstring);
        [self initwebview];

        [HLSLable lableWithText:@"登录成功！"];
    } failure:^(NSError *error) {

    }];
}
-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    //设置JS
//      NSString *strcookie =  [NSString stringWithFormat:@"WAPSESSIONID=%@",[HLSPersonalInfoTool getWAPSESSIONID]];
    NSString *inputValueJS = [NSString stringWithFormat:@"setUserInfo('%@','%@')",userstring,[HLSPersonalInfoTool getWAPSESSIONID]];

    //执行JS
    [webView evaluateJavaScript:inputValueJS completionHandler:^(id _Nullable response, NSError * _Nullable error) {
        [self back];

        NSLog(@"value: %@ error: %@", response, error);
    }];
}
#pragma mark --EditingChanged
-(void)AccountEditingChanged:(UITextField *)TextField{
    if (TextField.text.length >15) {
        TextField.text = [TextField.text substringToIndex:15];
    }
}
-(void)PasswordEditingChanged:(UITextField *)TextField{
    
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
