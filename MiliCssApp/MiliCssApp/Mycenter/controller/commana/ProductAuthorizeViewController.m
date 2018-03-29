//
//  ProductAuthorizeViewController.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/3/29.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "ProductAuthorizeViewController.h"
#import "BDInfoHeaderView.h"
#import "AuthorizeTableViewCell.h"
#import "ComDetailViewController.h"

@interface ProductAuthorizeViewController ()
{
    UIView *NextView;

}
@end

@implementation ProductAuthorizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"产品授权";
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
    self.tableView.height = SCREEN_HEIGHT-NaviHeight;
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
        [NextBtn addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
        NextBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        NextBtn.backgroundColor = MLNaviColor;
        NextBtn.layer.cornerRadius = 3;
        
        
    }
    return NextView;
    
}

#pragma -mark UITableVIew

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 6;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;

}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
   
    return 0.001;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    if (section == 0) {
        BDInfoHeaderView *view =[[BDInfoHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 51)];
        view.Tittlename = @"产品授权";
        return view;
        
    }else{
        return nil;
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 1) {
        return  NextView;
        
    }
    
    return nil;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 定义唯一标识
    static NSString *CellIdentifier = @"Cell";
    // 通过唯一标识创建cell实例
    AuthorizeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[AuthorizeTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
   
    return cell;
    
}
-(void)save{
    ComDetailViewController *cvc = [[ComDetailViewController alloc]init];
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
