//
//  MLNormalWebViewController.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/31.
//  Copyright © 2018年 zhu. All rights reserved.
//



#import "MLNormalWebViewController.h"
#import <WebKit/WebKit.h>
#import "GotoPayViewController.h"
#import "PosterDetailViewController.h"
#import "LoginViewController.h"
#import <UShareUI/UShareUI.h>
#import "JSONTool.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#import "MLNoDataView.h"
@interface MLNormalWebViewController ()<WKNavigationDelegate, WKUIDelegate,WKScriptMessageHandler,UITextFieldDelegate>
@property (nonatomic,strong) MLNoDataView *noNetView;

@property (nonatomic, strong) WKWebView *wkWebView;
@property (nonatomic, strong) WKWebViewConfiguration *wkConfig;
@property (nonatomic, strong) UITextField *textField;
/*
 *1.添加UIProgressView属性
 */
@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation MLNormalWebViewController

- (WKWebViewConfiguration *)wkConfig {
        if (!_wkConfig) {
            _wkConfig = [[WKWebViewConfiguration alloc] init];
            _wkConfig.allowsInlineMediaPlayback = YES;
            _wkConfig.allowsPictureInPictureMediaPlayback = YES;
        }
        return _wkConfig;
}
    
- (WKWebView *)wkWebView {
        if (!_wkWebView) {
            _wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, NaviHeight, kScreenWidth, SCREEN_HEIGHT - 64) configuration:self.wkConfig];
            _wkWebView.navigationDelegate = self;
            _wkWebView.UIDelegate = self;
            [self.view addSubview:_wkWebView];
        }
        return _wkWebView;
}

    
- (void)viewDidLoad {
        [super viewDidLoad];
        [self.navigationView.leftCloseBtn setHidden:NO];
        [self.navigationView.lineImageView setHidden:YES];

    if ([_TypeStr integerValue] == 1) {
        self.navigationView.rightBtn.hidden = NO;
        [self.navigationView.rightBtn setImage:[UIImage imageNamed:@"enjoy-btn_white"] forState:UIControlStateNormal];
    }
//        [self setupToolView];
    
        /*
         *2.初始化progressView
         */
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, NaviHeight, [[UIScreen mainScreen] bounds].size.width, 2)];
    self.progressView.backgroundColor = MLNaviColor;
        //设置进度条的高度，下面这句代码表示进度条的宽度变为原来的1倍，高度变为原来的1.5倍.
        self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
        [self.view addSubview:self.progressView];
        
        /*
         *3.添加KVO，WKWebView有一个属性estimatedProgress，就是当前网页加载的进度，所以监听这个属性。
         */
        [self.wkWebView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
        [self.wkWebView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
    [[self.wkWebView configuration].userContentController addScriptMessageHandler:self name:@"AppgotoPay"];
    [[self.wkWebView configuration].userContentController addScriptMessageHandler:self name:@"AppgotoShare"];
    [[self.wkWebView configuration].userContentController addScriptMessageHandler:self name:@"AppgotoPosterList"];
    [[self.wkWebView configuration].userContentController addScriptMessageHandler:self name:@"AppgotoLogin"];


        [self startLoad];
    }

- (void)setupToolView {
        UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, kScreenHeight - 40, kScreenWidth, 40)];
        [self.view addSubview:toolBar];
        
        UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(goBackAction)];
        UIBarButtonItem *forwardButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(goForwardAction)];
        UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshAction)];
        
        [toolBar setItems:@[backButton,fixedSpace,forwardButton,fixedSpace,refreshButton] animated:YES];
}
    
#pragma mark - start load web
    
- (void)startLoad {
    if (self.noNetView) {
        [self.noNetView removeFromSuperview];
        self.noNetView = nil;
    }
    NSString *urlString;
        if ([self.AllUrlStr length]>0) {
            urlString = self.AllUrlStr;

        }else{
              urlString = [NSString stringWithFormat:@"%@%@",RequestWebUrl,self.UrlStr];
        }
   
    HLSLog(@"^^^^^^url地址%@",urlString);
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        request.timeoutInterval = 15.0f;
//    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://h5.qzone.qq.com/mqzone/index"]];
    HLSLog(@"---wkrequest：%@",[JSONTool dictionaryToJson:[HLSPersonalInfoTool getCookies]]);
//    [request addValue:[JSONTool dictionaryToJson:[HLSPersonalInfoTool getCookies]] forHTTPHeaderField:@"Cookie"];
    [self.wkWebView loadRequest:request];
    }
    
