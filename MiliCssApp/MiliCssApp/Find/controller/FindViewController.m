//
//  FindViewController.m
//  MiliCssApp
//
//  Created by MLInsurance_huang on 2018/3/23.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "FindViewController.h"
#import "FSScrollContentView.h"
#import "FindMainViewController.h"
#import "MLFindRequest.h"
@interface FindViewController ()<FSPageContentViewDelegate,FSSegmentTitleViewDelegate>
{
    NSMutableArray *categoryArr;//标题列表
    CAShapeLayer *shapeLayer;
    UIBezierPath *bezierPath;
    NSMutableArray *TittleArr;
    NSMutableArray *DicTittleArr;
}
@property (nonatomic, strong) FSPageContentView *pageContentView;
@property (nonatomic, strong) FSSegmentTitleView *titleView;
@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationView.leftBtn.hidden = YES;
    self.navigationView.lineImageView.hidden = YES;
    self.navigationView.height = NaviHeight+43;
    self.title = @"发现";
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changetab:) name:@"milisay" object:nil];

    categoryArr = [NSMutableArray new];
   self.navigationView.backimg.size = CGSizeMake(SCREEN_WIDTH, NaviHeight+43);

    TittleArr = [NSMutableArray new];
   DicTittleArr = [NSMutableArray new];
    [self RequestData];
    // Do any additional setup after loading the view.
}
-(void)changetab:(NSNotification *)notification{
    
    self.titleView.selectIndex = 2;
    
}
-(void)RequestData{
    //    self.HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    [self showMLhud];
    [MLFindRequest PostcolumnListSuccess:^(NSDictionary *dic) {
    
        HLSLog(@"发现,%@",dic);
        [self.HUD hideAnimated:YES];
        if (self.noNetView) {
            [self.noNetView removeFromSuperview];
            self.noNetView = nil;
        }
        if ([[dic xyValueForKey:@"code"] integerValue] == SuccessCode) {
            
           DicTittleArr =  [[dic xyValueForKey:@"result"] xyValueForKey:@"columnList"];
            
            for (int i = 0; i <DicTittleArr.count; i++) {
                [TittleArr addObject:[DicTittleArr[i] xyValueForKey:@"columnTitle"]];
                
            }

            [self setsetgement];


        }else{
            [HLSLable lableWithText:[dic xyValueForKey:@"message"]];
        }

    } failure:^(NSError *error) {
        [self.HUD hideAnimated:YES];
        [self checkNonet];
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
            categoryArr = [NSMutableArray arrayWithArray:@[@"全部",@"懂产品"]];
        }
    }
    
//    self.titleView.titlesArr = categoryArr;
    self.titleView.titlesArr = TittleArr;

    NSMutableArray *childVCs = [[NSMutableArray alloc]init];
    int i = 0;
    
    for (NSString *title in self.titleView.titlesArr) {
        FindMainViewController *vc = [[FindMainViewController alloc]init];
        vc.title = title;
        vc.columnId = [DicTittleArr[i] xyValueForKey:@"columnId"];//类型传到子界面

        //        [vc.navigationController.navigationBar removeFromSuperview] ;
        //        vc.navigationView.hidden = YES;
        
        i++;
        [childVCs addObject:vc];
    }
    self.pageContentView = [[FSPageContentView alloc]initWithFrame:CGRectMake(0, NaviHeight+50, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 90) childVCs:childVCs parentVC:self delegate:self];
    [self.view addSubview:_pageContentView];
//    if (titlearr.count == 0) {
//        [self showUnNetWorkView];
//        
//    }
    
}
#pragma mark -- 无网络
-(void)checkNonet{
    if (!self.noNetView) {
        [self setupNoNetView];
    }
    
}
//无网络的时候
- (void)setupNoNetView {
    self.noNetView = [[MLNoDataView alloc]initWithImageName:@"img_Load_1" text:@"" detailText:nil buttonTitle:@"  加载失败，点击页面重试"];
    self.noNetView.y = 120;
    self.noNetView.width = kSCREENSIZE.width;
    self.noNetView.height = kSCREENSIZE.height - self.noNetView.y - 49;
    [self.noNetView.button addTarget:self action:@selector(RequestData) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.noNetView];
}


#pragma mark --
- (void)FSSegmentTitleView:(FSSegmentTitleView *)titleView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex
{
    self.pageContentView.contentViewCurrentIndex = endIndex;
    //    self.title = self.titleView.titlesArr[endIndex];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"dismiss" object:nil];
    
//    [self drawRect:60+124*endIndex];


}
- (void)FSContentViewDidScroll:(FSPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex progress:(CGFloat)progress{
    self.titleView.selectIndex = endIndex;
    
    
//    [self drawRect:60+125*endIndex];

    
}
-(void)dealloc{
    
    
    [[NSNotificationCenter defaultCenter]removeObserver:self
                                                   name:@"milisay"
                                                 object:nil];
    
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
