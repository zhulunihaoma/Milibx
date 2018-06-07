//
//  UserInfoMainViewController.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/6/4.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "UserInfoMainViewController.h"

@interface UserInfoMainViewController ()
{
    UIView *MycenterView;
    UILabel *NameLab;
    UILabel *CardLab;
    UILabel *PhoneNumLab;

}
@end

@implementation UserInfoMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
        MycenterView.layer.cornerRadius = 8;
        MycenterView.layer.masksToBounds = YES;
        
        MycenterView.sd_layout
        .leftSpaceToView(self.view, 9)
        .rightSpaceToView(self.view, 9)
        .topSpaceToView(self.view, 12)
        .heightIs(153);
        
        
        //     修改密码cell
        UIView *passwordview = [UIView new];
        passwordview.backgroundColor = [UIColor whiteColor];
        [MycenterView addSubview:passwordview];
        passwordview.sd_layout
        .topSpaceToView(MycenterView, 0)
        .leftSpaceToView(MycenterView, 0)
        .rightSpaceToView(MycenterView, 0)
        .heightIs(50);
        
        
        
        
        UILabel *motifypassword = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:passwordview];
        motifypassword.text = @"代理人名称：";
        motifypassword.sd_layout
        .centerYIs(25)
        .leftSpaceToView(passwordview, 22)
        .heightIs(17);
        [motifypassword setSingleLineAutoResizeWithMaxWidth:(120)];
        //
        NameLab= [HLSLable LabelWithFont:16 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:passwordview];
        NameLab.text = @"来吧是立刻的方式代付款胜多负少的";
        NameLab.sd_layout
        .centerYIs(25)
        .rightSpaceToView(passwordview, 22)
        .heightIs(17);
        [NameLab setSingleLineAutoResizeWithMaxWidth:(200)];
        
        
        UIView *hline1 = [UIView new];
        hline1.backgroundColor = MLBGColor;
        [MycenterView addSubview:hline1];
        hline1.sd_layout
        .topSpaceToView(MycenterView, 50)
        .leftSpaceToView(MycenterView, 30)
        .rightSpaceToView(MycenterView, 0)
        .heightIs(1);
        
        
        
#pragma mark -- 消息通知
        //     修改密码cell
        UIView *messageview = [UIView new];
        messageview.backgroundColor = [UIColor whiteColor];
        [MycenterView addSubview:messageview];
        messageview.sd_layout
        .topSpaceToView(MycenterView, 51)
        .leftSpaceToView(MycenterView, 0)
        .rightSpaceToView(MycenterView, 0)
        .heightIs(50);
      
        
        
        UILabel *messagelab = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:messageview];
        messagelab.text = @"身份证号码：";
        messagelab.sd_layout
        .centerYIs(25)
        .leftSpaceToView(messageview, 22)
        .heightIs(17);
        [messagelab setSingleLineAutoResizeWithMaxWidth:(120)];
      
        //
        CardLab= [HLSLable LabelWithFont:16 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:messageview];
        CardLab.text = @"320324199207121372";
        CardLab.sd_layout
        .centerYIs(25)
        .rightSpaceToView(messageview, 22)
        .heightIs(17);
        [CardLab setSingleLineAutoResizeWithMaxWidth:(220)];
        
        
        
        
        
        UIView *hlinemessage = [UIView new];
        hlinemessage.backgroundColor = MLBGColor;
        [MycenterView addSubview:hlinemessage];
        hlinemessage.sd_layout
        .topSpaceToView(MycenterView, 100)
        .leftSpaceToView(MycenterView, 30)
        .rightSpaceToView(MycenterView, 0)
        .heightIs(1);
        
        
        
        
        // 清除缓存
        UIView *QingChuview = [UIView new];
        QingChuview.backgroundColor = [UIColor whiteColor];
        [MycenterView addSubview:QingChuview];
        QingChuview.sd_layout
        .topSpaceToView(MycenterView, 101)
        .leftSpaceToView(MycenterView, 0)
        .rightSpaceToView(MycenterView, 0)
        .heightIs(50);
        
      
        
        UILabel *QingChulab = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:QingChuview];
        QingChulab.text = @"手机号码：";
        QingChulab.sd_layout
        .centerYIs(25)
        .leftSpaceToView(QingChuview, 22)
        .heightIs(17);
        [QingChulab setSingleLineAutoResizeWithMaxWidth:(120)];
       
        // 10.2MB
        PhoneNumLab= [HLSLable LabelWithFont:16 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:QingChuview];
        PhoneNumLab.text = @"18012321222";
        PhoneNumLab.sd_layout
        .centerYIs(25)
        .rightSpaceToView(QingChuview, 22)
        .heightIs(17);
        [PhoneNumLab setSingleLineAutoResizeWithMaxWidth:(220)];
        
        
        
      
        
        
        
        
        
        
        
        
     
        
        
        
        
        
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
