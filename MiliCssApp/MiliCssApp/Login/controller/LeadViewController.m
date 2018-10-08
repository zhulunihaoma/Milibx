//
//  LeadViewController.m
//  Banchetong
//
//  Created by horizon on 15/11/3.
//  Copyright © 2015年 horizon. All rights reserved.
//

#import "LeadViewController.h"
#import "MiliTabbarViewController.h"
#import "LoginViewController.h"
@interface LeadViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIPageControl *pageControl;
@property(nonatomic,strong)UIView *newsView;
@end

@implementation LeadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self createLeadView];
}
-(void)createLeadView{
    NSArray *arr = [NSArray new];
    if (iPhonex){
        arr = [NSArray arrayWithObjects:@"1（11252436）",@"2（11252436）",@"3（11252436）",@"4（11252436）",@"5（11252436）", nil];
    }else if (iPhone4s) {
        arr = [NSArray arrayWithObjects:@"1（320480）",@"2（320480）",@"3（320480）",@"4（320480）",@"5（320480）", nil];

    }else if (iPhone5){

        arr = [NSArray arrayWithObjects:@"1（640960）",@"2（640960）",@"3（640960）",@"4（640960）",@"5（640960）", nil];

    
    }else if (iPhone6){
        arr = [NSArray arrayWithObjects:@"1（7501334）",@"2（7501334）",@"3（7501334）",@"4（7501334）",@"5（7501334）", nil];


        
    }else if (iPhone6plus){
        arr = [NSArray arrayWithObjects:@"1（12422208）",@"2（12422208）",@"3（12422208）",@"4（12422208）",@"5（12422208）", nil];
    }

    
    
    //引导页scrollView
    
        _newsView = [[UIView alloc] init];
        [self.view addSubview:_newsView];
        [_newsView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@0);
            make.height.mas_equalTo(SCREEN_HEIGHT);
            make.width.mas_equalTo(self.view.mas_width);
        }];
        
        UIScrollView *newsScroll = [[UIScrollView alloc] init];
        newsScroll.delegate = self;
        newsScroll.contentSize = CGSizeMake(SCREEN_WIDTH*5, 0);
        newsScroll.pagingEnabled = YES;
        [_newsView addSubview:newsScroll];
    
    newsScroll.showsHorizontalScrollIndicator = NO;
    newsScroll.bounces = NO;
        [newsScroll mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_newsView);
        }];
        
        UIImageView *lastView = nil;
//     NSArray *Colorarr = [[NSArray alloc] initWithObjects:[UIColor blueColor],[UIColor greenColor],[UIColor orangeColor], nil];
        for (int i = 0; i<5; i++) {
            UIImageView *loginImage = [[UIImageView alloc] init];
            loginImage.image = [UIImage imageNamed:arr[i]];
//            loginImage.backgroundColor = Colorarr[i];
            [newsScroll addSubview:loginImage];
            [loginImage mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(newsScroll.mas_top);
                make.height.equalTo(newsScroll.mas_height);
                make.width.equalTo(newsScroll.mas_width);
                if (lastView) {
                    make.left.equalTo(lastView.mas_right);
                }else{
                    make.left.equalTo(newsScroll.mas_left);
                }
            }];
            lastView = loginImage;
        }
        


    
    //添加按钮
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = COLORWithRGB(255, 255, 255, 0);
    [button setImage:[UIImage imageNamed:@"btn_yindao"] forState:UIControlStateNormal];
    [button sizeToFit];
    button.x = 4*SCREEN_WIDTH + (SCREEN_WIDTH - button.width)/2;
    button.y = SCREEN_HEIGHT - 25 - button.height;
//    button.frame = CGRectMake(4*SCREEN_WIDTH, 0,SCREEN_WIDTH,SCREEN_HEIGHT);

    [button addTarget:self action:@selector(GosendCar:) forControlEvents:UIControlEventTouchUpInside];
    [newsScroll addSubview:button];
}
//进入程序界面
-(void)GosendCar:(UIButton *)sender{
    HLSLog(@"---进入程序");
//    MainTabBarViewController *MainView  = [[MainTabBarViewController alloc]init];
//    UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:MainView];
//    nvc.navigationBarHidden = YES;
//    
//    
//    
//    
//    
//    
//    UIWindow *win = [UIApplication sharedApplication].keyWindow;
//    win.rootViewController = nvc;
//
//    [self presentViewController:nvc animated:YES completion:nil];
//    
    
    
    MiliTabbarViewController *MainView  = [[MiliTabbarViewController alloc]init];
    UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:MainView];
    nvc.navigationBarHidden = YES;
    
    UIWindow *win = [UIApplication sharedApplication].keyWindow;
    win.rootViewController = nvc;
//    [UIView animateWithDuration:1 animations:^{
//
//        _newsView.alpha = 0.2;
//       
//    } completion:^(BOOL finished) {
//        MiliTabbarViewController *MainView  = [[MiliTabbarViewController alloc]init];
//        UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:MainView];
//        nvc.navigationBarHidden = YES;
//
//        UIWindow *win = [UIApplication sharedApplication].keyWindow;
//        win.rootViewController = nvc;
//    }];

    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x/SCREEN_WIDTH;
    _pageControl.currentPage = page;
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
