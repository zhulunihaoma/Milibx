//
//  UserInfoMainViewController.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/6/4.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "UserInfoMainViewController.h"
#import "UserinfoBaseInfoCell.h"

@interface UserInfoMainViewController ()
{
    UIView *MycenterView;
    UILabel *NameLab;
    UILabel *CardLab;
    UILabel *PhoneNumLab;
    NSMutableArray *InfoArr;
    NSArray *keyarr;
    NSArray *valuearr;
}
@end

@implementation UserInfoMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    InfoArr = [NSMutableArray new];
    keyarr = [NSArray new];
    valuearr = [NSArray new];
    [self setupSubviews];

    HLSLog(@"---lalalallal%@",self.UserinfoDic);
    if ([[HLSPersonalInfoTool merchantLevel] integerValue] == 1) {//BD
        keyarr = @[@"代理人名称：",@"身份证号码：",@"手机号码："];
        valuearr = @[[self.UserinfoDic xyValueForKey:@"linker"],[self.UserinfoDic xyValueForKey:@"idCardNo"],[self.UserinfoDic xyValueForKey:@"mobilePhone"]];

        for (int i = 0; i < keyarr.count ; i++) {
            NSMutableDictionary *param = [NSMutableDictionary new];
            [param setValue:valuearr[i] forKey:keyarr[i]];
            [InfoArr addObject:param];
        }
        [self.tableView reloadData];
    }else{
        if ([[HLSPersonalInfoTool merchantNature] integerValue] == 1) {//个人
            keyarr = @[@"性质：",@"代理人名称：",@"身份证号码：",@"手机号码："];
            valuearr = @[@"个人",[self.UserinfoDic xyValueForKey:@"linker"],[self.UserinfoDic xyValueForKey:@"idCardNo"],[self.UserinfoDic xyValueForKey:@"mobilePhone"]];
            
            for (int i = 0; i < keyarr.count ; i++) {
                NSMutableDictionary *param = [NSMutableDictionary new];
                [param setValue:valuearr[i] forKey:keyarr[i]];
                [InfoArr addObject:param];
            }
            [self.tableView reloadData];
        }else if ([[HLSPersonalInfoTool merchantNature] integerValue] == 2){//机构
            keyarr = @[@"性质",@"名称：",@"统一社会信用代码：",@"联系地址：",@"联系人：",@"身份证号码：",@"手机号码："];
            valuearr = @[@"机构",[self.UserinfoDic xyValueForKey:@"companyName"],[self.UserinfoDic xyValueForKey:@"creditCode"],[self.UserinfoDic xyValueForKey:@"address"],[self.UserinfoDic xyValueForKey:@"linker"],[self.UserinfoDic xyValueForKey:@"idCardNo"],[self.UserinfoDic xyValueForKey:@"mobilePhone"]];
            
            
            for (int i = 0; i < keyarr.count ; i++) {
                NSMutableDictionary *param = [NSMutableDictionary new];
                [param setValue:valuearr[i] forKey:keyarr[i]];
                [InfoArr addObject:param];
            }
            [self.tableView reloadData];
        }
    }
    
//    初始化数组
    
    // Do any additional setup after loading the view.
}


//创建tableView
-(void)setupSubviews{
    [self setupTableViewWithStyle:UITableViewStyleGrouped];
    
    self.tableView.x = 0;
    self.tableView.y = 0;
    self.tableView.width = SCREEN_WIDTH;
    
    CGFloat tabBarHeight = self.tabBarController.tabBar.frame.size.height;
    int naheight = (int)NaviHeight;
    self.tableView.height = 410;
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    [self.tableView registerClass:[UserinfoBaseInfoCell class] forCellReuseIdentifier:@"cell"];

    
    
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return InfoArr.count;//[dataArr count];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.001;
    }else{
        return 8;
    }
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 54;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserinfoBaseInfoCell *cell = [[UserinfoBaseInfoCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    cell.textLabel.text = keyarr[indexPath.row];
    cell.detailTextLabel.text = [InfoArr[indexPath.row] xyValueForKey:keyarr[indexPath.row]];

    return cell;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
//        if (indexPath.row == 0) {
//
//            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:cell.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(8, 8)];
//            CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
//            //设置大小
//            maskLayer.frame = cell.bounds;
//            //设置图形样子
//            maskLayer.path = maskPath.CGPath;
//            cell.layer.mask = maskLayer;
//        }else if (indexPath.row == [InfoArr count]-1) {
//            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:cell.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(8, 8)];
//            CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
//            //设置大小
//            maskLayer.frame = cell.bounds;
//            //设置图形样子
//            maskLayer.path = maskPath.CGPath;
//            cell.layer.mask = maskLayer;
//        }

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
