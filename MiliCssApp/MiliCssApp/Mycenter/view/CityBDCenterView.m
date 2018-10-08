//
//  CityBDCenterView.m
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/27.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "CityBDCenterView.h"
#import "BDCenterTableViewCell.h"
#import "BDCenterTopTableViewCell.h"
#import "UsercenterViewController.h"
#import "CommitAdviceViewController.h"
#import "GotoPayViewController.h"
#import "MLMyRequest.h"
#import "BDInfoModel.h"
#import "MycenterCenterTableViewCell.h"
#import "LoginViewController.h"
@interface CityBDCenterView()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableDictionary *Datadic;
    BDInfoModel *BDmodel;
    NSString *UnreadNum;
}

@property(nonatomic,strong)UITableView *listTableView;/**个人中心列表*/
@property(nonatomic,strong)NSMutableArray *DataArr;/**个人中心列表*/

@end
@implementation CityBDCenterView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
  
        [self initSubviews];
        _DataArr = [NSMutableArray new];
        Datadic = [NSMutableDictionary new];
        BDmodel = [[BDInfoModel alloc]init];
        UnreadNum = @"0";
        NSArray *imagearr = @[@"icon_personal_1",@"icon_personal_2",@"icon_personal_3",@"icon_personal_4",];
        NSArray *tittleearr = @[@"常见问题",@"联系我们",@"意见反馈",@"平台资质",];

        for(int i = 0;i <imagearr.count;i++){
            NSMutableDictionary *dic = [NSMutableDictionary dictionary];
            dic[@"image"] = imagearr[i];
            dic[@"tittle"] = tittleearr[i];
            [_DataArr addObject:dic];
        }
        [self RequestData];
        [self RequestUnreadNum];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(homerefresh:) name:@"home" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(messagerefresh:) name:@"message" object:nil];

    }
    
    
    return self;
}
-(void)homerefresh:(NSNotification *)notification{
    
    
    [self RequestData];
    [self RequestUnreadNum];
    [GetUnderController getvcwithtarget:self].tabBarController.selectedIndex = 0;


}
-(void)messagerefresh:(NSNotification *)notification{
    
    
    [self RequestUnreadNum];
    
    
}


-(void)RequestUnreadNum{
    [MLMyRequest PostinfoUnReadSuccess:^(NSDictionary *dic) {
   
        if ([[dic xyValueForKey:@"code"] integerValue] == SuccessCode) {

            HLSLog(@"未读消息数量----%@",dic);
            
            UnreadNum = [dic xyValueForKey:@"result"];
            if ([UnreadNum integerValue] >99) {
                UnreadNum = @"99+";

            }

            [self.listTableView reloadData];
            [self.listTableView.mj_header endRefreshing];

        }
    } failure:^(NSError *error) {
        [self.listTableView.mj_header endRefreshing];

    }];
}
-(void)RequestData{
    [MLMyRequest PostuserCenterSuccess:^(NSDictionary *dic) {
        HLSLog(@"userinfo:%@",dic);

        if ([[dic xyValueForKey:@"code"] integerValue] == SuccessCode) {
            Datadic = [dic xyValueForKey:@"result"];
            BDmodel = [BDInfoModel mj_objectWithKeyValues:Datadic];
            [self.listTableView reloadData];
            [self.listTableView.mj_header endRefreshing];

        }else{
//            if (![HLSPersonalInfoTool getCookies]) {
//
//            [HLSLable lableWithText:[dic xyValueForKey:@"message"]];
//            }
        }
    } failure:^(NSError *error) {
        [self.listTableView.mj_header endRefreshing];

    }];
}
-(void)initSubviews{
    [self addSubview:self.listTableView];
    
    self.listTableView.x = 0;
    self.listTableView.y = 0;
    self.listTableView.width = SCREEN_WIDTH;
    self.listTableView.height = SCREEN_HEIGHT-49+20;
    self.listTableView.backgroundColor = MLBGColor;
    [self setupHeaderRefresh];

}
- (void)setupHeaderRefresh {
    
    //    header.lastUpdatedTimeLabel.hidden = YES;
    NSMutableArray *headerImages = [NSMutableArray array];
    for (int i = 1; i < 7; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"refresh_%d",i]];

        [headerImages addObject:image];
    }
    
    
    
    
    
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    
    
    //给MJRefreshStateIdle状态设置一组图片，可以是一张，idleImages为数组
    [header setImages:headerImages forState:MJRefreshStateIdle];
    [header setImages:headerImages forState:MJRefreshStateRefreshing];
    
    header.lastUpdatedTimeLabel.hidden =YES;
    header.stateLabel.hidden =YES;
    
    self.listTableView.mj_header = header;
}


