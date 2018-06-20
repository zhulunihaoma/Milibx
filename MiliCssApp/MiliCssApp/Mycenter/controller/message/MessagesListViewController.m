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

@interface MessagesListViewController ()
{
    NSInteger page;

}
@end

@implementation MessagesListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息中心";
    page = 1;
    
    [self setupSubViews];
    [self headerRefresh];
    
}

// Do any additional setup after loading the view.

-(void)RequestData{
   
    

    
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
    page ++;
    [self RequestData];
    
}
/**
 *  无数据View
 */
-(void)setupNoDataView{
    
    self.noDataView = [[MLNoDataView alloc]initWithImageName:@"noOrderList" text:@"您还没有任何记录" detailText:nil buttonTitle:nil];
    self.noDataView.y = 64+1;
    self.noDataView.width = SCREEN_WIDTH;
    self.noDataView.height = SCREEN_HEIGHT - 64;
    [self.view addSubview:self.noDataView];
    
    
}
//无网络的时候
- (void)setupNoNetView {
    self.noNetView = [[MLNoDataView alloc]initWithImageName:@"noNet" text:@"哎呀呀~~出错了+_+" detailText:nil buttonTitle:@"点我重试"];
    self.noNetView.y = 64;
    self.noNetView.width = kSCREENSIZE.width;
    self.noNetView.height = kSCREENSIZE.height - self.noNetView.y - 49;
    [self.noNetView.button addTarget:self action:@selector(RequestData) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.noNetView];
}



//创建tableView
-(void)setupSubViews{
    [self setupTableViewWithStyle:UITableViewStyleGrouped];
    
    self.tableView.x = 9;
    self.tableView.y = NaviHeight;
    self.tableView.width = SCREEN_WIDTH-18;
    self.tableView.height = SCREEN_HEIGHT-NaviHeight;
    [self.tableView registerClass:[MessageListTableViewCell class] forCellReuseIdentifier:@"cell"];

    [self setupFooterRefresh];
    
    [self setupHeaderRefresh];
    
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;//[dataArr count];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 15;
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
    return 80;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[MessageListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
   
//    cell.dataDic = dataArr[indexPath.row];
    return cell;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MessageDetailVC *mvc = [[MessageDetailVC alloc]init];
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
