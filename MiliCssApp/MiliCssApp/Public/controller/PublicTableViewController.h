//
//  PublicTableViewController.h
//  Banchetong
//
//  Created by AutoBuy on 15/11/23.
//  Copyright © 2015年 horizon. All rights reserved.
//

#import "PublicViewController.h"
#import "MJRefresh.h"

#import "MLNoDataView.h"

@interface PublicTableViewController : PublicViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) MLNoDataView *noDataView;
@property (nonatomic,strong) MLNoDataView *noNetView;
/**
 *  初始化tableView
 *
 *  @param style UITableViewStyle
 */
- (void)setupTableViewWithStyle:(UITableViewStyle)style;
/**
 *  添加刷新
 */
- (void)setupHeaderRefresh;
- (void)setupFooterRefresh;
/**
 *  下拉刷新
 */
- (void)headerRefresh;
/**
 *  上拉加载
 */
- (void)footerRefresh;

@end
