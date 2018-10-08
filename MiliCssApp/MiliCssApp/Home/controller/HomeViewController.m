//
//  HomeViewController.m
//  MiliCssApp
//
//  Created by Milizhu on 2018/3/23.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "HomeViewController.h"
#import "MiliCssApp-Bridging-Header.h"
#import "MiliTabbarViewController.h"
#import "Home_TopTableViewCell.h"
#import "Home_ToolsTableViewCell.h"
#import "Home_PromoteTableViewCell.h"
#import "Home_NewsTableViewCell.h"
#import "Home_AdvantageTableViewCell.h"
#import "MLhomeRequest.h"
#import "UIImage+GIF.h"
#import "HKNewsBannerView.h"
#import "LoginViewController.h"
#import "NewsModel.h"
@interface HomeViewController ()
{
    NSMutableDictionary *DataDic;
    NSMutableDictionary *MyDic;

    UIView *v;
    HKNewsBannerView *mynewsView;
    BOOL IsarticleList;
}
@end

@implementation HomeViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   
    [mynewsView startRolling];

}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationView.hidden = YES;
    self.view.backgroundColor = MLBGColor;

    self.title = @"首页";
    DataDic = [NSMutableDictionary new];
    MyDic = [NSMutableDictionary new];
    [self setupSubViews];
    [self isLogin];
    IsarticleList = NO;

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(homerefresh:) name:@"home" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(gotomy:) name:@"gotomy" object:nil];

    // Do any additional setup after loading the view.
}
-(void)isLogin{
    [self RequestData];

//    if (![HLSPersonalInfoTool getCookies]) {
//
//        LoginViewController *lvc = [[LoginViewController alloc]init];
//        UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:lvc];
//        nvc.navigationBarHidden = YES;
//        [self presentViewController:nvc animated:YES completion:nil];
//
    
//    }else{
//        [self RequestData];
//
//    }
}
-(void)gotomy:(NSNotification *)notification{
    
    self.tabBarController.selectedIndex = 2; 

    
}
-(void)homerefresh:(NSNotification *)notification{

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)),dispatch_get_main_queue(), ^{
        
        [self RequestData];

    });

}
-(void)RequestData{
//    self.HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
//    [self showMLhud];
    [MLhomeRequest PostmainSuccess:^(NSDictionary *dic) {
        HLSLog(@"首页数据,%@",dic);
        [self.HUD hideAnimated:YES];
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        MyDic = [NSMutableDictionary dictionaryWithDictionary:dic];
        
        if ([[dic xyValueForKey:@"code"] integerValue] == SuccessCode) {
            
            
            
            DataDic = [dic xyValueForKey:@"result"];
            
            if ([[DataDic allKeys] containsObject:@"articleList"]) {
                if ([[DataDic xyValueForKey:@"articleList"] count] > 0) {
                    IsarticleList = YES;
                }else{
                    IsarticleList = NO;
                }
            }else{
                IsarticleList = NO;
            }
            
            
            [self.tableView reloadData];
           
        }else{
            [HLSLable lableWithText:[dic xyValueForKey:@"message"]];
        }
       
    } failure:^(NSError *error) {
        [self.HUD hideAnimated:YES];
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    }];
}

