//
//  BDInfoViewController.m
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/28.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "BDInfoViewController.h"
#import "BDInfo_TopTableViewCell.h"
#import "BDInfo_BottomTableViewCell.h"
#import "BDInfoHeaderView.h"
@interface BDInfoViewController ()
{
    NSArray *tittlearr;
    NSArray *infotittlearr;
    NSArray *infoarr;

}
@end

@implementation BDInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人资料";
    tittlearr = @[@"个人信息",@"推广地区"];
    infotittlearr = @[@"姓名",@"手机号",@"签约机构数",@"签约代理人"];
    infoarr = @[@"朱璐",@"186529356462",@"100",@"121"];

    [self setupSubViews];
    // Do any additional setup after loading the view.
}
-(void)setupSubViews{
        [self setupTableViewWithStyle:UITableViewStyleGrouped];

        self.tableView.x = 0;
        self.tableView.y = NaviHeight;
        self.tableView.width = SCREEN_WIDTH;
        self.tableView.backgroundColor = MLBGColor;
        //[self.tableView registerClass:[RequestTextFieldCell class] forCellReuseIdentifier:@"cell"];
        self.tableView.height = SCREEN_HEIGHT-64-50;
        self.tableView.showsVerticalScrollIndicator = NO;
    
    
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
 


}
#pragma -mark UITableVIew

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 4;
    }else{
        return 2;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 51;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.001;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    BDInfoHeaderView *view =[[BDInfoHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 51)];
    view.Tittlename = tittlearr[section];

    return view;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return nil;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 50;
    }else{
        return 125;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        // 定义唯一标识
        static NSString *CellIdentifiertop = @"Celltop";
        // 通过唯一标识创建cell实例
        BDInfo_TopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifiertop];
        if (!cell) {
            cell = [[BDInfo_TopTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifiertop];
        }
        cell.titlelab.text = infotittlearr[indexPath.row];
        cell.Name = infoarr[indexPath.row];
        if (indexPath.row == 3) {
            cell.separatorImageView.hidden = YES;
        }
        
        return cell;
    }else{
        // 定义唯一标识
        static NSString *CellIdentifier = @"Cell";
        // 通过唯一标识创建cell实例
        BDInfo_bottomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[BDInfo_bottomTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
        if (indexPath.row == 1) {
            cell.separatorImageView.hidden = YES;
        }
        cell.Model = @"ceshi";
        return cell;
    }
    
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
