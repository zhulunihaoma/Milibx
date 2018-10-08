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
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "HLSTextHeightTool.h"
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
    tittlearr = @[@"推广城市",@"推广费"];
    infotittlearr = @[@"江苏省",@"安徽省"];
    infoarr = @[@"南京市、无锡市、常州市、徐州市、盐城市",@"合肥市、安庆市"];

    [self setupSubViews];

//   int count = ;
    
    // Do any additional setup after loading the view.
}
-(void)setupSubViews{
        [self setupTableViewWithStyle:UITableViewStyleGrouped];

        self.tableView.x = 0;
        self.tableView.y = 0;
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
//        HLSLog(@"---推广产品信息%d",[[self.UserinfoDic xyValueForKey:@"cityList"] count]);

        return [[self.UserinfoDic xyValueForKey:@"cityList"] count];
    }else if(section == 1){
        return 0;
    }else{
        return [[[self.UserinfoDic xyValueForKey:@"productFeeList"][section-2]xyValueForKey:@"proxyList"] count];

    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2+[[self.UserinfoDic xyValueForKey:@"productFeeList"] count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 51;

}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 8;
    }
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section <2) {
        BDInfoHeaderView *view =[[BDInfoHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 51)];
        view.Tittlename = tittlearr[section];
        view.backgroundColor = [UIColor whiteColor];

        return view;
    }else{
        UILabel *lab = [HLSLable LabelWithFont:16 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:nil];
        lab.width = SCREEN_WIDTH;
        lab.height = 51;
        lab.backgroundColor = [UIColor whiteColor];
        lab.text = [NSString stringWithFormat:@"    %@",[[self.UserinfoDic xyValueForKey:@"productFeeList"][section-2]xyValueForKey:@"productName"]];
        [lab setFont:[UIFont fontWithName:@"Helvetica-Bold" size:17]];

        return lab;
        
    }
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return nil;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        NSString *citys = @"";
        NSDictionary *CityData = [self.UserinfoDic xyValueForKey:@"cityList"][indexPath.row];
        for (int i = 0; i < [[CityData xyValueForKey:@"cityList"] count]; i++) {
            
            HLSLog(@"---%@",[[CityData xyValueForKey:@"cityList"][i] xyValueForKey:@"name"]);
            if (i == 0) {
                citys = [[CityData xyValueForKey:@"cityList"][i] xyValueForKey:@"name"];
            }else{
                citys = [NSString stringWithFormat:@"%@、%@",citys,[[CityData xyValueForKey:@"cityList"][i] xyValueForKey:@"name"]];
            }
            
            
        }
//        citys = @"朔州市朔州市朔州市朔州市朔州市朔州市朔州市朔州市朔州市朔州市朔州市朔州市朔州市朔州市朔州市朔州市朔州市朔州市朔州市朔州市";
        return [HLSTextHeightTool getHeightfortext:citys withWidth:200 withFont:17]+30;
        
    }else{
       NSDictionary *ProDic = [[self.UserinfoDic xyValueForKey:@"productFeeList"][indexPath.section -2] xyValueForKey:@"proxyList"][indexPath.row];
        NSInteger feeListcount = ([[ProDic xyValueForKey:@"feeList"] count] + 1)/3;
        HLSLog(@"---行数多少：==%ld",(long)feeListcount);

        if (([[ProDic xyValueForKey:@"feeList"] count]+1) %3 !=0) {
            feeListcount++;
        }
        HLSLog(@"---行数多少：==%ld",(long)feeListcount);
        if (indexPath.row == 0) {
            return 70 + feeListcount*30;
        }else{
            return 90 + feeListcount*30;
        }
        
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
//        cell.titlelab.text = [[self.UserinfoDic xyValueForKey:@"cityList"][indexPath.row] xyValueForKey:@"name"];
        cell.CityData = [self.UserinfoDic xyValueForKey:@"cityList"][indexPath.row];
        cell.layer.cornerRadius = 8;

        if (indexPath.row == [[self.UserinfoDic xyValueForKey:@"cityList"] count]-1) {
            cell.separatorImageView.hidden = YES;
        }
        
        return cell;
    }else{
        // 定义唯一标识
        static NSString *CellIdentifier = @"Cell";
        // 通过唯一标识创建cell实例
        BDInfo_bottomTableViewCell *cell = [[BDInfo_bottomTableViewCell alloc]init];
//        if (!cell) {
//            cell = [[BDInfo_bottomTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//        }
        if (indexPath.row == [[[self.UserinfoDic xyValueForKey:@"productFeeList"][indexPath.section -2] xyValueForKey:@"proxyList"] count]-1) {
            cell.separatorImageView.hidden = YES;
        }

//        cell.Model = @"ceshi";
        cell.ProDic = [[self.UserinfoDic xyValueForKey:@"productFeeList"][indexPath.section -2] xyValueForKey:@"proxyList"][indexPath.row];
        cell.index = indexPath.row;
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