-(void)setupSubViews{
    [self setupTableViewWithStyle:UITableViewStyleGrouped];
    
    self.tableView.x = 0;
    self.tableView.y = -StatueBarHeight;
    self.tableView.width = SCREEN_WIDTH;
    self.tableView.backgroundColor = MLBGColor;
    [self.tableView registerClass:[Home_TopTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.height = SCREEN_HEIGHT-49+StatueBarHeight;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.tableView registerClass:[Home_PromoteTableViewCell class] forCellReuseIdentifier:@"Cell2"];
    

    [self setupHeaderRefresh];
    
}
#pragma mark -- 广播
-(void)makeBroadcasts:(NSMutableDictionary *)DataDic In:(UIView *)fview{
    
    NSArray *MLnewsArr = [DataDic xyValueForKey:@"articleList"];
    
    
        
        NSMutableArray *newArr = [NSMutableArray new];
        for (int i = 0; i <MLnewsArr.count; i++) {
            NSString *tittle = [MLnewsArr[i] xyValueForKey:@"articleTitle"];
            NSString *readNo = [MLnewsArr[i] xyValueForKey:@"readNo"];
            NSString *newtsr = [NSString stringWithFormat:@"%@,%@",tittle,readNo];
            NSDictionary *dic = [NSDictionary dictionaryWithObject:newtsr forKey:@"title"];
            
            [newArr addObject:dic];
        }
        
        v =[UIView new];
        v.backgroundColor = [UIColor whiteColor];
        [fview addSubview:v];
        
        v.x = 0;
        v.y = 0;
        v.width = SCREEN_WIDTH;
        v.height = 75;
        
        UIImageView *titleImg = [UIImageView new];
        titleImg.image = [UIImage imageNamed:@"img_home_militt_1"];
        [titleImg sizeToFit];
        [v addSubview:titleImg];
        [titleImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(v).offset(28);
            make.centerY.mas_equalTo(v);
            
        }];
        
        UIView *linev2 =[UIView new];
        linev2.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
        [v addSubview:linev2];
        [linev2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(titleImg);
            make.width.mas_equalTo(0);
            make.left.mas_equalTo(titleImg.mas_right).offset(5);
        }];
        
        
        
//        if (!newsView) {
            
//            WithFrame:CGRectMake(92, 20, SCREEN_WIDTH-200, 35)
         HKNewsBannerView *newsView = [[HKNewsBannerView alloc] initWithFrame:CGRectMake(92, 20, SCREEN_WIDTH-200, 35)];
//    [v addSubview:newsView];
//    newsView.sd_layout
//    .leftSpaceToView(titleImg, 20)
//    .topSpaceToView(v, 20)
//    .rightSpaceToView(self, 110)
//    .heightIs(35);
            if (newArr.count>0) {
                if (newArr.count>1) {
                    NSArray *newsArr = @[[NSString stringWithFormat:@" %@",[newArr[0] xyValueForKey:@"title"]],[NSString stringWithFormat:@" %@",[newArr[1] xyValueForKey:@"title"]]];
                    newsView.newsArray = newsArr;
                    newsView.imageArray = @[@"img_home_militt_2",@"img_home_militt_2",];
                }else{
                    NSArray *newsArr = @[[NSString stringWithFormat:@" %@",[newArr[0] xyValueForKey:@"title"]],[NSString stringWithFormat:@" %@",[newArr[0] xyValueForKey:@"title"]]];
                    newsView.newsArray = newsArr;
                    newsView.imageArray = @[@"img_home_militt_2",@"img_home_militt_2",];
                }
                
               
            }
            //    newsView.backgroundColor = [UIColor lightGrayColor];
            newsView.newsColor = [UIColor blackColor];
            newsView.clickNewsOperationBlock = ^(NSInteger tapIndex){
                MLDebugLog;
                NSLog(@"点击了消息%zd", tapIndex);
               
                MLNormalWebViewController *avc = [[MLNormalWebViewController alloc]init];
                NewsModel *model;
                if (newArr.count>1) {
                    model = [NewsModel mj_objectWithKeyValues:MLnewsArr[tapIndex]];

                }else{
                    model = [NewsModel mj_objectWithKeyValues:MLnewsArr[0]];

                }
                avc.UrlStr = [NSString stringWithFormat:@"/discover/detail?id=%@",model.articleId];
                avc.TypeStr = @"1";
                avc.newsmodel = model;
                model.readNo  = [NSString stringWithFormat:@"%ld",[model.readNo integerValue]+1];
                [self.navigationController pushViewController:avc animated:YES];
            };
            [v addSubview:newsView];
            [v layoutIfNeeded];
        mynewsView = newsView;
            
            [newsView startRolling];
//        }
        
        //    去看看按钮
        UIButton *GoseeBtn = [[UIButton alloc]init];
        [v addSubview:GoseeBtn];
        [GoseeBtn setImage:[UIImage imageNamed:@"button_home_militt"] forState:UIControlStateNormal];
        [GoseeBtn sizeToFit];
        GoseeBtn.x = v.width - 19 - GoseeBtn.width;
        GoseeBtn.centerY = v.height/2;
        [GoseeBtn addTarget:self action:@selector(gonews) forControlEvents:UIControlEventTouchUpInside];
    
}
/**
 *  下拉刷新
 */
