//
//  PublicViewController.m
//  板车通
//
//  Created by k1er on 15/3/11.
//  Copyright (c) 2015年 horizon. All rights reserved.
//

#import "PublicViewController.h"
#import "UIImage+GIF.h"

@interface PublicViewController ()

@property (nonatomic,assign) CGFloat titleFontSize;
@end

@implementation PublicViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
   

}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
    [self.HUD hide:YES];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = MLBGColor;
    [self setupNaviView];
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    //    self.HUD.label.text = @"加载中…";
    
   

    

}
-(void)showMLhud{
    self.HUD = [MBProgressHUD showHUDAddedTo:self.view  animated:YES];
    self.HUD.contentColor = [UIColor whiteColor];
    self.HUD.detailsLabel.text = @"正在加载中";
//    self.HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
//    self.HUD.mode = MBProgressHUDModeCustomView;
//    self.HUD.backgroundColor = [UIColor clearColor];
//    UIImageView *logo_gif = [[UIImageView alloc]init];
//    NSString  *filePath = [[NSBundle bundleWithPath:[[NSBundle mainBundle] bundlePath]]pathForResource:@"ml_loading" ofType:@"gif"];
//    NSData  *imageData = [NSData dataWithContentsOfFile:filePath];
//    logo_gif.backgroundColor = [UIColor clearColor];
//    logo_gif.image = [UIImage sd_animatedGIFWithData:imageData];
//
//
//    self.HUD.customView = logo_gif;
//    self.HUD.customView.sd_layout
//    .widthIs(60)
//    .centerXEqualToView(self.HUD.bezelView)
//    .heightIs(60);
}
/**
 *  创建navi
 */
- (void)setupNaviView {
    CustomNavigation *navi = [[CustomNavigation alloc]init];
    navi.width = kSCREENSIZE.width;
    navi.height = NaviHeight;
    [navi.rightBtn addTarget:self action:@selector(clickRightBtn) forControlEvents:UIControlEventTouchUpInside];
    [navi.leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [navi.leftCloseBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.navigationView = navi];
    }
- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    self.navigationView.titleLabel.text = title;
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)close{
    [self.navigationController popToRootViewControllerAnimated:YES];

}

- (void)clickRightBtn {
   
    
}

/**
 * @brief 取消键盘
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}



//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC
{
    
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    for (int i = 0; i < window.subviews.count; i++) {
        
        UIView * view = [window.subviews lastObject];
        UIResponder * responder = [view nextResponder];
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
               
    }
    
    
    
    
    return nil;
}

@end
