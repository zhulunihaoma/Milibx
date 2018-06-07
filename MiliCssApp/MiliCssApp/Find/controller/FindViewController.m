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

@interface FindViewController ()<FSPageContentViewDelegate,FSSegmentTitleViewDelegate>
{
    NSMutableArray *categoryArr;//标题列表
    CAShapeLayer *shapeLayer;
    UIBezierPath *bezierPath;
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
    categoryArr = [NSMutableArray new];
    [self setsetgement];
   self.navigationView.backimg.size = CGSizeMake(SCREEN_WIDTH, NaviHeight+43);

//    [self drawRect:64];
    
   

}
- (void)drawRect:(int)rect {
    
    [shapeLayer removeFromSuperlayer];
    
    shapeLayer = [CAShapeLayer new];
    shapeLayer.fillColor = MLBGColor.CGColor; //填充颜色
    [self.view.layer addSublayer:shapeLayer];
    
    bezierPath = [UIBezierPath new];
    [bezierPath moveToPoint:CGPointMake(rect, NaviHeight+33+3)];
    [bezierPath addLineToPoint:CGPointMake(rect-10, NaviHeight+40+3)];
    [bezierPath addLineToPoint:CGPointMake(rect+10, NaviHeight+40+3)];
    [bezierPath closePath];//将起点与结束点相连接
    shapeLayer.path = bezierPath.CGPath;
  
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
            categoryArr = [NSMutableArray arrayWithArray:@[@"全部",@"懂产品",@"米粒说",@"米粒说",@"米粒说",@"米粒说",@"米粒说"]];
        }
    }
    
    self.titleView.titlesArr = categoryArr;
    NSMutableArray *childVCs = [[NSMutableArray alloc]init];
    int i = 0;
    
    for (NSString *title in self.titleView.titlesArr) {
        FindMainViewController *vc = [[FindMainViewController alloc]init];
        vc.title = title;
        
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
