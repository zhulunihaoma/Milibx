//
//  ProductViewController.m
//  MiliCssApp
//
//  Created by MLInsurance_huang on 2018/3/23.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "ProductViewController.h"
#import "JSONTool.h"
#import <WebKit/WebKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
@interface ProductViewController ()<WKNavigationDelegate,WKScriptMessageHandler>
@property(nonatomic,strong)WKWebView *webView;

@end

@implementation ProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationView.leftBtn.hidden = YES;
    self.title = @"产品列表";
    
    NSString *sesionstr = [HLSPersonalInfoTool getWAPSESSIONID];
    HLSLog(@"--%@",sesionstr);
//    NSString *cookiestr = [NSString stringWithFormat:@"document.cookie ='WAPSESSIONID=%@';",sesionstr];
    
//     NSString *cookiestr = [NSString stringWithFormat:@"document.cookie ='WAPSESSIONID=%@';'domain=.milibx.com';'path=/';",sesionstr];
    
    
    
    
//    WKUserContentController* userContentController = WKUserContentController.new;
//    WKUserScript * cookieScript = [[WKUserScript alloc] initWithSource: cookiestr injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:NO];
    
//    [userContentController addUserScript:cookieScript];
//    WKWebViewConfiguration * config = [[WKWebViewConfiguration alloc] init];
//    config.userContentController = userContentController;
    //    WKCookiesManager * cookieManager = [WKCookiesManager shareCookies];
    //    config.processPool = cookieManager.processPool;
//    WKPreferences * prefer = [[WKPreferences alloc] init];
//    prefer.javaScriptEnabled = YES;
//    prefer.javaScriptCanOpenWindowsAutomatically = YES;
//    config.preferences = prefer;
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.webView.allowsBackForwardNavigationGestures = YES;
    [self.view addSubview:self.webView];
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
//    NSString *tempUrl = [NSString stringWithFormat:@"%@/opena/list",@"css.milibx.com"];
    
        NSString *tempUrl = @"css.milibx.com/user/login";

    
    
    
    
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:tempUrl] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
//    NSString *strcookie =  [JSONTool dictionaryToJson:[HLSPersonalInfoTool getCookies]];
//    [request addValue:[JSONTool dictionaryToJson:[HLSPersonalInfoTool getCookies]] forHTTPHeaderField:@"Cookie"];

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
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    
    
    NSString *urlString = [[request URL]  absoluteString];
    
    NSLog(@"==> %@",urlString);
    
    
    
    NSMutableURLRequest *mutableRequest = [request mutableCopy];
    
    NSDictionary *requestHeaders = request.allHTTPHeaderFields;
    
    
    
    // 判断请求头是否已包含，如果不判断该字段会导致webview加载时死循环
    
    if (requestHeaders[@"Cookie"]) {
        
        return YES;
        
    } else {
        
        
        [mutableRequest setValue:@"ios" forHTTPHeaderField:@"Cookie"];
        
        
        
        request = [mutableRequest copy];
        
        [webView loadRequest:request];
        
        
        
        return NO;
        
    }
    
    return YES;
    
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
