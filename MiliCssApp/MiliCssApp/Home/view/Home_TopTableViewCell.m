//
//  Home_TopTableViewCell.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/28.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "Home_TopTableViewCell.h"
#import <SDCycleScrollView.h>"
#import "TopImgBottomLabBtn.h"
#import "AutoBtns.h"
#import "UIImage+GIF.h"
#import "FLAnimatedImage.h"
#import "PosterViewController.h"
#import "LoginViewController.h"
//#import <FLAnimatedImage/FLAnimatedImage.h>

@interface Home_TopTableViewCell ()<SDCycleScrollViewDelegate>
{
    SDCycleScrollView *BannerView;
    
}
@end
@implementation Home_TopTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        [self initView];

        
        self.separatorImageView.hidden = YES;
    }
    return self;
}
-(void)setupViews{
    NSArray *titles = @[@"业绩报表",@"下级管理",@"海报"];
    NSArray *pics = @[@"ico_home_1",@"ico_home_2",@"ico_home_3"];

    [self makeEqualWidthBtnNum:3 Names:titles Imgs:pics inView:self LRpadding:40 viewPadding:57 y:Fit6(203)+NaviHeight titlefont:13  titleColor:MLTittleColor withtag:0];
    
    
    
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
//初始化界面
-(void)initView{
//    米粒首页最上面背景图
   
    
    NSString *SourceName;
    
    if (NaviHeight == 64) {
        SourceName  = @"home_bj";
    }else{
        SourceName  = @"x_home_bj";
        
    }
    UIImageView *Top_BgImg = [[UIImageView alloc]init];
    
    Top_BgImg.image = [UIImage imageNamed:SourceName];
    Top_BgImg.x = 0;
    Top_BgImg.y = 0;
    Top_BgImg.height = Fit6(151)+NaviHeight;
    Top_BgImg.width = SCREEN_WIDTH;
    Top_BgImg.userInteractionEnabled = YES;
    [self addSubview:Top_BgImg];

    UIImageView *TittleImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"img_home_title"]];
    [self addSubview:TittleImgView];
    [TittleImgView sizeToFit];
TittleImgView.sd_layout
    .heightIs(17)
    .widthIs(70)
    .centerXIs(SCREEN_WIDTH/2)
    .topSpaceToView(self, StatueBarHeight+15);
 
    [self bringSubviewToFront:TittleImgView];
    
    
    
    
    UILabel *ToolsTittle = [HLSLable LabelWithFont:16 WithTextalignment:NSTextAlignmentLeft WithTextColor:[UIColor whiteColor] WithFatherView:Top_BgImg];
    ToolsTittle.text = @"科技米粒，让保障无处不在\n持续探索场景化保险解决方案";
    ToolsTittle.sd_layout
    .leftSpaceToView(Top_BgImg, 28)
    .topSpaceToView(Top_BgImg, 10+NaviHeight)
    .widthIs(200)
    .autoHeightRatio(0);
    NSString *stringnum = @"科技米粒，让保障无处不在";
    
    NSString *string = ToolsTittle.text;
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:string];
    NSUInteger length = [string length];
    [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, length)];//设置所有的字体
    
    UIFont *boldFont = [UIFont boldSystemFontOfSize:16];
    [attrString addAttribute:NSFontAttributeName value:boldFont range:[string rangeOfString:stringnum]];//设置Text这四个字母的字体为粗体
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:4];
    [attrString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0,string.length)];
    ToolsTittle.attributedText = attrString;
    
    
    
    BannerView = [[SDCycleScrollView alloc]init];
    BannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(10, Fit6(88)+NaviHeight,SCREEN_WIDTH-20,Fit6(100)) delegate:self placeholderImage:[UIImage imageNamed:@""]];
    BannerView.pageControlAliment =  SDCycleScrollViewPageContolAlimentCenter;
    BannerView.autoScrollTimeInterval = 3;
    BannerView.backgroundColor = [UIColor whiteColor];
        BannerView.currentPageDotColor = MLNaviColor;
    
    
