//
//  MessageDetailVC.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/31.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "MessageDetailVC.h"
#import "MLMyRequest.h"
#import "MessageModel.h"
@interface MessageDetailVC ()
{
    MessageModel *Model;
    
}
@property(nonatomic,strong)UILabel *DesLab;
@property(nonatomic,strong)UILabel *TimeLab;

@end

@implementation MessageDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息中心";
    [self RequestData];
    // Do any additional setup after loading the view.
}
-(void)RequestData{
    [self showMLhud];
    [MLMyRequest PostinfoContentWithinfoId:self.infoId Success:^(NSDictionary *dic) {
        HLSLog(@"消息详情---:%@",dic);
        [self.HUD hideAnimated:YES];

        if ([[dic xyValueForKey:@"code"] integerValue] == SuccessCode) {
            Model = [MessageModel mj_objectWithKeyValues:[dic xyValueForKey:@"result"]];

            [self setupSubview];

        }else{
            [HLSLable lableWithText:[dic xyValueForKey:@"message"]];

        }
    } failure:^(NSError *error) {
        [self.HUD hideAnimated:YES];

    }];
}
-(void)setupSubview{
    UIView *BgView = [UIView new];
    BgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:BgView];
    BgView.sd_layout
    .leftSpaceToView(self.view, 0)
    .topSpaceToView(self.navigationView, 0)
    .heightIs(498)
    .widthIs(SCREEN_WIDTH);
    
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
    
    _DesLab.text = @"";
    
    NSArray *ElementsArr = @[@"购买产品：",@"投保人：",@"手机号：",@"订单号："];
    NSArray *ContentsArr = @[@"安心驾考宝",@"张蓝心",@"1212",@"21"];
    
    UILabel *LastLab = nil;
    for (int i = 0; i < Model.appInfoContentlist.count; i++) {
        UILabel *TittleLab = [HLSLable LabelWithFont:14 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLDetailColor WithFatherView:BgView];
        TittleLab.text = [Model.appInfoContentlist[i] xyValueForKey:@"infoKey"];
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
        DesLab.text = [Model.appInfoContentlist[i] xyValueForKey:@"infoContent"];
        DesLab.sd_layout
        .autoHeightRatio(0)
        .topEqualToView(TittleLab)
        .leftSpaceToView(TittleLab, 20)
        .rightEqualToView(_DesLab);
//        [DesLab setSingleLineAutoResizeWithMaxWidth:(150)];
        
        LastLab = DesLab;
        

        
    }
    
    NSString *Typeimg;
    switch ([Model.infoType integerValue]) {
        case 1:
            Typeimg = @"ico_message_1";
            break;
        case 2:
            Typeimg = @"ico_message_3";
            break;
        case 3:
            Typeimg = @"ico_message_4";
            break;
        case 4:
            Typeimg = @"ico_message_5";
            break;
        case 5:
            Typeimg = @"ico_message_2";
            break;
        default:
            break;
    }
    if (Model) {
        TittleLab.text = Model.infoTitle;
        _DesLab.text = Model.infoContent;
        _TimeLab.text = [[Model.gmtCreate substringToIndex:10] stringByReplacingOccurrencesOfString:@"-" withString:@"/"];
        IconImg.image = [UIImage imageNamed:Typeimg];
        
    }
//    [BgView setupAutoHeightWithBottomView:LastLab bottomMargin:29];

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
