//
//  BDCenterTopTableViewCell.m
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/27.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "BDCenterTopTableViewCell.h"
#import "BDInfoViewController.h"
#import "UsercenterViewController.h"
#import "MessagesListViewController.h"
#import "UserInfoViewController.h"
#import "MLNormalWebViewController.h"
#import "PosterViewController.h"
#import "UIImage+GIF.h"
#import "FLAnimatedImage.h"
#import "LoginViewController.h"
@implementation BDCenterTopTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        self.separatorImageView.hidden = YES;
        self.contentView.backgroundColor = MLBGColor;
        _seebtn = [UIButton new];
        _seebtn.selected = NO;
    }
    return self;
}
-(void)setupViews{
    UIView *BgView = [UIView new];
    BgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 246+NaviHeight);

    [self.contentView addSubview:BgView];
    BgView.backgroundColor = MLBGColor;
    
    UIView *MytopView = [UIView new];
    MytopView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 246+NaviHeight);
    [BgView addSubview:MytopView];
    MytopView.backgroundColor = MLBGColor;
//        MytopView.backgroundColor = [UIColor greenColor];

    
    UIImageView *bgimg = [[UIImageView alloc]init];
    
    if (NaviHeight == 64) {
        bgimg.image = [UIImage imageNamed:@"bj_me"];

    }else{
        bgimg.image = [UIImage imageNamed:@"x_bj_me"];

    }
    [MytopView addSubview:bgimg];
    bgimg.userInteractionEnabled = YES;

    bgimg.sd_layout
    .leftEqualToView(MytopView)
    .rightEqualToView(MytopView)
    .topEqualToView(MytopView)
    .heightIs(246+NaviHeight);
    
//    设置以及消息中心
    UIButton *AppSetBtn = [[UIButton alloc]init];
    [bgimg addSubview:AppSetBtn];
    [AppSetBtn setImage:[UIImage imageNamed:@"btn_me_set"] forState:UIControlStateNormal];
    
    [AppSetBtn sizeToFit];
    AppSetBtn.x = 13;
    AppSetBtn.y =6+StatueBarHeight;
    [AppSetBtn addTarget:self action:@selector(GoSet) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *AppMessageBtn = [[UIButton alloc]init];
    [bgimg addSubview:AppMessageBtn];
    [AppMessageBtn setImage:[UIImage imageNamed:@"btn_me_message"] forState:UIControlStateNormal];
    [AppMessageBtn sizeToFit];
    AppMessageBtn.x = SCREEN_WIDTH - 13 - AppMessageBtn.width;
    AppMessageBtn.y =6+StatueBarHeight;
    [AppMessageBtn addTarget:self action:@selector(GoMessage) forControlEvents:UIControlEventTouchUpInside];
    
    
    // 消息上的红点
    _UnreadNum = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentCenter WithTextColor:[UIColor whiteColor] WithFatherView:AppMessageBtn];
    _UnreadNum.sd_layout
    .heightIs(16)
    .widthIs(16)
    .topSpaceToView(AppMessageBtn, -5)
    .rightSpaceToView(AppMessageBtn, -5);
    _UnreadNum.text = @"0";
    _UnreadNum.backgroundColor = [UIColor redColor];
    _UnreadNum.layer.cornerRadius = 8;
    _UnreadNum.layer.masksToBounds = YES;
    
    
//    我的
    UILabel *MyTittle = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentLeft WithTextColor:[UIColor whiteColor] WithFatherView:bgimg];
    MyTittle.text = @"我的";
    MyTittle.sd_layout
    .heightIs(16)
    .centerXEqualToView(bgimg)
    .centerYEqualToView(AppMessageBtn);
    [MyTittle setSingleLineAutoResizeWithMaxWidth:(50)];
    
//    背景图
    UIView *headbgView = [[UIView alloc]init];
    headbgView.backgroundColor = COLORWithRGB(255, 255, 255, 0.24);
//    headbgView.layer.cornerRadius = 21.5;
//    headbgView.layer.masksToBounds = YES;
   
    [bgimg addSubview:headbgView];
    headbgView.sd_layout
    .topSpaceToView(MyTittle, 23)
    .leftEqualToView(bgimg)
    .widthIs(144)
    .heightIs(43);
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:headbgView.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(21.5, 21.5)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = headbgView.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    headbgView.layer.mask = maskLayer;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gouserinfo)];
    [headbgView addGestureRecognizer:tap];
    headbgView.userInteractionEnabled = YES;

//    头像
    
    
    
//    UIImageView *Headimg = [[UIImageView alloc]init];
    
    
    FLAnimatedImageView *Headimg = [[FLAnimatedImageView alloc]init];

    NSString *SourceName;
    
    SourceName  = @"headpic";
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:SourceName ofType:@"gif"];
    
    NSData *gifData = [NSData dataWithContentsOfFile:filePath];
//    Top_BgImg.backgroundColor = [UIColor clearColor];

    
    
    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:gifData];
    
    Headimg.animatedImage = image;
    
    