/**
 *  下拉刷新
 */
- (void)headerRefresh {
    [self RequestData];
    [self RequestUnreadNum];
}
-(UITableView *)listTableView{
    if (!_listTableView) {
        
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.tableFooterView = [[UIView alloc]init];
        tableView.backgroundColor = MLBGColor ;
        tableView.showsVerticalScrollIndicator = NO;
        self.listTableView = tableView;


 
    }
    
    return _listTableView;
}

#pragma -mark UITableVIew

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 6;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 8;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return nil;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return nil;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 246+NaviHeight;
    }else if (indexPath.section == 1) {
        return 220;
    }else{
     return 50;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        // 定义唯一标识
        static NSString *CellIdentifiertop = @"Celltop";
        // 通过唯一标识创建cell实例
        BDCenterTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifiertop];
        if (!cell) {
            cell = [[BDCenterTopTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifiertop];
        }
        if ([UnreadNum integerValue] == 0) {
            cell.UnreadNum.hidden = YES;
        }else{
            cell.UnreadNum.hidden = NO;

            cell.UnreadNum.text = UnreadNum;
            if ([UnreadNum isEqualToString:@"99+"]) {
                cell.UnreadNum.font = TextFontSize(8);

            }
        }
        cell.Model = BDmodel;
        return cell;
    }else if (indexPath.section == 1){
        
        // 定义唯一标识
        static NSString *CellIdentifierCenter = @"CellCenter";
        // 通过唯一标识创建cell实例
        MycenterCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierCenter];
        if (!cell) {
            cell = [[MycenterCenterTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierCenter];
        }
        
//        cell.Model = BDmodel;
        return cell;
    }else{
        // 定义唯一标识
        static NSString *CellIdentifier = @"Cell";
        // 通过唯一标识创建cell实例
        BDCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[BDCenterTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
        cell.Model = _DataArr[indexPath.section-2];
        cell.Isdeseled = YES;
     
        return cell;
    }
   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        MLNormalWebViewController *avc = [[MLNormalWebViewController alloc]init];
        avc.UrlStr = @"/product/problem";
        [[GetUnderController getvcwithtarget:self].navigationController pushViewController:avc animated:YES];
    }
    if (indexPath.section == 3) {
        MLNormalWebViewController *avc = [[MLNormalWebViewController alloc]init];
        NSDictionary * dict = [NSBundle mainBundle].infoDictionary;
        NSString *version = [dict valueForKey:@"CFBundleShortVersionString"];
        avc.UrlStr = [NSString stringWithFormat:@"/contactus/contactus?ver=%@",version];
        [[GetUnderController getvcwithtarget:self].navigationController pushViewController:avc animated:YES];
    }
    if (indexPath.section == 4) {
        CommitAdviceViewController *avc = [[CommitAdviceViewController alloc]init];
        [[GetUnderController getvcwithtarget:self].navigationController pushViewController:avc animated:YES];
    }
    
    if (indexPath.section == 5) {//测试支付界面
//        GotoPayViewController *avc = [[GotoPayViewController alloc]init];
//        [[GetUnderController getvcwithtarget:self].navigationController pushViewController:avc animated:YES];
        MLNormalWebViewController *avc = [[MLNormalWebViewController alloc]init];
        avc.UrlStr = @"/product/platformaptitude";
        [[GetUnderController getvcwithtarget:self].navigationController pushViewController:avc animated:YES];

        

    }
    
    
   
}
-(void)dealloc{
    
    
    [[NSNotificationCenter defaultCenter]removeObserver:self
                                                   name:@"home"
                                                 object:nil];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self
                                                   name:@"message"
                                                 object:nil];
    
}


@end
