//
//  MessageDetailVC.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/31.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "MessageDetailVC.h"

@interface MessageDetailVC ()
@property(nonatomic,strong)UILabel *DesLab;
@property(nonatomic,strong)UILabel *TimeLab;
@end

@implementation MessageDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息中心";
    [self setupSubview];
    // Do any additional setup after loading the view.
}
-(void)setupSubview{
    UIView *BgView = [UIView new];
    BgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:BgView];
    BgView.layer.cornerRadius= 8;
BgView.sd_layout
    .leftSpaceToView(self.view, 9)
    .topSpaceToView(self.navigationView, 15)
    .widthIs(SCREEN_WIDTH-18);
    
//   icon
    UIImageView *IconImg = [[UIImageView alloc]init];
    IconImg.image = [UIImage imageNamed:@"btn_me_function_4"];
    [BgView addSubview:IconImg];
    IconImg.sd_layout
    .heightIs(18)
    .widthIs(18)
    .leftSpaceToView(BgView, 19)
    .topSpaceToView(BgView, 25);
//    tittle
    UILabel *TittleLab = [HLSLable LabelWithFont:16 WithTextalignment:NSTextAlignmentRight WithTextColor:MLTittleColor WithFatherView:BgView];
    TittleLab.font = [UIFont boldSystemFontOfSize:16];

    TittleLab.sd_layout
    .heightIs(17)
    .centerYEqualToView(IconImg)
    .leftSpaceToView(IconImg, 6);
    [TittleLab setSingleLineAutoResizeWithMaxWidth:(200)];
    
    TittleLab.text = @"用户出单通知";
    

    // time
    _TimeLab = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentRight WithTextColor:MLDetailColor WithFatherView:BgView];
    _TimeLab.sd_layout
    .heightIs(12)
    .topSpaceToView(BgView, 23)
    .rightSpaceToView(BgView, 13);
    [_TimeLab setSingleLineAutoResizeWithMaxWidth:(80)];
    
    _TimeLab.text = @"18/05/18";
    
    // des
    _DesLab = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLDetailColor WithFatherView:BgView];
    _DesLab.sd_layout
    .autoHeightRatio(0)
    .topSpaceToView(IconImg, 11)
    .leftEqualToView(IconImg)
    .rightSpaceToView(BgView, 14);
    
    _DesLab.text = @"下级代理张教练已出单，您获得了20元净利润来了第三方是的范德萨斯蒂芬斯蒂芬";
    
    NSArray *ElementsArr = @[@"购买产品：",@"投保人：",@"手机号：",@"订单号："];
    NSArray *ContentsArr = @[@"安心驾考宝",@"张蓝心",@"1212",@"21"];
    
    UILabel *LastLab = nil;
    for (int i = 0; i < ElementsArr.count; i++) {
        UILabel *TittleLab = [HLSLable LabelWithFont:14 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLDetailColor WithFatherView:BgView];
        TittleLab.text = ElementsArr[i];
        if (i == 0) {
            TittleLab.sd_layout
            .autoHeightRatio(0)
            
            .topSpaceToView(_DesLab, 41)
            .leftEqualToView(_DesLab);
        }else{
            TittleLab.sd_layout
            .autoHeightRatio(0)
            
            .topSpaceToView(LastLab, 13)
            .leftEqualToView(_DesLab);
        }
        [TittleLab setSingleLineAutoResizeWithMaxWidth:(150)];
       
        
        UILabel *DesLab = [HLSLable LabelWithFont:14 WithTextalignment:NSTextAlignmentRight WithTextColor:MLTittleColor WithFatherView:BgView];
        DesLab.text = ContentsArr[i];
        DesLab.sd_layout
        .autoHeightRatio(0)
        .topEqualToView(TittleLab)
        .rightEqualToView(_DesLab);
        [DesLab setSingleLineAutoResizeWithMaxWidth:(150)];
        
        LastLab = TittleLab;
        

    }
    
    [BgView setupAutoHeightWithBottomView:LastLab bottomMargin:29];

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
