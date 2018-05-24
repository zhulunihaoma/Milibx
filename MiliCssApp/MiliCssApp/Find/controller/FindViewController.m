//
//  FindViewController.m
//  MiliCssApp
//
//  Created by MLInsurance_huang on 2018/3/23.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "FindViewController.h"

@interface FindViewController ()<WKNavigationDelegate,WKScriptMessageHandler>
@property(nonatomic,strong)WKWebView *detailWebView;

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationView.leftBtn.hidden = YES;
    self.title = @"发现";
    
    
    // 设置偏好设置
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    // 默认为0
//    config.preferences.minimumFontSize = 10;
    //是否支持JavaScript
    config.preferences.javaScriptEnabled = YES;
    //不通过用户交互，是否可以打开窗口
    config.preferences.javaScriptCanOpenWindowsAutomatically = YES;
    
    self.detailWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH,SCREEN_HEIGHT)];
    self.detailWebView.navigationDelegate = self;
    //    [self.view addSubview:_detailWebView];
    // _tempScrollview2.bounces = YES;
    _detailWebView.scrollView.scrollEnabled = NO;
    [self.view addSubview:self.detailWebView];
    NSString *tempUrl = @"http://127.0.0.1:8020/%E5%90%90%E6%A7%BD%E5%A4%A7%E4%BC%9A%E7%AE%A1%E7%90%86%E5%8F%B0/add.html?__hbt=1526968117736";//[self generateUrlWithSystemParam:self.linkUrl];
    
    [_detailWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:tempUrl]]];
    
    WKUserContentController *userCC = config.userContentController;
    //JS调用OC 添加处理脚本
    [userCC addScriptMessageHandler:self name:@"showMobile"];
    [userCC addScriptMessageHandler:self name:@"showName"];
    [userCC addScriptMessageHandler:self name:@"showSendMsg"];
    _detailWebView.UIDelegate = self;
    _detailWebView.navigationDelegate =self;

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
//-(void)removeAllScriptMsgHandle{
//    WKUserContentController *controller = self.detailWebView.configuration.userContentController;
//    [controller removeScriptMessageHandlerForName:@"showMobile"];
//    [controller removeScriptMessageHandlerForName:@"showName"];
//    [controller removeScriptMessageHandlerForName:@"showSendMsg"];
//}
#pragma mark - WKScriptMessageHandler

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSLog(@"%@",NSStringFromSelector(_cmd));
    NSLog(@"----%@",message.body);
    
    if ([message.name isEqualToString:@"showMobile"]) {
        [self showMsg:@"没有参数"];
    }
    
    if ([message.name isEqualToString:@"showName"]) {
        NSString *info = [NSString stringWithFormat:@"%@",message.body];
        [self showMsg:info];
    }
    
    if ([message.name isEqualToString:@"showSendMsg"]) {
        NSArray *array = message.body;
        NSString *info = [NSString stringWithFormat:@"有两个参数: %@, %@ !!",array.firstObject,array.lastObject];
        [self showMsg:info];
    }
}

-(void)showMsg:(NSString *)info{
    NSLog(@"111",info);
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
