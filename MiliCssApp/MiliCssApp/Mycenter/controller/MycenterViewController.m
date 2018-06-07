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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationView.hidden = YES;

 
    [self setupSubviews];
    // Do any additional setup after loading the view.
}
-(void)setupSubviews{
    [self MycenterView];
    [self.view addSubview:MycenterView];
    MycenterView.sd_layout
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .topSpaceToView(self.view, -StatueBarHeight)
    .bottomSpaceToView(self.view, TabBarHeight);
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
