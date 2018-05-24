//
//  AchievementViewController.m
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/28.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "AchievementViewController.h"
@interface AchievementViewController ()<UIWebViewDelegate>
{
    UIWebView *mywebview;
}
@property(nonatomic,strong)JSContext *jsContext;

@end

@implementation AchievementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"业绩中心";
    [self setupWeb];
    // Do any additional setup after loading the view.
}
-(void)setupWeb{
    mywebview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    [self.view addSubview:mywebview];

    
    mywebview.delegate = self;
    NSURL *url = [NSURL URLWithString:@"www.sina.com"];
   
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url];
    [mywebview loadRequest: request];

}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    //    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    //获取当前加载完成网页的上下文环境
    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    [webView stringByEvaluatingJavaScriptFromString:@"showloading('hhh')"];
//    //将设置的标识符注入 由控制器接收
//    self.jsContext[@"jump"] = self;
//    self.jsContext[@"cookie"] = self;
//    //异常处理
//    self.jsContext.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
//        context.exception = exceptionValue;
//        NSLog(@"异常信息：%@", exceptionValue);
//    };
    
    return YES;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    //获取当前加载完成网页的上下文环境
    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
//    self.jsContext[@"jsbridge"] = [[AchievementViewController alloc]init];
    
    self.jsContext[@"jsbridge"] = self;

//    [webView stringByEvaluatingJavaScriptFromString:@"showloading('hhh')"];
    
    self.jsContext[@"share"] = ^() {
        NSLog(@"+++++++Begin Log+++++++");
        NSArray *args = [JSContext currentArguments];
        
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"方式二" message:@"这是OC原生的弹出窗" delegate:self cancelButtonTitle:@"收到" otherButtonTitles:nil];
//        [alertView show];
        
//        return "11111";
        for (JSValue *jsVal in args) {
            NSLog(@"%@", jsVal.toString);
        }
        
        NSLog(@"-------End Log-------");
    };
    
    
}
#pragma -mark js事件接收
-(void)jumpActivity:(NSString *)methodName :(NSString *)policyId :(NSString *)proid :(NSString *)comid :(NSString *)proname :(NSString *)comname{
    
    //    ProductCommentModel *infoEntity = [[ProductCommentModel alloc]init];
    //    infoEntity.methodName = methodName;
    //    infoEntity.ID = policyId;
    //    infoEntity.proid = proid;
    //    infoEntity.comid = comid;
    //    infoEntity.proname = proname;
    //    infoEntity.comname = comname;
    //    MLProductCommentVC *commentVC = [[MLProductCommentVC alloc]init];
    //    commentVC.commentInfo = infoEntity;
    //    [self.navigationController pushViewController:commentVC animated:YES];
}

-(NSString *)getCookie{
//    [self.delegate getCookie];
    NSLog(@"-------哈哈 Log-------");

    return @"123321";
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