#pragma mark - 监听
    
    /*
     *4.在监听方法中获取网页加载的进度，并将进度赋给progressView.progress
     */
    
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
        if ([keyPath isEqualToString:@"title"]) {
            if (object == self.wkWebView) {
                self.title = self.wkWebView.title;
            } else {
                [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
            }
        } else if ([keyPath isEqualToString:@"estimatedProgress"]) {
            self.progressView.progress = self.wkWebView.estimatedProgress;
            if (self.progressView.progress == 1) {
                /*
                 *添加一个简单的动画，将progressView的Height变为1.4倍
                 *动画时长0.25s，延时0.3s后开始动画
                 *动画结束后将progressView隐藏
                 */
                __weak typeof (self)weakSelf = self;
                [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                    weakSelf.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.4f);
                } completion:^(BOOL finished) {
                    weakSelf.progressView.hidden = YES;
                    
                }];
            }
        }else{
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
}
    
#pragma mark - WKWKNavigationDelegate Methods
    
    /*
     *5.在WKWebViewd的代理中展示进度条，加载完成后隐藏进度条
     */
    
    //开始加载
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
        NSLog(@"开始加载网页");
        //开始加载网页时展示出progressView
        self.progressView.hidden = NO;
        //开始加载网页的时候将progressView的Height恢复为1.5倍
        self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
        //防止progressView被网页挡住
        [self.view bringSubviewToFront:self.progressView];
    self.progressView.tintColor = MLNaviColor;
        self.textField.text = [NSString stringWithFormat:@"%@",webView.URL];
}
    
    //加载完成
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
        NSLog(@"加载完成");
        //加载完成后隐藏progressView
            self.progressView.hidden = YES;
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:webView.URL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
            NSHTTPURLResponse *tmpresponse = (NSHTTPURLResponse*)response;
        
             NSLog(@"statusCode---:%ld", tmpresponse.statusCode);
        if (tmpresponse.statusCode == 502) {

        }
            }];
    
    [dataTask resume];
  
    
    
}
    
    //加载失败
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
        NSLog(@"加载失败");
        //加载失败同样需要隐藏progressView
        self.progressView.hidden = YES;
//    if (!self.noNetView) {
//        [self setupNoNetView];
//    }
    
    
}
//无网络的时候
- (void)setupNoNetView {
    self.noNetView = [[MLNoDataView alloc]initWithImageName:@"img_Load_1" text:@"" detailText:nil buttonTitle:@"  加载失败，点击页面重试"];
    self.noNetView.y = NaviHeight;
    self.noNetView.width = kSCREENSIZE.width;
    self.noNetView.height = kSCREENSIZE.height - self.noNetView.y - 49;
    [self.noNetView.button addTarget:self action:@selector(startLoad) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.noNetView];

}

    
    //页面跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
        //允许页面跳转
        NSLog(@"%@",navigationAction.request.URL);
    NSURL *url = navigationAction.request.URL;
    NSString *scheme = [url scheme];
    UIApplication *app = [UIApplication sharedApplication];
    WKNavigationActionPolicy actionPolicy = WKNavigationActionPolicyAllow;
    
    if ([scheme isEqualToString:@"tel"]) {
        if ([app canOpenURL:url]) {
            CGFloat version = [[[UIDevice currentDevice]systemVersion]floatValue];
            if (version >= 10.0) {
                /// 大于等于10.0系统使用此openURL方法
                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
            } else {
                [[UIApplication sharedApplication] openURL:url];
            }
        }
    }
    /* 这句话一定要实现 不然会异常 */
    decisionHandler(actionPolicy);
//    decisionHandler(WKNavigationActionPolicyAllow);
}
    
    
#pragma mark - Tool bar item action
    
