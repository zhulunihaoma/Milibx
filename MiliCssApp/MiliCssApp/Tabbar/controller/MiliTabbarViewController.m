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
    //主页
    HomeViewController *hvc = [[HomeViewController alloc]init];
    
    [self addChildViewController:hvc normalImage:@"un主页" selectedImage:@"主页" title:@"主页"];
    self.delegate = self;
    
//
//    ProductViewController *svc = [[ProductViewController alloc]init];
//
//    [self addChildViewController:svc normalImage:@"un我的" selectedImage:@"我的" title:@"产品列表"];
    
    
    
    FindViewController *fvc = [[FindViewController alloc]init];
    
    [self addChildViewController:fvc normalImage:@"un我的" selectedImage:@"我的" title:@"发现"];
    
    
    MycenterViewController *mvc = [[MycenterViewController alloc]init];
    
    [self addChildViewController:mvc normalImage:@"un我的" selectedImage:@"我的" title:@"我的"];
    
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
        //        if (![[viewController class] isSubclassOfClass:[HLSSendCarViewController class]]) {
        
        HLSLog(@"111:%@",TOKEN);
        
        // 判断用户是否登陆
        if (![HLSPersonalInfoTool getWAPSESSIONID]) {
            
            LoginViewController *lvc = [[LoginViewController alloc]init];
            UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:lvc];
            nvc.navigationBarHidden = YES;
            [self.viewControllers[0] presentViewController:nvc animated:YES completion:^{
                self.tabBarController.selectedIndex = 0;
            }];
            return NO;
        }
        
        
        //        }
        
        
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