//    Headimg.image = [UIImage imageNamed:@"img_me_tx_default"];
    [headbgView addSubview:Headimg];
    Headimg.sd_layout
    .topSpaceToView(headbgView, 1.5)
    .leftSpaceToView(headbgView, 9)
    .widthIs(40)
    .heightIs(40);
 

    
    // 昵称
    UILabel *MyName = [HLSLable LabelWithFont:10 WithTextalignment:NSTextAlignmentLeft WithTextColor:[UIColor whiteColor] WithFatherView:headbgView];
    MyName.text = @"朱璐";
    MyName.sd_layout
    .heightIs(10)
    .topSpaceToView(headbgView, 10)
    .leftSpaceToView(Headimg, 7);
    [MyName setSingleLineAutoResizeWithMaxWidth:(100)];
    _uname = MyName;
    
    UILabel *MyPhone = [HLSLable LabelWithFont:10 WithTextalignment:NSTextAlignmentLeft WithTextColor:[UIColor whiteColor] WithFatherView:headbgView];
    MyPhone.text = @"158***12321";
    MyPhone.sd_layout
    .heightIs(10)
    .bottomSpaceToView(headbgView, 10)
    .leftSpaceToView(Headimg, 7);
    [MyPhone setSingleLineAutoResizeWithMaxWidth:(100)];
    _MyPhone = MyPhone;
    
////    向右侧箭头
//    UIImageView *arrow = [[UIImageView alloc]init];
//    [headbgView addSubview:arrow];
//    [arrow setImage:[UIImage imageNamed:@"button_arrow_right"]];
//    [arrow sizeToFit];
//    arrow.centerY = 25;
//    arrow.x = SCREEN_WIDTH - arrow.width - 28;
//
    
    //    保费总额

    UILabel *PromoteTittle = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentCenter WithTextColor:[UIColor whiteColor] WithFatherView:bgimg];
    PromoteTittle.text = @"保费总额(元)";
    PromoteTittle.sd_layout
    .heightIs(12)
    .leftSpaceToView(bgimg, (SCREEN_WIDTH/2)-50)
    .topSpaceToView(headbgView, 20);
        [PromoteTittle setSingleLineAutoResizeWithMaxWidth:(100)];
    UIButton *passwordicon = [[UIButton alloc]init];
    
    passwordicon.backgroundColor = [UIColor clearColor];
    [passwordicon setImage:[UIImage imageNamed:@"button_my_password_nodisplayt"] forState:UIControlStateSelected];
    [passwordicon setImage:[UIImage imageNamed:@"button_my_password_displayt"] forState:UIControlStateNormal];
    [bgimg addSubview:passwordicon];

    passwordicon.sd_layout
    .widthIs(25)
    .heightIs(25)
    .leftSpaceToView(PromoteTittle, 2)
    .centerYEqualToView(PromoteTittle);
    [passwordicon addTarget:self action:@selector(changestatte:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    UILabel *PromoteCount = [HLSLable LabelWithFont:36 WithTextalignment:NSTextAlignmentCenter WithTextColor:[UIColor whiteColor] WithFatherView:bgimg];
    PromoteCount.text = @"0.00";
    PromoteCount.sd_layout
    .heightIs(36)
    .centerXEqualToView(bgimg)
    .widthIs(300)
    .topSpaceToView(PromoteTittle, 13);
    _policyAmount = PromoteCount;
//    [PromoteCount setSingleLineAutoResizeWithMaxWidth:(100)];
    
    
    
    
    //    保费
    
    UILabel *BaoTittle = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentCenter WithTextColor:[UIColor whiteColor] WithFatherView:bgimg];
    BaoTittle.text = @"总推广费(元)";
    BaoTittle.sd_layout
    .heightIs(12)
    .widthIs(100)
    .leftSpaceToView(bgimg, 60)
    .topSpaceToView(PromoteCount, 35);
    //    [PromoteTittle setSingleLineAutoResizeWithMaxWidth:(100)];
    
    UILabel *BaoCount = [HLSLable LabelWithFont:18 WithTextalignment:NSTextAlignmentCenter WithTextColor:[UIColor whiteColor] WithFatherView:bgimg];
    BaoCount.text = @"0.00";
    BaoCount.sd_layout
    .heightIs(18)
    .centerXEqualToView(BaoTittle)
    .widthIs(100)
    .topSpaceToView(BaoTittle, 10);
    _prmAmount = BaoCount;
    //    [PromoteCount setSingleLineAutoResizeWithMaxWidth:(100)];
    
 
    
    
    //    余额
    UILabel *YuTittle = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentCenter WithTextColor:[UIColor whiteColor] WithFatherView:bgimg];
    YuTittle.text = @"净推广费(元)";
    YuTittle.sd_layout
    .heightIs(12)
    .widthIs(100)
    .rightSpaceToView(bgimg, 60)
    .topSpaceToView(PromoteCount, 35);
    //    [PromoteTittle setSingleLineAutoResizeWithMaxWidth:(100)];
    
    
    UILabel *YuCount = [HLSLable LabelWithFont:18 WithTextalignment:NSTextAlignmentCenter WithTextColor:[UIColor whiteColor] WithFatherView:bgimg];
    YuCount.text = @"0.00";
    YuCount.sd_layout
    .heightIs(18)
    .centerXEqualToView(YuTittle)
    .widthIs(100)
    .topSpaceToView(BaoTittle, 10);
    _selfPrmAmount = YuCount;
    //    [PromoteCount setSingleLineAutoResizeWithMaxWidth:(100)];
    
   
    
    
    
}
-(void)changestatte:(UIButton *)sender{
//    [self.view endEditing:YES];
    
    sender.selected = !sender.selected;
    _seebtn.selected = sender.selected;
    if (sender.selected) {
        self.policyAmount.text = @"*****";
        self.prmAmount.text = @"***";
        self.selfPrmAmount.text = @"***";

    }else{
        self.policyAmount.text = self.Model.policyAmount;
        self.prmAmount.text = self.Model.prmAmount;
        self.selfPrmAmount.text = self.Model.selfPrmAmount;


    }
    
}
-(void)setModel:(BDInfoModel *)Model{
    if (Model) {
        
        _Model = Model;


        _uname.text = Model.merchantName;
        _MyPhone.text = [Model.phone stringByReplacingCharactersInRange:NSMakeRange(3, 4)  withString:@"****"];
        
        if (_seebtn.selected) {
            self.policyAmount.text = @"*****";
            self.prmAmount.text = @"***";
            self.selfPrmAmount.text = @"***";
            
        }else{
                    _policyAmount.text = @"0.00";
            [self setNumberTextOfLabel:self.policyAmount WithAnimationForValueContent:[Model.policyAmount floatValue]];
            
                    _prmAmount.text = @"0.00";
            [self setNumberTextOfLabel:self.prmAmount WithAnimationForValueContent:[Model.prmAmount floatValue]];
            
                    _selfPrmAmount.text = @"0.00";
            [self setNumberTextOfLabel:self.selfPrmAmount WithAnimationForValueContent:[Model.selfPrmAmount floatValue]];
            
        }
    }
    

}
#pragma mark --- 余额显示的动画----
- (void)setNumberTextOfLabel:(UILabel *)label WithAnimationForValueContent:(CGFloat)value
{
    CGFloat lastValue = [label.text floatValue];
    CGFloat delta = value - lastValue;
    if (delta == 0) {
        return;
    }
    
    if (delta > 0) {
        
        CGFloat ratio = value / 30.0;
        
        NSDictionary *userInfo = @{@"label" : label,
                                   @"value" : @(value),
                                   @"ratio" : @(ratio)
                                   };
        _balanceLabelAnimationTimer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(setupLabel:) userInfo:userInfo repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_balanceLabelAnimationTimer forMode:NSRunLoopCommonModes];
    }
}