//    CALayer *subLayer=[CALayer layer];
//
//    CGRect fixframe=_dropView.layer.frame;
//
//    fixframe.size.width=[UIScreen mainScreen].bounds.size.width-40;
//
//    subLayer.frame=fixframe;
//
//    subLayer.cornerRadius=8;
//
//    subLayer.backgroundColor=[[UIColor grayColor] colorWithAlphaComponent:0.5].CGColor;
//
//    subLayer.masksToBounds=NO;
//
//    subLayer.shadowColor=[UIColor grayColor].CGColor;
//
//    subLayer.shadowOffset=CGSizeMake(10,10);
//
//    subLayer.shadowOpacity=0.5;
//
//    subLayer.shadowRadius=8;
//
//    [self.layer insertSublayer:subLayer below:_dropView.layer];
    
  
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:BannerView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(8, 8)];
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
//    //设置大小
//    maskLayer.frame = CGRectMake(BannerView.bounds.origin.x-3, BannerView.bounds.origin.y-3, BannerView.bounds.size.width+5, BannerView.bounds.size.height+50);
//
//    //设置图形样子
//    maskLayer.path = maskPath.CGPath;
//    BannerView.layer.mask = maskLayer;
//
//
//    BannerView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
//    BannerView.layer.shadowOpacity = 1;
//        BannerView.layer.masksToBounds = YES;
//
//    BannerView.layer.shadowRadius = 8.0f;
//    BannerView.layer.shadowOffset = CGSizeMake(3, 3);
//    BannerView.clipsToBounds =NO;
//    BannerView.layer.cornerRadius = 8;
    BannerView.imageURLStringsGroup = @[
                                        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528796505753&di=4ef5f2dff1f19b336fbd3d1b36314a15&imgtype=0&src=http%3A%2F%2Fwww.fun99.cn%2Fuploads%2Fallimg%2Fc180604%2F152P9155025C0-11Z5.jpg",];
    [Top_BgImg addSubview:BannerView];

    BannerView.layer.cornerRadius = 8;
    BannerView.layer.masksToBounds = YES;
//    BannerView.layer.borderColor = MLTittleColor.CGColor;
//    BannerView.layer.borderWidth = 0.5;
    CALayer *subLayer=[CALayer layer];

    CGRect fixframe=BannerView.layer.frame;

//    fixframe.size.width= SCREEN_WIDTH -20;


    subLayer.frame= CGRectMake(fixframe.origin.x-0, fixframe.origin.y-0, fixframe.size.width+0, fixframe.size.height+0);
    subLayer.cornerRadius=8;

    subLayer.backgroundColor=[[UIColor grayColor] colorWithAlphaComponent:0.5].CGColor;

    subLayer.masksToBounds=NO;
    
    subLayer.shadowColor= MLDetailColor.CGColor;
    
    subLayer.shadowOffset=CGSizeMake(1,1);
    subLayer.shadowOffset = CGSizeMake(1, 1);

    subLayer.shadowOpacity=0.8;

    subLayer.shadowRadius=8;
    
    [Top_BgImg.layer insertSublayer:subLayer below:BannerView.layer];
    
    
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
//    HLSLog(@"---topcell数据%@",_DataDic);
//    NSArray *bannerList = [_DataDic xyValueForKey:@"bannerList"];
//        NSMutableArray *ImgList = [NSMutableArray new];
//
//        for (int i = 0; i < bannerList.count; i++) {
//            [ImgList addObject:[bannerList[i] xyValueForKey:@"imgUrl"]];
//        }
//
//        BannerView.imageURLStringsGroup = ImgList;
    
}
-(void)setDataDic:(NSMutableDictionary *)DataDic{

    _DataDic = DataDic;
    NSArray *bannerList = [DataDic xyValueForKey:@"bannerList"];
    NSMutableArray *ImgList = [NSMutableArray new];

    if (bannerList !=@"") {
        

    for (int i = 0; i < bannerList.count; i++) {
        [ImgList addObject:[bannerList[i] xyValueForKey:@"imgUrl"]];
    }
}
    HLSLog(@"---topcell数据%@",ImgList);

//
    BannerView.imageURLStringsGroup = ImgList;
//

}
#pragma mark -- 点击轮播回调
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    //  ProductDetailViewController *pvc = [[ProductDetailViewController alloc]init];
    // [self.navigationController pushViewController:pvc animated:YES];
    NSArray *bannerList = [_DataDic xyValueForKey:@"bannerList"];
    HLSLog(@"---%@",bannerList[index]);
    if ([[bannerList[index] xyValueForKey:@"url"] length] > 0) {
        MLNormalWebViewController *vc = [MLNormalWebViewController new];
        vc.TittleStr = [bannerList[index] xyValueForKey:@"title"];
        vc.AllUrlStr = [bannerList[index] xyValueForKey:@"url"];
        [[GetUnderController getvcwithtarget:self].navigationController pushViewController:vc animated:YES];
    }
    
}
#pragma mark -- 中间入口点击方法
-(void)btnClick:(UIButton *)sender{
    HLSLog(@"--%ld",sender.tag);
        if (![HLSPersonalInfoTool getCookies]) {
    
            LoginViewController *lvc = [[LoginViewController alloc]init];
            UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:lvc];
            nvc.navigationBarHidden = YES;
            [[GetUnderController getvcwithtarget:self] presentViewController:nvc animated:YES completion:nil];
    
        }else{
    
   
    if(sender.tag==0){//业绩报表
        MLNormalWebViewController *vc = [MLNormalWebViewController new];
        vc.TittleStr = @"业绩报表";
        vc.UrlStr = @"/perform/center";
        [[GetUnderController getvcwithtarget:self].navigationController pushViewController:vc animated:YES];
        
    }
    
    if(sender.tag==1){//下级管理
        if ([[HLSPersonalInfoTool merchantLevel] integerValue] >4) {
            [HLSLable lableWithText:@"抱歉，您暂时没有该权限"];
            return;
        }
        MLNormalWebViewController *vc = [MLNormalWebViewController new];
        vc.TittleStr = @"下级管理";
        vc.UrlStr = @"/opena/list";
        [[GetUnderController getvcwithtarget:self].navigationController pushViewController:vc animated:YES];
        
    }
    if(sender.tag==2){//海报
        PosterViewController *vc = [PosterViewController new];
       
        [[GetUnderController getvcwithtarget:self].navigationController pushViewController:vc animated:YES];
        
    }
         }
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
