//
//  PrimanaViewController.m
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/28.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "PrimanaViewController.h"
#import "ManaCell.h"
#import "ComDetailViewController.h"
#import "AddNewPriViewController.h"

@interface PrimanaViewController ()

@end

@implementation PrimanaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"代理人管理";


    [self setupSubViews];
    // Do any additional setup after loading the view.
}
-(void)setupSubViews{
    [self setupTableViewWithStyle:UITableViewStyleGrouped];
    
    self.tableView.x = 16;
    self.tableView.y = NaviHeight;
    self.tableView.width = SCREEN_WIDTH-32;
    self.tableView.backgroundColor = MLBGColor;
    //[self.tableView registerClass:[RequestTextFieldCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.height = SCREEN_HEIGHT-NaviHeight-56;
    self.tableView.showsVerticalScrollIndicator = NO;
    //    底部按钮
    UIButton *AddBtn = [[UIButton alloc]init];
    AddBtn.backgroundColor = MLNaviColor;
    [AddBtn setTitle:@"新增代理人" forState:UIControlStateNormal];
    [AddBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    AddBtn.titleLabel.font = TextFontSize(18);
    [AddBtn addTarget:self action:@selector(AddCom) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:AddBtn];
    AddBtn.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view)
    .heightIs(56);
    
}
#pragma -mark UITableVIew

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 9) {
        return 10;
    }
    return 0.001;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return nil;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return nil;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 定义唯一标识
    static NSString *CellIdentifier = @"Cell";
    // 通过唯一标识创建cell实例
    ManaCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[ManaCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ComDetailViewController *cvc = [[ComDetailViewController alloc]init];
    [self.navigationController pushViewController:cvc animated:YES];
}
#pragma mark -- 按钮方法
-(void)AddCom{
    AddNewPriViewController *cvc = [[AddNewPriViewController alloc]init];
    [self.navigationController pushViewController:cvc animated:YES];

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
