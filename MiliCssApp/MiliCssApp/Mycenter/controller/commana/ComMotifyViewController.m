//
//  ComMotifyViewController.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/3/29.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "ComMotifyViewController.h"
#import "BDInfoHeaderView.h"
#import "AddCell.h"
#import "ComDetailCell.h"
#import "AuthorizeTableViewCell.h"

@interface ComMotifyViewController ()
{
    UIView *NextView;
    NSArray *infotittlearr;
    
}
@end

@implementation ComMotifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"机构详情";
    infotittlearr = @[@"用户名",@"机构名称",@"营业执照号",@"联系人姓名",@"身份证号码",@"联系人手机",@"机构地址"];
    
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
    self.tableView.height = SCREEN_HEIGHT-NaviHeight-TabBarHeight-56;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self NextView];
}
-(UIView *)NextView{
    if (!NextView) {
        
        NextView  = [[UIView alloc]init];
        NextView.size = CGSizeMake(SCREEN_WIDTH, 56);
        NextView.x = 0;
        NextView.y = SCREEN_HEIGHT - 56;
        
        [self.view addSubview:NextView];
        
        UIButton *NextBtn = [[UIButton alloc]init];
        [NextView addSubview:NextBtn];
        [NextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(NextView.mas_centerX);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 56));
            make.top.mas_equalTo(@0);
        }];
        [NextBtn setTitle:@"保存" forState:UIControlStateNormal];
        [NextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [NextBtn addTarget:self action:@selector(modify) forControlEvents:UIControlEventTouchUpInside];
        NextBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        NextBtn.backgroundColor = MLNaviColor;
        NextBtn.layer.cornerRadius = 3;
        
        
    }
    return NextView;
    
}

#pragma -mark UITableVIew

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 7;
    }else if (section == 1) {
        return 1;
    }else if (section == 2) {
        return 1;
    }else{
        return 2;
        
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 10;
    }else{
        return 50;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.001;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    BDInfoHeaderView *view =[[BDInfoHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 51)];
    
    if (section == 0) {
        
        view.Tittlename = @"机构信息";
        return view;
        
    }
    if (section == 2) {
        view.Tittlename = @"冻结机构";
        
        return view;
    }
    if (section == 3) {
        view.Tittlename = @"产品授权";
        
        return view;
    }
    return nil;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return nil;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 3) {
        return 100;
    }else{
        return 50;
        
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 定义唯一标识
    static NSString *CellIdentifier = @"Cell";
    // 通过唯一标识创建cell实例
    AddCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[AddCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.titlelab.text = infotittlearr[indexPath.row];
    cell.inputfield.placeholder = @"南京毕加索";
    
    if (indexPath.section == 1) {
        
    }
    if (indexPath.section == 3) {
        // 定义唯一标识
        static NSString *CellIdentifier1 = @"Cell1";
        // 通过唯一标识创建cell实例
        AuthorizeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
        if (!cell) {
            cell = [[AuthorizeTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier1];
        }
        return cell;
        
    }
    
    return cell;
    
}

#pragma mark -- 点击方法
-(void)modify{
    [self.navigationController popViewControllerAnimated:YES];
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