- (void)headerRefresh {
    [self RequestData];
}
/**
 *  上拉加载
 */
- (void)footerRefresh {
    [self RequestData];
    
}

#pragma -mark UITableVIew

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    if ([[DataDic allKeys] containsObject:@"articleList"]) {
        if ([[DataDic xyValueForKey:@"articleList"] count] > 0) {
            return 5;

        }else{
            return 4;
        }
    }else{
        return 4;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 8;

    }
    return 0.01;



}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return nil;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return nil;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:
            return  Fit6(302)+NaviHeight;
            break;
        case 1:
            return  170;
            break;
        case 2:
            
            if ([[MyDic xyValueForKey:@"message"] length]>0) {
                HLSLog(@"---首页%@",[DataDic xyValueForKey:@"productList"]);
                if ([[DataDic allKeys] containsObject:@"productList"]) {
                    if ([[DataDic xyValueForKey:@"productList"] count] > 1) {
                        return  315;
                        
                    }else{
                        return  315-130;
                    }
                }else{
                    return  315-130;

                }
                
            }else{
                return  315-130;
            }
//            return  315;

            break;
        case 3:
            if (IsarticleList) {
                return  75;
                
            }else{
                return  Fit6(105);

            }
            break;
        case 4:
            return  Fit6(92);

            break;
        default:
            return  0;

            break;
    }
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0) {
        // 定义唯一标识
        // 通过唯一标识创建cell实例
   
        static NSString *identifier = @"cell";
        Home_TopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[Home_TopTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        }
        cell = [[Home_TopTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];

        
        cell.DataDic = DataDic;
        return cell;
    }
    if (indexPath.section == 1) {
        // 定义唯一标识
        static NSString *CellIdentifier = @"Cell1";
        // 通过唯一标识创建cell实例
        Home_ToolsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[Home_ToolsTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
        cell.dataDic = DataDic;
        
        return cell;
    }
    if (indexPath.section == 2) {
        // 定义唯一标识
        static NSString *CellIdentifier = @"Cell2";
        // 通过唯一标识创建cell实例
        Home_PromoteTableViewCell *cell = [[Home_PromoteTableViewCell alloc]init];
        cell.DataDic = DataDic;
        return cell;
    }
    if (indexPath.section == 3) {
        if (IsarticleList) {
            
    
        // 定义唯一标识
        static NSString *CellIdentifier = @"Cell3";
        // 通过唯一标识创建cell实例
        Home_NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

//        Home_NewsTableViewCell *cell = [[Home_NewsTableViewCell alloc]init];
        if (!cell) {
            cell = [[Home_NewsTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
            cell.separatorImageView.hidden = YES;

//            if (!v) {
                [v removeFromSuperview];
                [self makeBroadcasts:DataDic In:cell.contentView];
                [mynewsView startRolling];
//            }
           
            
        
        return cell;
        }else{
            // 定义唯一标识
            static NSString *CellIdentifier = @"Cell4";
            // 通过唯一标识创建cell实例
            Home_AdvantageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell) {
                cell = [[Home_AdvantageTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
            }
            
            return cell;
        }
    }
    if (indexPath.section == 4) {
        // 定义唯一标识
        static NSString *CellIdentifier = @"Cell4";
        // 通过唯一标识创建cell实例
        Home_AdvantageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[Home_AdvantageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.contentView.backgroundColor = MLBGColor;
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

        return cell;
    }
    
    
    // 定义唯一标识
    static NSString *CellIdentifier = @"Cellall";
    // 通过唯一标识创建cell实例
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    if (indexPath.section == 4) {
        MLNormalWebViewController *avc = [[MLNormalWebViewController alloc]init];
        avc.UrlStr = @"/about";
        [[GetUnderController getvcwithtarget:self].navigationController pushViewController:avc animated:YES];
    }
    
}
-(void)gonews{
    self.tabBarController.selectedIndex = 1;
    
    
}
-(void)dealloc{
    
    
    [[NSNotificationCenter defaultCenter]removeObserver:self
                                                   name:@"home"
                                                 object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self
                                                   name:@"gotomy"
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
