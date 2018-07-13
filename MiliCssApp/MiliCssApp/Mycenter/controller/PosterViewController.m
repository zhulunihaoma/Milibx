//
//  PosterViewController.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/6/4.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "PosterViewController.h"
#import "PosterListTableViewCell.h"
#import "PosterDetailViewController.h"
#import "PosterHeader.h"
#import "MLMyRequest.h"
@interface PosterViewController ()
<UICollectionViewDelegate,UICollectionViewDataSource>{
    UICollectionView *maincollectionView;
    NSMutableArray *dataArr;
    UIScrollView *ToolsScrollView;
}
@end

@implementation PosterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"海报";
    dataArr = [NSMutableArray new];
    [self setupSubViews];
    [self RequestData];
    // Do any additional setup after loading the view.
}
-(void)RequestData{
    [self showMLhud];
    
    [MLMyRequest PostposterListWithproductCode:nil merchantCode:[HLSPersonalInfoTool getmerchantCode] pageIndex:nil pageSize:nil Success:^(NSDictionary *dic) {
        [self.HUD hideAnimated:YES];
        HLSLog(@"---海报:%@",dic);
        if ([[dic xyValueForKey:@"code"] integerValue] == SuccessCode) {
//            [dataArr removeAllObjects];
            dataArr = [[dic xyValueForKey:@"result"] xyValueForKey:@"productList"];
//                [dataArr removeAllObjects];

            [self.tableView reloadData];
            if (dataArr.count == 0) {
                if (!self.noDataView) {
                    [self setupNoDataView];
                }
                
            }else {
                if (self.noDataView) {
                    [self.noDataView removeFromSuperview];
                    self.noDataView = nil;
                }
                
            }
            if (self.noNetView) {
                [self.noNetView removeFromSuperview];
                self.noNetView = nil;
            }
            [self.tableView.mj_header endRefreshing];
            
            

            

        }else{
            [HLSLable lableWithText:[dic xyValueForKey:@"message"]];
        }
    } failure:^(NSError *error) {
        [self.HUD hideAnimated:YES];
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        [self checkNonet];

    }];
    
}
//创建tableView
-(void)setupSubViews{
    [self setupTableViewWithStyle:UITableViewStyleGrouped];
    
    self.tableView.x = 0;
    self.tableView.y = NaviHeight;
    self.tableView.width = SCREEN_WIDTH;
    CGFloat tabBarHeight = self.tabBarController.tabBar.frame.size.height;
    int naheight = (int)NaviHeight;
    self.tableView.height = SCREEN_HEIGHT-naheight;
    [self.tableView registerClass:[PosterListTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self setupHeaderRefresh];
    
    
    
}
/**
 *  下拉刷新
 */
- (void)headerRefresh {
    [self RequestData];
}

#pragma mark -- 无网络
-(void)checkNonet{
    if (dataArr.count == 0) {//如果为第一页

    if (!self.noNetView) {
        [self setupNoNetView];
    }
    
}
    
}
/**
 *  无数据View
 */
-(void)setupNoDataView{
    
    self.noDataView = [[MLNoDataView alloc]initWithImageName:@"img_Load_3" text:@"海报陆续上架中，敬请期待" detailText:nil buttonTitle:nil];
    self.noDataView.y = NaviHeight;
    self.noDataView.width = SCREEN_WIDTH;
    self.noDataView.height = SCREEN_HEIGHT - 64;
    [self.view addSubview:self.noDataView];
    
    
}
//无网络的时候
- (void)setupNoNetView {
    self.noNetView = [[MLNoDataView alloc]initWithImageName:@"img_Load_1" text:@"" detailText:nil buttonTitle:@"  加载失败，点击页面重试"];
    self.noNetView.y = NaviHeight;
    self.noNetView.width = kSCREENSIZE.width;
    self.noNetView.height = kSCREENSIZE.height - self.noNetView.y - 49;
    [self.noNetView.button addTarget:self action:@selector(RequestData) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.noNetView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return dataArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 42;

    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    PosterHeader *header = [[PosterHeader alloc]init];
    header.nameLabel.text = [dataArr[section] xyValueForKey:@"productName"];
    return header;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 218;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PosterListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[PosterListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.DataDic = dataArr[indexPath.section];
    //    cell.dataDic = dataArr[indexPath.row];
    return cell;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
  
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
