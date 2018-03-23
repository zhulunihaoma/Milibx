//
//  PublicTableViewController.m
//  Banchetong
//
//  Created by AutoBuy on 15/11/23.
//  Copyright © 2015年 horizon. All rights reserved.
//

#import "PublicTableViewController.h"

@interface PublicTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation PublicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)setupTableViewWithStyle:(UITableViewStyle)style {
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:style];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.tableFooterView = [[UIView alloc]init];
    tableView.backgroundColor = MLBGColor ;
    [self.view addSubview:self.tableView = tableView];
    
}
//- (void)setupHeaderRefresh {
//    MJGIFHeader *header = [MJGIFHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
//    header.lastUpdatedTimeLabel.hidden = YES;
//    header.stateLabel.hidden = YES;
//    self.tableView.mj_header = header;
//}
//
//- (void)setupFooterRefresh {
//    MJGIFFooter *footer = [MJGIFFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefresh)];
//    footer.refreshingTitleHidden = YES;
//    self.tableView.mj_footer = footer;
//}
/**
 *  下拉刷新
 */
- (void)headerRefresh {
   
}
/**
 *  上拉加载
 */
- (void)footerRefresh {
    
}
@end
