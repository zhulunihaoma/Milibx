//
//  AddNewComViewController.m
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/28.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "AddNewComViewController.h"
#import "BDInfoHeaderView.h"
#import "AddCell.h"
#import "ProductAuthorizeViewController.h"

@interface AddNewComViewController ()<ZLCategoryViewDelegate>
{
    NSArray *infotittlearr;
    UITextField *choosefield;
    UIView *NextView;
}
@end

@implementation AddNewComViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新增机构";
    choosefield = nil;
    infotittlearr = @[@"机构名称",@"营业执照号",@"联系人姓名",@"身份证号码",@"联系人手机",@"机构地址"];
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
        NextView.size = CGSizeMake(SCREEN_WIDTH, 80);
        NextView.x = 0;
        NextView.y = 0;
        
        
        UIButton *NextBtn = [[UIButton alloc]init];
        [NextView addSubview:NextBtn];
        [NextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(NextView.mas_centerX);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-66, 46));
            make.top.mas_equalTo(@33);
        }];
        [NextBtn setTitle:@"下一步" forState:UIControlStateNormal];
        [NextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [NextBtn addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
        NextBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        NextBtn.backgroundColor = MLNaviColor;
        NextBtn.layer.cornerRadius = 3;
        
        
    }
    return NextView;
    
}

#pragma -mark UITableVIew

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 6;
    }else{
        return 1;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 50;

    }else{
        return 10;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 1) {
        return  80;
        
    }
    return 0.001;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    if (section == 0) {
        BDInfoHeaderView *view =[[BDInfoHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 51)];
        view.Tittlename = @"机构信息";
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
    return 50;
    
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
    cell.inputfield.placeholder = @"必填";

    if (indexPath.section == 1) {
        cell.inputfield.placeholder = @"";
        cell.inputfield.userInteractionEnabled = NO;

        cell.choosefild.userInteractionEnabled = NO;
        choosefield = cell.choosefild;
        cell.titlelab.text = @"推广城市";
        cell.Ischoose = YES;
    }
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        ZLCategoryView *jview = [[ZLCategoryView alloc]init];
        //   [self.view addSubview:jview];
        NSArray *arr = [NSArray new];
        arr = @[@"日本",@"美国",@"加拿大",@"宾夕法尼亚",@"夏威夷"];
        
        jview.dataArr = arr;
        jview.delegate = self;
        [jview setOn];
    }
    
}
#pragma mark -- 点击方法
-(void)next{
    ProductAuthorizeViewController *pvc =[[ProductAuthorizeViewController alloc]init];
    [self.navigationController pushViewController:pvc animated:YES];
}
#pragma mark -- HLSShipperCategoryViewDelegate
-(void)ChoosecategoryWithCategory:(NSString *)Category andIndex:(NSInteger)index{
    HLSLog(@"输出：%@",Category);
    choosefield.text = Category;
    [self.tableView reloadData];
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
