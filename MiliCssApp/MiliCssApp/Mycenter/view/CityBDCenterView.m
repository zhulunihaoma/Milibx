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
#import "AchievementViewController.h"
#import "CompmanaViewController.h"
#import "PrimanaViewController.h"
#import "UsercenterViewController.h"

@interface CityBDCenterView()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *listTableView;/**个人中心列表*/
@property(nonatomic,strong)NSMutableArray *DataArr;/**个人中心列表*/

@end
@implementation CityBDCenterView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
        _DataArr = [NSMutableArray new];
        NSArray *imagearr = @[@"icon_personal_1",@"icon_personal_2",@"icon_personal_3",@"icon_personal_4",];
        NSArray *tittleearr = @[@"业绩中心",@"机构管理",@"代理人管理",@"个人中心",];

        for(int i = 0;i <imagearr.count;i++){
            NSMutableDictionary *dic = [NSMutableDictionary dictionary];
            dic[@"image"] = imagearr[i];
            dic[@"tittle"] = tittleearr[i];
            [_DataArr addObject:dic];
        }
      
    }
    
    
    return self;
}

-(void)initSubviews{
    [self addSubview:self.listTableView];
    
    self.listTableView.x = 0;
    self.listTableView.y = 0;
    self.listTableView.width = SCREEN_WIDTH;
    self.listTableView.height = SCREEN_HEIGHT-64-49;
}

-(UITableView *)listTableView{
    if (!_listTableView) {
        
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //tableView.tableFooterView = [[UIView alloc]init];
        tableView.backgroundColor = MLBGColor;
        self.listTableView = tableView;
       
 
    }
    
    return _listTableView;
}

#pragma -mark UITableVIew

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 1;
    }else{
        return 4;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 16;
    }else{
        return 0.001;

    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.001;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return nil;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return nil;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 315;
    }else{
     return 56;
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
        cell.Model = _DataArr[indexPath.row];
        return cell;
    }else{
        // 定义唯一标识
        static NSString *CellIdentifier = @"Cell";
        // 通过唯一标识创建cell实例
        BDCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[BDCenterTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
        cell.Model = _DataArr[indexPath.row];
        cell.Isdeseled = YES;
        if (indexPath.row ==_DataArr.count-1) {
            cell.separatorImageView.hidden = YES;;
        }
        return cell;
    }
   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            AchievementViewController *avc = [[AchievementViewController alloc]init];
            [[GetUnderController getvcwithtarget:self].navigationController pushViewController:avc animated:YES];
        }
        if (indexPath.row == 1) {
            CompmanaViewController *cvc = [[CompmanaViewController alloc]init];
            [[GetUnderController getvcwithtarget:self].navigationController pushViewController:cvc animated:YES];
        }
        if (indexPath.row == 2) {
            PrimanaViewController *pvc = [[PrimanaViewController alloc]init];
            [[GetUnderController getvcwithtarget:self].navigationController pushViewController:pvc animated:YES];
        }
        if (indexPath.row == 3) {
            UsercenterViewController *uvc = [[UsercenterViewController alloc]init];
            [[GetUnderController getvcwithtarget:self].navigationController pushViewController:uvc animated:YES];
        }
    }
   
}

@end
