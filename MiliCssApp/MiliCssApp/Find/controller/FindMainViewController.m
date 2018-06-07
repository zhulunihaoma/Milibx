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
@interface FindMainViewController ()

@end

@implementation FindMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setupSubViews];
    // Do any additional setup after loading the view.
}
-(void)setupSubViews{
    [self setupTableViewWithStyle:UITableViewStyleGrouped];
    
    self.tableView.x = 8;
    self.tableView.y = 0;
    self.tableView.width = SCREEN_WIDTH-16;
    self.tableView.backgroundColor = MLBGColor;
    //[self.tableView registerClass:[RequestTextFieldCell class] forCellReuseIdentifier:@"cell"];
    CGFloat tabBarHeight = self.tabBarController.tabBar.frame.size.height;
    int naheight = (int)NaviHeight;
    self.tableView.height = SCREEN_HEIGHT-naheight-tabBarHeight -43;
    HLSLog(@"222：%d",naheight);
    self.tableView.showsVerticalScrollIndicator = NO;
    
    
}
#pragma -mark UITableVIew

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return nil;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return nil;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    if (indexPath.section <2) {
        return  208;

    }else{
        return  115;

    }
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section <2) {
        // 定义唯一标识
        static NSString *CellIdentifier = @"Cellsbig";
        // 通过唯一标识创建cell实例
        NewsBigImgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[NewsBigImgTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
        
        return cell;
    }
   
    // 定义唯一标识
    static NSString *CellIdentifier = @"Cellall";
    // 通过唯一标识创建cell实例
    NewsSmallImgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[NewsSmallImgTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
   
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    ComDetailViewController *cvc = [[ComDetailViewController alloc]init];
    //    [self.navigationController pushViewController:cvc animated:YES];
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