- (void)back{
    if ([self.wkWebView canGoBack]) {
        [self.wkWebView goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}
    
- (void)goForwardAction {
    if ([self.wkWebView canGoForward]) {
        [self.wkWebView goForward];
    }
}
    
- (void)refreshAction {
    [self.wkWebView reload];
}
    

//点击完成时加载网页
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
        if (textField.text.length) {
            NSString *urlString;
            if ([textField.text containsString:@"http://"] ||
                [textField.text containsString:@"https://"]) {
                urlString = [NSString stringWithFormat:@"%@",textField.text];
            }else {
                urlString = [NSString stringWithFormat:@"http://%@",textField.text];
            }
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
            request.timeoutInterval = 15.0f;
            [self.wkWebView loadRequest:request];
        }
        [self.textField resignFirstResponder];
        return YES;
}


//实现js调用ios的handle委托
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSLog(@"%@",NSStringFromSelector(_cmd));
    NSLog(@"参数参数====%@",message.body);
    
    if ([message.name isEqualToString:@"AppgotoPay"]) {
        NSLog(@"方法名为:%@",message.name);
        [self GoTopay:message.body];
    }
    if ([message.name isEqualToString:@"AppgotoPosterList"]) {
        NSLog(@"方法名为:%@",message.name);
        [self AppgotoPosterList:message.body];
    }
    if ([message.name isEqualToString:@"AppgotoShare"]) {
        NSLog(@"方法名为:%@",message.name);
        [self AppgotoShare:message.body];
    }
    if ([message.name isEqualToString:@"AppgotoLogin"]) {
        NSLog(@"方法名为:%@",message.name);
        [self AppgotoLogin];
    }
    
}

#pragma mark -- js调用原生方法
-(void)GoTopay:(NSString *)OrderId{
    GotoPayViewController *gvc = [[GotoPayViewController alloc]init];
    gvc.OrderId = OrderId;
    [self.navigationController pushViewController:gvc animated:YES];
}
-(void)AppgotoPosterList:(NSString *)productCode{
    PosterDetailViewController *pvc = [[PosterDetailViewController alloc]init];
    pvc.productCode = productCode;
    [self.navigationController pushViewController:pvc animated:YES];
}

-(void)AppgotoLogin{
    LoginViewController *lvc = [[LoginViewController alloc]init];
    [self presentViewController:lvc animated:YES completion:nil];
}
//点击右侧按钮分享新闻
- (void)clickRightBtn {
    
//    [HLSLable lableWithText:@"111分享"];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setValue:_newsmodel.articleTitle forKey:@"Title"];
    [param setValue:@"让保障无处不在" forKey:@"descr"];
    [param setValue:_newsmodel.imgSmallUrl forKey:@"thumImage"];
    [param setValue:[NSString stringWithFormat:@"%@%@",RequestWebUrl,self.UrlStr] forKey:@"webpageUrl"];

    [self Sharehandle:param];

}



-(void)AppgotoShare:(NSMutableDictionary *)ShareInfo{
    HLSLog(@"---点击产品推广分享的信息%@",ShareInfo);
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setValue:[ShareInfo xyValueForKey:@"title"] forKey:@"Title"];
    [param setValue:[ShareInfo xyValueForKey:@"features"] forKey:@"descr"];
    [param setValue:[ShareInfo xyValueForKey:@"image"] forKey:@"thumImage"];
    [param setValue:[ShareInfo xyValueForKey:@"url"] forKey:@"webpageUrl"];
    [self Sharehandle:param];
}
-(void)Sharehandle:(NSMutableDictionary *)ShareInfo{
    [UMSocialUIManager setPreDefinePlatforms:@[@(UMSocialPlatformType_QQ),@(UMSocialPlatformType_WechatSession),@(UMSocialPlatformType_WechatTimeLine)]];
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        // 根据获取的platformType确定所选平台进行下一步操作
        [self shareImageToPlatformType:platformType withDic:ShareInfo];
        
    }];
    
    
}
- (void)shareImageToPlatformType:(UMSocialPlatformType)platformType withDic:(NSMutableDictionary *)ShareInfo
{
    if ([[ShareInfo xyValueForKey:@"Title"] length] == 0) {
        [HLSLable lableWithText:@"缺少分享标题"];
        return;
    }
    if ([[ShareInfo xyValueForKey:@"descr"] length] == 0) {
        [HLSLable lableWithText:@"缺少分享描述"];
        return;
    }
    if ([[ShareInfo xyValueForKey:@"thumImage"] length] == 0) {
        [HLSLable lableWithText:@"缺少分享图片"];
        return;
    }
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:[ShareInfo xyValueForKey:@"Title"] descr:[ShareInfo xyValueForKey:@"descr"] thumImage:[ShareInfo xyValueForKey:@"thumImage"]];
    //设置网页地址
    shareObject.webpageUrl = [ShareInfo xyValueForKey:@"webpageUrl"];
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            NSLog(@"response data is %@",data);
        }
    }];
 
}
/*
 *6.在dealloc中取消监听
 */

- (void)dealloc {
    [self.wkWebView removeObserver:self forKeyPath:@"estimatedProgress"];
    [self.wkWebView removeObserver:self forKeyPath:@"title"];
    
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
