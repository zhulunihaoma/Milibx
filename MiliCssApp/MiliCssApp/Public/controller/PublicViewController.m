//
//  PublicViewController.m
//  板车通
//
//  Created by k1er on 15/3/11.
//  Copyright (c) 2015年 horizon. All rights reserved.
//

#import "PublicViewController.h"
#import "HLSSingleTool.h"
#import "YCOutputView.h"
#import "ZHMsgNotifViewController.h"
#import "YD_Search_KMainVC.h"

@interface PublicViewController ()

@property (nonatomic,assign) CGFloat titleFontSize;
@end

@implementation PublicViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    [HLSSingleTool setCurrentVCValue:self];
    HLSLog(@"当前界面===%@",[HLSSingleTool getCurrentVCValue]);

}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
    [self.HUD hide:YES];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = HLSGlobalBG;
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
-(void)setIsMore:(BOOL)isMore{
    _isMore = isMore;
    //自定rightbtn 防止和naviView.rightbtn冲突
    if (_isMore) {
        _moreBtn = [[UIButton alloc]init];
        [self.navigationView addSubview:_moreBtn];
        _moreBtn.frame = CGRectMake(ScreenWidth-40, 32, 20, 20);
        [_moreBtn setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
        [_moreBtn addTarget:self action:@selector(more) forControlEvents:UIControlEventTouchUpInside];
    }

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
-(void)more{
    YCOutputCellModel *cellModel = [[YCOutputCellModel alloc]initWithTitle:@"消息" imageName:@"navixiaoxi"];
    YCOutputCellModel *cellModel2 = [[YCOutputCellModel alloc]initWithTitle:@"首页" imageName:@"navihome"];
    YCOutputCellModel *cellModel3 = [[YCOutputCellModel alloc]initWithTitle:@"搜索" imageName:@"navisearch"];
    
    NSArray *arr = [NSArray arrayWithObjects:cellModel,cellModel2,cellModel3, nil];
    YCOutputView *outPutView =[[YCOutputView alloc]initWithdataArray:arr origin:CGPointMake(ScreenWidth-18 , 64)];
    [outPutView show];
    __weak typeof(self)weakSelf=self;
    
    [outPutView setDidSelectedAtIndexPathBlock:^(NSInteger index) {
        __strong typeof(weakSelf)strongSelf = weakSelf;
        
       NSInteger type = [[NSString stringWithFormat:@"%ld",(long)index] integerValue  ];
        
        switch (type) {
            case 0:
            {
                HomeInfolistViewController *zvc = [[HomeInfolistViewController alloc]init];
                [self.navigationController pushViewController:zvc animated:YES ];
            }
                break;
            case 1:
            {
               
                [self.navigationController popToRootViewControllerAnimated:YES];
                self.tabBarController.selectedIndex = 0;

            }
                break;
            case 2:
            {
                YD_Search_KMainVC *zvc = [[YD_Search_KMainVC alloc]init];
                [self.navigationController pushViewController:zvc animated:YES ];
            }
                break;
                
            default:
                break;
        }
        
    }];

}
@end
