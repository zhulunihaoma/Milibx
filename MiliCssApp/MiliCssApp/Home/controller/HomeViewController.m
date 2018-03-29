//
//  HomeViewController.m
//  MiliCssApp
//
//  Created by Milizhu on 2018/3/23.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "HomeViewController.h"
#import "MiliCssApp-Bridging-Header.h"
#import "MiliTabbarViewController.h"
#import <SDCycleScrollView.h>"
@interface HomeViewController ()<SDCycleScrollViewDelegate>
{
    SDCycleScrollView *BannerView;
    
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationView.leftBtn.hidden = YES;
    self.title = @"首页";
    [self initView];
    // Do any additional setup after loading the view.
}
//初始化界面
-(void)initView{
    BannerView = [[SDCycleScrollView alloc]init];
    BannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64,SCREEN_WIDTH,SCREEN_WIDTH*9.0/16) delegate:self placeholderImage:[UIImage imageNamed:@""]];
    BannerView.pageControlAliment =  SDCycleScrollViewPageContolAlimentCenter;
    BannerView.imageURLStringsGroup = @[
                                                  @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488778259390&di=5fad64ae38d46c6bb2d47032a37a20a2&imgtype=0&src=http%3A%2F%2Fzx123cn.img-cn-hangzhou.aliyuncs.com%2Fuploadfile%2F2016%2F0905%2F20160905152053_62461.jpg",
                                                  @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488778259388&di=bc10a126d396402565395c63baf27196&imgtype=0&src=http%3A%2F%2Fpic.qiantucdn.com%2F58pic%2F17%2F89%2F07%2F55a5c86a77176_1024.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488778259386&di=a3ac242a1ccf2276dad35ccb286cc8ed&imgtype=0&src=http%3A%2F%2Fwww.sc.cc%2FPublic%2FUploads%2F55139112c813a.jpg",
                                                  @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488778259383&di=c5ccc270675a567e1d70c52886b95f24&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F16%2F50%2F51%2F50Y58PICp4P_1024.jpg"];
   
    
    [self.view addSubview:BannerView];
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
