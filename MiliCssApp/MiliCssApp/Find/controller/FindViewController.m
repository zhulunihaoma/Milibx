//
//  FindViewController.m
//  MiliCssApp
//
//  Created by MLInsurance_huang on 2018/3/23.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "FindViewController.h"
#import "JSONTool.h"
#import <WebKit/WebKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
@interface FindViewController ()<WKNavigationDelegate,WKScriptMessageHandler,WKUIDelegate>
@property(nonatomic,strong)WKWebView *webView;

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationView.leftBtn.hidden = YES;
    self.title = @"产品列表";
    
    NSString *sesionstr = [HLSPersonalInfoTool getWAPSESSIONID];
    HLSLog(@"--%@",sesionstr);
    //    NSString *cookiestr = [NSString stringWithFormat:@"document.cookie ='WAPSESSIONID=%@';",sesionstr];
    
    NSString *cookiestr = [NSString stringWithFormat:@"document.cookie ='WAPSESSIONID=%@;domain=.milibx.com;path=/';",sesionstr];
    //    NSString *sesionstr = [HLSPersonalInfoTool getWAPSESSIONID];
    //    NSString *cookiestr = [NSString stringWithFormat:@"document.cookie ='WAPSESSIONID=%@';",sesionstr];
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
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.webView.allowsBackForwardNavigationGestures = YES;
    [self.view addSubview:self.webView];
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
    NSString *tempUrl = [NSString stringWithFormat:@"%@webapp/opena/list",RequestWebUrl];
    
    
    
    
    
    
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:tempUrl] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    NSString *strcookie =  [NSString stringWithFormat:@"WAPSESSIONID=%@",[HLSPersonalInfoTool getWAPSESSIONID]];
    [request addValue:strcookie forHTTPHeaderField:@"Cookie"];
    //    [request addValue:cookieValue forHTTPHeaderField:@"Cookie"];
    
    [self.webView loadRequest:request];
    
    // Do any additional setup after loading the view.
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    //设置JS
    NSString *inputValueJS = @"backsys()";
    //执行JS
    [webView evaluateJavaScript:inputValueJS completionHandler:^(id _Nullable response, NSError * _Nullable error) {
        NSLog(@"value: %@ error: %@", response, error);
    }];
}
- (void)loadRequestWithUrlString:(NSString *)urlString {
    
    // 在此处获取返回的cookie
    NSMutableDictionary *cookieDic = [NSMutableDictionary dictionary];
    
    NSMutableString *cookieValue = [NSMutableString stringWithFormat:@""];
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    
    for (NSHTTPCookie *cookie in [cookieJar cookies]) {
        [cookieDic setObject:cookie.value forKey:cookie.name];
    }
    
    // cookie重复，先放到字典进行去重，再进行拼接
    for (NSString *key in cookieDic) {
        NSString *appendString = [NSString stringWithFormat:@"%@=%@;", key, [cookieDic valueForKey:key]];
        [cookieValue appendString:appendString];
    }
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [request addValue:cookieValue forHTTPHeaderField:@"Cookie"];
    
    [self.webView loadRequest:request];
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
