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

@interface HomeViewController ()
{
    
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationView.hidden = YES;
    self.title = @"首页";
    [self setupSubViews];
    HLSLog(@"---StatueBarHeight%f",NaviHeight);
    // Do any additional setup after loading the view.
}


-(void)setupSubViews{
    [self setupTableViewWithStyle:UITableViewStyleGrouped];
    
    self.tableView.x = 0;
    self.tableView.y = -StatueBarHeight;
    self.tableView.width = SCREEN_WIDTH;
    self.tableView.backgroundColor = MLBGColor;
    //[self.tableView registerClass:[RequestTextFieldCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.height = SCREEN_HEIGHT-49+StatueBarHeight;
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
    if (section == 4) {
        return 0.01;

    }
    return 8;


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
            return  302+NaviHeight;
            break;
        case 1:
            return  160;
            break;
        case 2:
            return  315;
            break;
        case 3:
            return  75;
            break;
        case 4:
            return  105;
            break;
        default:
            return  0;

            break;
    }
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0) {
        // 定义唯一标识
        static NSString *CellIdentifier = @"Cell0";
        // 通过唯一标识创建cell实例
        Home_TopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[Home_TopTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
        
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
        
        return cell;
    }
    if (indexPath.section == 2) {
        // 定义唯一标识
        static NSString *CellIdentifier = @"Cell2";
        // 通过唯一标识创建cell实例
        Home_PromoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[Home_PromoteTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
        
        return cell;
    }
    if (indexPath.section == 3) {
        // 定义唯一标识
        static NSString *CellIdentifier = @"Cell3";
        // 通过唯一标识创建cell实例
        Home_NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[Home_NewsTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
        
        return cell;
    }
    if (indexPath.section == 4) {
        // 定义唯一标识
        static NSString *CellIdentifier = @"Cell4";
        // 通过唯一标识创建cell实例
        Home_AdvantageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[Home_AdvantageTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
        
        return cell;
    }
    
    
    // 定义唯一标识
    static NSString *CellIdentifier = @"Cellall";
    // 通过唯一标识创建cell实例
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
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
