//
//  UserInfoViewController.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/31.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "UserInfoViewController.h"
#import "UserInfoMainViewController.h"
#import "FSScrollContentView.h"
#import "ProductPromoteInfoViewController.h"
#import "BDInfoViewController.h"
#import "MLMyRequest.h"
@interface UserInfoViewController ()
<FSPageContentViewDelegate,FSSegmentTitleViewDelegate>
{
    NSMutableArray *categoryArr;//标题列表
    CAShapeLayer *shapeLayer;
    UIBezierPath *bezierPath;
    NSMutableDictionary *UserinfoDic;
}
@property (nonatomic, strong) FSPageContentView *pageContentView;
@property (nonatomic, strong) FSSegmentTitleView *titleView;
@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationView.leftBtn.hidden = YES;
    self.navigationView.lineImageView.hidden = YES;
    self.navigationView.height = NaviHeight+43;
    self.title = @"我的资料";
    categoryArr = [NSMutableArray new];
    UserinfoDic = [NSMutableDictionary new];
//    [self setsetgement];
    self.navigationView.backimg.size = CGSizeMake(SCREEN_WIDTH, NaviHeight+43);
    HLSLog(@"----merchantLevel--%@",[HLSPersonalInfoTool merchantLevel]);

    [self RequestData];
    // Do any additional setup after loading the view.
}
-(void)RequestData{
    //    self.HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    [self showMLhud];
    [MLMyRequest PostgetMerchantInfoWithcustomerCode:[HLSPersonalInfoTool getmerchantCode] Success:^(NSDictionary *dic) {
   
        
//        HLSLog(@"我的资料,%@",dic);
        
        [self.HUD hideAnimated:YES];
        
        if ([[dic xyValueForKey:@"code"] integerValue] == SuccessCode) {
            
            UserinfoDic = [dic xyValueForKey:@"result"];
            
            [self setsetgement];
            
            
        }else{
            [HLSLable lableWithText:[dic xyValueForKey:@"message"]];
        }
        
    } failure:^(NSError *error) {
        [self.HUD hideAnimated:YES];
//        [self checkNonet];
    }];
}


-(void)setsetgement{
    if (self.titleView) {
        [self.titleView removeFromSuperview];
        self.titleView = nil;
    }
    self.titleView = [[FSSegmentTitleView alloc]initWithFrame:CGRectMake(0, NaviHeight, CGRectGetWidth(self.view.bounds), 43) delegate:self indicatorType:FSIndicatorTypeDefault];
    self.titleView.titleFont = TextFontSize(15);
    self.titleView.titleNormalColor = COLORWithRGB(255, 255, 255, .7);
    self.titleView.titleSelectColor = [UIColor whiteColor];
    self.titleView.indicatorColor = [UIColor whiteColor];
    self.titleView.indicatorExtension = 0;
    //    self.titleView.backgroundColor = [UIColor redColor];
    
    self.titleView.itemMargin = 34;
    [self.navigationView addSubview:_titleView];
    [self.navigationView bringSubviewToFront:self.titleView];
    
    if ([categoryArr count]==0) {
        categoryArr = [NSMutableArray arrayWithArray:DEF_PERSISTENT_GET_OBJECT(@"LastTitle")];
        if ([categoryArr count]==0) {
            categoryArr = [NSMutableArray arrayWithArray:@[@"基本信息",@"产品推广信息"]];
        }
    }
    
    self.titleView.titlesArr = categoryArr;
    NSMutableArray *childVCs = [[NSMutableArray alloc]init];
    
        UserInfoMainViewController *vc = [[UserInfoMainViewController alloc]init];
        vc.title = categoryArr[0];
        
        //        [vc.navigationController.navigationBar removeFromSuperview] ;
        //        vc.navigationView.hidden = YES;
    vc.UserinfoDic = UserinfoDic;
        [childVCs addObject:vc];
    
    BDInfoViewController *pvc = [[BDInfoViewController alloc]init];
    pvc.title = categoryArr[1];
    pvc.UserinfoDic = UserinfoDic;

    //        [vc.navigationController.navigationBar removeFromSuperview] ;
    //        vc.navigationView.hidden = YES;
    
    [childVCs addObject:pvc];
    
    
    
    
    
    self.pageContentView = [[FSPageContentView alloc]initWithFrame:CGRectMake(0, NaviHeight+50, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 90) childVCs:childVCs parentVC:self delegate:self];
    [self.view addSubview:_pageContentView];
    //    if (titlearr.count == 0) {
    //        [self showUnNetWorkView];
    //
    //    }
    
}
#pragma mark --
- (void)FSSegmentTitleView:(FSSegmentTitleView *)titleView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex
{
    self.pageContentView.contentViewCurrentIndex = endIndex;
    //    self.title = self.titleView.titlesArr[endIndex];
    
   
    
}
- (void)FSContentViewDidScroll:(FSPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex progress:(CGFloat)progress{
    self.titleView.selectIndex = endIndex;
    
   
    
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
