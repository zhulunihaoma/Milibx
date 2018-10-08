//
//  MycenterViewController.m
//  MiliCssApp
//
//  Created by MLInsurance_huang on 2018/3/23.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "MycenterViewController.h"
#import "CityBDCenterView.h"
@interface MycenterViewController ()
{
    CityBDCenterView *MycenterView;
}
@end

@implementation MycenterViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationView.hidden = YES;
 
    [self setupSubviews];
    // Do any additional setup after loading the view.
}
-(void)setupSubviews{
    [self MycenterView];
    [self.view addSubview:MycenterView];
    CGFloat tabBarHeight = self.tabBarController.tabBar.frame.size.height;
    int naheight = (int)StatueBarHeight;
    NSInteger tabley;
    tabley = - naheight;

//    if (iPhone5) {
//        tabley = - naheight;
//    }else{
//        tabley = 0;
//    }
    
//    MycenterView.backgroundColor = [UIColor redColor];
    MycenterView.x = 0;
    MycenterView.y = tabley;
    MycenterView.width = SCREEN_WIDTH;
    MycenterView.height = SCREEN_HEIGHT-tabBarHeight;


//    MycenterView.sd_layout
//    .leftSpaceToView(self.view, 0)
//    .rightSpaceToView(self.view, 0)
//    .topSpaceToView(self.view, 0)
//    .bottomSpaceToView(self.view, TabBarHeight);
}
-(UIView *)MycenterView{
    if (!MycenterView) {
        MycenterView = [[CityBDCenterView alloc]init];
    }

    return MycenterView;
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
