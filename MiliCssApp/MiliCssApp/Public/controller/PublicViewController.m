//
//  PublicViewController.m
//  板车通
//
//  Created by k1er on 15/3/11.
//  Copyright (c) 2015年 horizon. All rights reserved.
//

#import "PublicViewController.h"

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
    [self.view addSubview:self.navigationView = navi];
    }
- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    self.navigationView.titleLabel.text = title;
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
    
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
