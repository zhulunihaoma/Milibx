//
//  MiliTabbarViewController.m
//  MiliCssApp
//
//  Created by MLInsurance_huang on 2018/3/22.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "MiliTabbarViewController.h"
#import "HomeViewController.h"
#import "ProductViewController.h"
#import "FindViewController.h"
#import "MycenterViewController.h"
#import "LoginViewController.h"
@interface MiliTabbarViewController ()<UITabBarControllerDelegate>

@end

@implementation MiliTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 79)];
    backView.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_home_shadow"]];
    imageView.contentMode = UIViewContentModeScaleToFill;
    imageView.x = 0;
    imageView.y = 0;
    [imageView sizeToFit];
    imageView.height = 1;
    imageView.width = SCREEN_WIDTH;

    [backView addSubview:imageView];
    // 去除顶部横线
    [self.tabBar setClipsToBounds:YES];
    [self.tabBar insertSubview:backView atIndex:0];
    self.tabBar.opaque = YES;
    
    //主页
    HomeViewController *hvc = [[HomeViewController alloc]init];
    
    [self addChildViewController:hvc normalImage:@"tab_down_1_default" selectedImage:@"tab_down_1" title:@"主页"];
    self.delegate = self;
    
//
//    ProductViewController *svc = [[ProductViewController alloc]init];
//
//    [self addChildViewController:svc normalImage:@"un我的" selectedImage:@"我的" title:@"产品列表"];
    
    
    
    FindViewController *fvc = [[FindViewController alloc]init];
    
    [self addChildViewController:fvc normalImage:@"tab_down_2_default" selectedImage:@"tab_down_2" title:@"发现"];
    
    
    MycenterViewController *mvc = [[MycenterViewController alloc]init];
    
    [self addChildViewController:mvc normalImage:@"tab_down_3_default" selectedImage:@"tab_down_3" title:@"我的"];
    HLSLog(@"---tabbar部分的输出%@",[HLSPersonalInfoTool getCookies]);

  
    // Do any additional setup after loading the view.
}

- (void)addChildViewController:(UIViewController *)viewController normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage title:(NSString *)title {
    UIImage *normal = [UIImage imageNamed:normalImage];
    viewController.tabBarItem.image = [normal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    viewController.tabBarItem.image = [UIImage imageNamed:normalImage];
    UIImage *select = [UIImage imageNamed:selectedImage];
    viewController.tabBarItem.selectedImage = [select imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]; // 始终绘制图片原始状态，不使用Tint Color
    
    [viewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:HLSColor(136, 136, 136),NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
    [viewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:MLNaviColor,NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateSelected];
    
    viewController.tabBarItem.title = title;
    [self addChildViewController:viewController];
    
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {

        if ([[viewController class] isSubclassOfClass:[MycenterViewController class]]) {

                if (![HLSPersonalInfoTool getCookies]) {

                    LoginViewController *lvc = [[LoginViewController alloc]init];
                    UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:lvc];
                    nvc.navigationBarHidden = YES;
                    [self.viewControllers[0] presentViewController:nvc animated:YES completion:^{
                    }];
                    return NO;
                }
}

    return YES;
}
//- (BOOL)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(nonnull UIViewController *)viewController {
//    if ([[viewController class] isSubclassOfClass:[MycenterViewController class]]) {
//
//                        if (![HLSPersonalInfoTool getCookies]) {
//
//                            LoginViewController *lvc = [[LoginViewController alloc]init];
//                            lvc.isgohome = 2;
//                            UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:lvc];
//                            nvc.navigationBarHidden = YES;
//                            [self.viewControllers[0] presentViewController:nvc animated:YES completion:^{
//
//                            }];
//                            return NO;
//                        }
//        }
//    return YES;
//}

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