- (void)setupLabel:(NSTimer *)timer
{
    NSDictionary *userInfo = timer.userInfo;
    UILabel *label = userInfo[@"label"];
    CGFloat value = [userInfo[@"value"] floatValue];
    CGFloat ratio = [userInfo[@"ratio"] floatValue];
    
    static int flag = 1;
    CGFloat lastValue = [label.text floatValue];
    CGFloat randomDelta = (arc4random_uniform(2) + 1) * ratio;
    CGFloat resValue = lastValue + randomDelta;
    
    if ((resValue >= value) || (flag == 50)) {
        label.text = [NSString stringWithFormat:@"%.2f", value];
        flag = 1;
        [timer invalidate];
        timer = nil;
        return;
    } else {
        label.text = [NSString stringWithFormat:@"%.2f", resValue];
    }
    flag++;
}
-(void)goinfo:(UITapGestureRecognizer *)tap{
    BDInfoViewController *infovc = [[BDInfoViewController alloc]init];
    
    //获取此View的底层controller
    
    [[GetUnderController getvcwithtarget:self].navigationController pushViewController:infovc animated:YES];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
}


-(void)gouserinfo{
    if (![HLSPersonalInfoTool getCookies]) {
        
        LoginViewController *lvc = [[LoginViewController alloc]init];
        UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:lvc];
        nvc.navigationBarHidden = YES;
        [[GetUnderController getvcwithtarget:self] presentViewController:nvc animated:YES completion:nil];
        return;
    }
    UserInfoViewController *uvc = [[UserInfoViewController alloc]init];
    [[GetUnderController getvcwithtarget:self].navigationController pushViewController:uvc animated:YES];
}
-(void)GoMessage{
    if (![HLSPersonalInfoTool getCookies]) {
        
        LoginViewController *lvc = [[LoginViewController alloc]init];
        UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:lvc];
        nvc.navigationBarHidden = YES;
        [[GetUnderController getvcwithtarget:self] presentViewController:nvc animated:YES completion:nil];
        return;
    }
    MessagesListViewController *uvc = [[MessagesListViewController alloc]init];
    [[GetUnderController getvcwithtarget:self].navigationController pushViewController:uvc animated:YES];
}

-(void)GoSet{
    UsercenterViewController *uvc = [[UsercenterViewController alloc]init];
    [[GetUnderController getvcwithtarget:self].navigationController pushViewController:uvc animated:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
