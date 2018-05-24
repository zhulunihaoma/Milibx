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
@interface LoginViewController ()<WKNavigationDelegate,WKUIDelegate>
{
    UITextField *account;
    UITextField *password;
    UIButton *submmit;
    NSString *userstring;
}
@property(nonatomic,strong)WKWebView *webView;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    [self setupviews];
    // Do any additional setup after loading the view.
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
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 400, SCREEN_WIDTH, SCREEN_HEIGHT) configuration:config];
    self.webView.allowsBackForwardNavigationGestures = YES;
    [self.view addSubview:self.webView];
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
    NSString *tempUrl = [NSString stringWithFormat:@"%@/initdata",RequestWebUrl];
    
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:tempUrl] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    [self.webView loadRequest:request];
//
//
//    self.InitDataWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 400, SCREEN_WIDTH,SCREEN_HEIGHT)];
//    self.InitDataWebView.navigationDelegate = self;
//    self.InitDataWebView.backgroundColor = [UIColor redColor];
//    //    [self.view addSubview:_InitDataWebView];
//    // _tempScrollview2.bounces = YES;
//    _InitDataWebView.scrollView.scrollEnabled = NO;
//    [self.view addSubview:self.InitDataWebView];
//    NSString *tempUrl = [NSString stringWithFormat:@"%@/initdata",RequestWebUrl];
//
//    [_InitDataWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:tempUrl]]];
 

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
    .topSpaceToView(self.view, NaviHeight+10)
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
    [MLloginRequest PostLoginWithloginName:account.text WithPassword:[MD5Tool md5:password.text] token:nil Success:^(NSDictionary *dic) {
        HLSLog(@"aa:%@",dic);
//        [self back];
        NSMutableDictionary *userdic = [dic xyValueForKey:@"result"];
        DEF_PERSISTENT_SET_OBJECT(userdic, @"userinfo");
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
    NSString *inputValueJS = [NSString stringWithFormat:@"setUserInfo('%@')",userstring];

    //执行JS
    [webView evaluateJavaScript:inputValueJS completionHandler:^(id _Nullable response, NSError * _Nullable error) {
        NSLog(@"value: %@ error: %@", response, error);
    }];
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
