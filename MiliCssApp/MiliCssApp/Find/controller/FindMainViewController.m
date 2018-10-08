//
//  FindMainViewController.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/29.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "FindMainViewController.h"
#import "NewsBigImgTableViewCell.h"
#import "NewsSmallImgTableViewCell.h"
#import "NewsBaseTableViewCell.h"
#import "MLFindRequest.h"
#import "NewsModel.h"
@interface FindMainViewController ()
{
    NSInteger page;
    NSMutableArray *dataArr;
    NSArray *arr;
}
@end

@implementation FindMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setupSubViews];
    
    page = 1;
    dataArr = [NSMutableArray new];
    arr = [NSArray new];
    [self RequestData];
    // Do any additional setup after loading the view.
}
-(void)RequestData{
//    [self showMLhud];
    [MLFindRequest PostarticleListWithcolumnId:self.columnId pageIndex:page pageSize:10 Success:^(NSDictionary *dic) {
    
        [self.HUD hideAnimated:YES];
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        if (self.noNetView) {
            [self.noNetView removeFromSuperview];
            self.noNetView = nil;
        }
        HLSLog(@"---aaa新闻里面main---%@,%@",self.columnId,dic);

//
        if ([[dic xyValueForKey:@"code"] integerValue] == SuccessCode) {

                    if (page == 1) {
                        [dataArr removeAllObjects];
                    }

            arr =[[dic xyValueForKey:@"result"] xyValueForKey:@"articleList"];
//            HLSLog(@"数据：111%@",);
            
            for (NSDictionary *Dic in arr) {
                NewsModel *model = [NewsModel mj_objectWithKeyValues:Dic];

                [dataArr addObject:model];
            }
            
//            [dataArr removeAllObjects];

            
//            [dataArr removeAllObjects];

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
            
                    [self.tableView.mj_header endRefreshing];
                    [self.tableView.mj_footer endRefreshing];







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
-(void)setupSubViews{
    [self setupTableViewWithStyle:UITableViewStyleGrouped];
    
    self.tableView.x = 0;
    self.tableView.y = 0;
    self.tableView.width = SCREEN_WIDTH;
    self.tableView.backgroundColor = MLBGColor;
    //[self.tableView registerClass:[RequestTextFieldCell class] forCellReuseIdentifier:@"cell"];
    CGFloat tabBarHeight = self.tabBarController.tabBar.frame.size.height;
    int naheight = (int)NaviHeight;
    self.tableView.height = SCREEN_HEIGHT-naheight-tabBarHeight -43;
    HLSLog(@"222：%d",naheight);
    self.tableView.showsVerticalScrollIndicator = NO;

    [self setupHeaderRefresh];
    [self setupFooterRefresh];

}

/**
 *  下拉刷新
 */
- (void)headerRefresh {
    page = 1;
    [self RequestData];
}
/**
 *  上拉加载
 */
- (void)footerRefresh {
    if (arr.count == 10) {
        page ++;
        [self RequestData];
    }else{
        [self.tableView.mj_footer endRefreshing];

        [HLSLable lableWithText:@"没有更多数据"];
    }
    
    
}
#pragma mark -- 无网络
-(void)checkNonet{
    if (self.noDataView) {
        [self.noDataView removeFromSuperview];
        self.noDataView = nil;
    }
    if (dataArr.count == 0) {//如果为第一页
        if (!self.noNetView) {
            [self setupNoNetView];
        }
        
    }else{
        if (dataArr.count>0) {
            return;
        }
        
        
    }
    
   
    
}
/**
 *  无数据View
 */
-(void)setupNoDataView{
    
    self.noDataView = [[MLNoDataView alloc]initWithImageName:@"img_Load_2" text:@"扑通，数据君木有了~" detailText:nil buttonTitle:nil];
    self.noDataView.y = 0;
    self.noDataView.width = SCREEN_WIDTH;
    self.noDataView.height = SCREEN_HEIGHT - 64;
    [self.tableView addSubview:self.noDataView];
    
    
}
//无网络的时候
- (void)setupNoNetView {
    self.noNetView = [[MLNoDataView alloc]initWithImageName:@"img_Load_1" text:@"" detailText:nil buttonTitle:@"  加载失败，点击页面重试"];
    self.noNetView.y = 0;
    self.noNetView.width = kSCREENSIZE.width;
    self.noNetView.height = kSCREENSIZE.height - self.noNetView.y - 49;
    [self.noNetView.button addTarget:self action:@selector(RequestData) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.noNetView];
}

#pragma -mark UITableVIew

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return dataArr.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return nil;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return nil;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    if (indexPath.row %5 == 0) {
        return  255;

    }else{
        return  110;

    }
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row %5 == 0) {
        // 定义唯一标识
        static NSString *CellIdentifier = @"Cellsbig";
        // 通过唯一标识创建cell实例
     
        NewsBigImgTableViewCell *cell = [[NewsBigImgTableViewCell alloc]init];

        cell.Model = dataArr[indexPath.row];
        NSMutableArray *readarr;
        NewsModel *newmodel = dataArr[indexPath.row];
        if (DEF_PERSISTENT_GET_OBJECT(@"readarr")) {
            readarr =  [NSMutableArray arrayWithArray:DEF_PERSISTENT_GET_OBJECT(@"readarr")];
            
            
            for (int i = 0; i < readarr.count; i++) {
                HLSLog(@"---这cell的的articleId%@",newmodel.articleId);
                
                if ([newmodel.articleId isEqualToString:readarr[i]]) {
                    cell.News_Tittle.textColor = HLSOneColor(185);
                }
            }
        }
        return cell;
    }
   
    // 定义唯一标识
    static NSString *CellIdentifier = @"Cellall";
    // 通过唯一标识创建cell实例
        NewsSmallImgTableViewCell *cell = [[NewsSmallImgTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
   
    cell.Model = dataArr[indexPath.row];
    NSMutableArray *readarr;
    NewsModel *newmodel = dataArr[indexPath.row];
    if (DEF_PERSISTENT_GET_OBJECT(@"readarr")) {
        readarr =  [NSMutableArray arrayWithArray:DEF_PERSISTENT_GET_OBJECT(@"readarr")];
       
        
        for (int i = 0; i < readarr.count; i++) {
            HLSLog(@"---这cell的的articleId%@",newmodel.articleId);

            if ([newmodel.articleId isEqualToString:readarr[i]]) {
                cell.News_Tittle.textColor = HLSOneColor(185);
            }
        }
    }
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MLNormalWebViewController *avc = [[MLNormalWebViewController alloc]init];
    NewsModel *model = dataArr[indexPath.row];
    avc.UrlStr = [NSString stringWithFormat:@"/discover/detail?id=%@",model.articleId];
    avc.TypeStr = @"1";
    avc.newsmodel = model;
    model.readNo  = [NSString stringWithFormat:@"%ld",[model.readNo integerValue]+1];
    [dataArr setObject:model atIndexedSubscript:indexPath.row];
    [self.tableView reloadData];
    NSMutableArray *readarr;

    if (DEF_PERSISTENT_GET_OBJECT(@"readarr")) {
      readarr =  [NSMutableArray arrayWithArray:DEF_PERSISTENT_GET_OBJECT(@"readarr")];

    }else{
        readarr = [NSMutableArray new];
        DEF_PERSISTENT_SET_OBJECT(readarr, @"readarr");

    }
//    for (NSString *item in readarr) {
//        if (![readarr containsObject:item]) {
//            [readarr addObject:item];
//        }
//    }
    readarr =  [NSMutableArray arrayWithArray:[readarr valueForKeyPath:@"@distinctUnionOfObjects.self"]];

    [readarr addObject:model.articleId];
    DEF_PERSISTENT_SET_OBJECT(readarr, @"readarr");
    HLSLog(@"---这里是保存本地的阅读articleId%@",readarr);
    [[GetUnderController getvcwithtarget:self].navigationController pushViewController:avc animated:YES];

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
