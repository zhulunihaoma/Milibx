//
//  UsercenterViewController.m
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/28.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "UsercenterViewController.h"

@interface UsercenterViewController ()
{
    UIView *MycenterView;
}
@end

@implementation UsercenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心";

    [self setupSubviews];
    // Do any additional setup after loading the view.
}
-(void)setupSubviews{
    [self MycenterView];
   
}
-(UIView *)MycenterView{
    if (!MycenterView) {
        MycenterView = [[UIView alloc]init];
        MycenterView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:MycenterView];
        MycenterView.sd_layout
        .leftSpaceToView(self.view, 0)
        .rightSpaceToView(self.view, 0)
        .topSpaceToView(self.view, NaviHeight)
        .heightIs(102);
        
        UILabel *motifypassword = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:MycenterView];
        motifypassword.text = @"修改密码";
        motifypassword.sd_layout
        .centerYIs(25)
        .leftSpaceToView(MycenterView, 30)
        .heightIs(17);
        [motifypassword setSingleLineAutoResizeWithMaxWidth:(120)];
        UIView *hline1 = [UIView new];
        hline1.backgroundColor = HLSOneColor(255);
        [MycenterView addSubview:hline1];
        hline1.sd_layout
        .topSpaceToView(MycenterView, 50)
        .leftSpaceToView(MycenterView, 30)
        .rightSpaceToView(MycenterView, 0)
        .heightIs(1);
        
//        我的钱包
        UILabel *wallet = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:MycenterView];
        wallet.text = @"我的钱包";
        wallet.sd_layout
        .centerYIs(76)
        .leftSpaceToView(MycenterView, 30)
        .heightIs(17);
        [wallet setSingleLineAutoResizeWithMaxWidth:(120)];
        UIView *hline2 = [UIView new];
        hline2.backgroundColor = HLSOneColor(255);
        [MycenterView addSubview:hline2];
        hline2.sd_layout
        .topSpaceToView(MycenterView, 101)
        .leftSpaceToView(MycenterView, 0)
        .rightSpaceToView(MycenterView, 0)
        .heightIs(1);
        
    }
    
    return MycenterView;
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
