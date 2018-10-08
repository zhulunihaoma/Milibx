//
//  MycenterCenterTableViewCell.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/8/8.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "MycenterCenterTableViewCell.h"
#import "MLNormalWebViewController.h"
#import "PosterViewController.h"
#import "LoginViewController.h"
@implementation MycenterCenterTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        
        self.separatorImageView.x = 21;
        self.separatorImageView.height = 0.6;
        self.separatorImageView.backgroundColor = HLSColor(229, 235, 232);
    }
    return self;
}
-(void)setupViews{
    self.textLabel.textColor = MLDetailColor;
    self.detailTextLabel.textColor = MLTittleColor;
    
    

    UIView *topview = [[UIView alloc]init];
    [self addSubview:topview];
    topview.sd_layout
    .widthIs(SCREEN_WIDTH-18)
    .leftSpaceToView(self, 9)
    .rightSpaceToView(self, 9)
    .heightIs(220)
    .topSpaceToView(self, 0);
    topview.layer.cornerRadius = 8;
    topview.layer.masksToBounds = YES;
    topview.backgroundColor = [UIColor whiteColor];
    
    NSArray *titles = @[@"业绩报表",@"下级管理",@"海报"];
    NSArray *pics = @[@"btn_me_function_1",@"btn_me_function_2",@"btn_me_function_3"];
    
    [self makeEqualWidthBtnNum:3 Names:titles Imgs:pics inView:topview LRpadding:32 viewPadding:80 y:25 titlefont:12  titleColor:MLTittleColor withtag:0];
    NSArray *TitlesBttom = @[@"我的订单",@"轻松理赔",@""];
    NSArray *PicsBttom = @[@"btn_me_function_4",@"btn_me_function_5",@""];
    
    [self makeEqualWidthBtnNum:3 Names:TitlesBttom Imgs:PicsBttom inView:topview LRpadding:32 viewPadding:80 y:120 titlefont:12  titleColor:MLTittleColor withtag:3];
}
-(void)makeEqualWidthBtnNum:(NSInteger)num Names:(NSArray *)names Imgs:(NSArray *)imgs inView:(UIView *)containerView LRpadding:(CGFloat)LRpadding viewPadding :(CGFloat)viewPadding y:(CGFloat)y titlefont:(NSInteger)font titleColor:(UIColor *)color withtag:(NSInteger)tag
{
    NSMutableArray *arr = [NSMutableArray new];
    
    for (int i = 0; i < num; i ++) {
        UIButton *btn = [[UIButton alloc]init];
        btn.userInteractionEnabled= YES;
        btn.tag = tag+i;
        [arr addObject:btn];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
    //    NSArray *arrstr = @[@"品牌",@"品牌",@"品牌",@"品牌",@"啦啦啦啦啦",];
    int i = 0;
    
    UIButton *lastView;
    for (UIButton *view in arr) {
        [containerView addSubview:view];
        if (lastView) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(lastView.mas_top);
                make.left.equalTo(lastView.mas_right).offset(viewPadding);
                make.width.equalTo(lastView);
                make.height.mas_equalTo(lastView.mas_width);
                
            }];
        }else
        {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(containerView).offset(LRpadding);
                make.top.mas_equalTo(y);
                make.height.mas_equalTo(view.mas_width);
            }];
            
        }
        
        view.layer.cornerRadius = view.height/2;
        [view setImage:[UIImage imageNamed:imgs[i]] forState:UIControlStateNormal];
        UILabel *lab = [UILabel new];
        [containerView addSubview:lab];
        lab.text = names[i];
        lab.font = [UIFont systemFontOfSize:font];
        lab.textColor = color;
        [lab sizeToFit];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(view.mas_centerX);
            make.centerY.mas_equalTo(view.mas_centerY).offset(40);
            
        }];
        lastView=view;
        i++;
        
    }
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(containerView).offset(-LRpadding);
    }];
}

#pragma mark -- 中间入口点击方法
-(void)btnClick:(UIButton *)sender{
    HLSLog(@"--%ld",sender.tag);
    
    if(sender.tag==0){//业绩报表
        if (![HLSPersonalInfoTool getCookies]) {
            
            LoginViewController *lvc = [[LoginViewController alloc]init];
            UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:lvc];
            nvc.navigationBarHidden = YES;
            [[GetUnderController getvcwithtarget:self] presentViewController:nvc animated:YES completion:nil];
            return;
        }
        MLNormalWebViewController *vc = [MLNormalWebViewController new];
        vc.TittleStr = @"业绩报表";
        vc.UrlStr = @"/perform/center";
        [[GetUnderController getvcwithtarget:self].navigationController pushViewController:vc animated:YES];
        
    }
    
    if(sender.tag==1){//下级管理
        if (![HLSPersonalInfoTool getCookies]) {
            
            LoginViewController *lvc = [[LoginViewController alloc]init];
            UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:lvc];
            nvc.navigationBarHidden = YES;
            [[GetUnderController getvcwithtarget:self] presentViewController:nvc animated:YES completion:nil];
            return;
        }
        if ([[HLSPersonalInfoTool merchantLevel] integerValue] >4) {
            [HLSLable lableWithText:@"抱歉，您暂时没有该权限"];
            return;
        }
        MLNormalWebViewController *vc = [MLNormalWebViewController new];
        vc.TittleStr = @"下级管理";
        vc.UrlStr = @"/opena/list";
        
        [[GetUnderController getvcwithtarget:self].navigationController pushViewController:vc animated:YES];
        
    }
    if (sender.tag == 2) {//海报
        if (![HLSPersonalInfoTool getCookies]) {
            
            LoginViewController *lvc = [[LoginViewController alloc]init];
            UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:lvc];
            nvc.navigationBarHidden = YES;
            [[GetUnderController getvcwithtarget:self] presentViewController:nvc animated:YES completion:nil];
            return;
        }
        PosterViewController *vc = [[PosterViewController alloc] init];
        
        [[GetUnderController getvcwithtarget:self].navigationController pushViewController:vc animated:YES];
        
    }
    if(sender.tag==3){//我的订单
        if (![HLSPersonalInfoTool getCookies]) {
            
            LoginViewController *lvc = [[LoginViewController alloc]init];
            UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:lvc];
            nvc.navigationBarHidden = YES;
            [[GetUnderController getvcwithtarget:self] presentViewController:nvc animated:YES completion:nil];
            return;
        }
        MLNormalWebViewController *vc = [MLNormalWebViewController new];
        vc.TittleStr = @"我的订单";
        vc.UrlStr = @"/order/agentOrder";
        
        [[GetUnderController getvcwithtarget:self].navigationController pushViewController:vc animated:YES];
    }
    if(sender.tag==4){//轻松理赔
        MLNormalWebViewController *vc = [MLNormalWebViewController new];
        vc.TittleStr = @"轻松理赔";
        vc.UrlStr = @"/product/claim";
        
        [[GetUnderController getvcwithtarget:self].navigationController pushViewController:vc animated:YES];
    }
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
