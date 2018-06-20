//
//  PublicTableViewController.m
//  Banchetong
//
//  Created by AutoBuy on 15/11/23.
//  Copyright © 2015年 horizon. All rights reserved.
//

#import "PublicTableViewController.h"
#import "UIImage+GIF.h"

@interface PublicTableViewController ()<UITableViewDataSource,UITableViewDelegate>
{
}

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
    tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView = tableView];
    
    
}
- (void)setupHeaderRefresh {
    
//    header.lastUpdatedTimeLabel.hidden = YES;
    NSMutableArray *headerImages = [NSMutableArray array];
    for (int i = 1; i < 7; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"refresh_%d",i]];
        
//        NSString  *filePath = [[NSBundle bundleWithPath:[[NSBundle mainBundle] bundlePath]]pathForResource:@"refresh" ofType:@"gif"];
//        NSData  *imageData = [NSData dataWithContentsOfFile:filePath];
//        UIImage *image = [UIImage sd_animatedGIFWithData:imageData];
//
        
        
        [headerImages addObject:image];
    }
    
    
    
    
    
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
  
    
    //给MJRefreshStateIdle状态设置一组图片，可以是一张，idleImages为数组
    [header setImages:headerImages forState:MJRefreshStateIdle];
    //[header setImages:idleImages forState:MJRefreshStatePulling];
    [header setImages:headerImages forState:MJRefreshStateRefreshing];

    
//    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
//    [header setTitle:@"释放刷新" forState:MJRefreshStatePulling];
//    [header setTitle:@"刷新中" forState:MJRefreshStateRefreshing];
    header.lastUpdatedTimeLabel.hidden =YES;
    header.stateLabel.hidden =YES;

    self.tableView.mj_header = header;
}

- (void)setupFooterRefresh {
    MJRefreshFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefresh)];
    //    footer.refreshingTitleHidden = YES;
    self.tableView.mj_footer = footer;
}
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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
            [tableView deselectRowAtIndexPath:indexPath animated:YES];

}
@end
