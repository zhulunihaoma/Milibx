//
//  MessagesListViewController.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/31.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "MessagesListViewController.h"
#import "MessageListTableViewCell.h"
#import "MessageDetailVC.h"
#import "UIImage+GIF.h"
#import "MLMyRequest.h"
#import "MessageModel.h"

@interface MessagesListViewController ()
{
    NSInteger page;
    NSMutableArray *dataArr;
    NSArray *arr;

}
@end

@implementation MessagesListViewController
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"message" object:self];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息中心";
    page = 1;
    dataArr = [NSMutableArray new];
    arr = [NSArray new];

    [self setupSubViews];
     [self headerRefresh];
}

// Do any additional setup after loading the view.

-(void)RequestData{
    [self showMLhud];
    [MLMyRequest PostinfolistWithpageIndex:page pageSize:10 Success:^(NSDictionary *dic) {
        [self.HUD hideAnimated:YES];

        if ([[dic xyValueForKey:@"code"] integerValue] == SuccessCode) {
            
            if (page == 1) {
                [dataArr removeAllObjects];
            }
            arr =[dic xyValueForKey:@"result"];
            
            for (NSDictionary *Dic in arr) {
                MessageModel *model = [MessageModel mj_objectWithKeyValues:Dic];
                
                [dataArr addObject:model];
            }
            
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
            if (self.noNetView) {
                [self.noNetView removeFromSuperview];
                self.noNetView = nil;
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

#pragma mark -- 无网络
-(void)checkNonet{
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
/**
 *  无数据View
 */
-(void)setupNoDataView{
    
    self.noDataView = [[MLNoDataView alloc]initWithImageName:@"img_Load_2" text:@"扑通，数据君木有了~" detailText:nil buttonTitle:nil];
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



//创建tableView
-(void)setupSubViews{
    [self setupTableViewWithStyle:UITableViewStyleGrouped];
    
    self.tableView.x = 0;
    self.tableView.y = NaviHeight;
    self.tableView.width = SCREEN_WIDTH;

    CGFloat tabBarHeight = self.tabBarController.tabBar.frame.size.height;
    int naheight = (int)NaviHeight;
    self.tableView.height = SCREEN_HEIGHT-naheight;
    [self.tableView registerClass:[MessageListTableViewCell class] forCellReuseIdentifier:@"cell"];

    [self setupFooterRefresh];
    
    [self setupHeaderRefresh];
    
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return dataArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;//[dataArr count];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.001;
    }else{
        return 8;
    }
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 95;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageListTableViewCell *cell = [[MessageListTableViewCell alloc]init];
    cell.Model = dataArr[indexPath.section];
    return cell;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MessageDetailVC *mvc = [[MessageDetailVC alloc]init];
  MessageModel *model = dataArr[indexPath.section];
    mvc.infoId = model.id;
    model.status = @"0";
    [dataArr setObject:model atIndexedSubscript:indexPath.section];
    [self.tableView reloadData];
    [self.navigationController pushViewController:mvc animated:YES];
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
