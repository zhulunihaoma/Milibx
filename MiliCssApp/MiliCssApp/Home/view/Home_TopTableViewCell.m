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

    [self makeEqualWidthBtnNum:3 Names:titles Imgs:pics inView:self LRpadding:40 viewPadding:57 y:203+NaviHeight titlefont:13  titleColor:MLTittleColor withtag:0];
    
    
    
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
    FLAnimatedImageView *Top_BgImg = [[FLAnimatedImageView alloc]init];
//    NSString  *filePath = [[NSBundle bundleWithPath:[[NSBundle mainBundle] bundlePath]]pathForResource:@"bj_home@3x" ofType:@"gif"];
//    NSData  *imageData = [NSData dataWithContentsOfFile:filePath];
    NSString *SourceName;
    
    if (NaviHeight == 64) {
        SourceName  = @"bj_home";
    }else{
        SourceName  = @"x_bj_home";

    }
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:SourceName ofType:@"gif"];
    
    NSData *gifData = [NSData dataWithContentsOfFile:filePath];
    Top_BgImg.backgroundColor = [UIColor clearColor];
//    Top_BgImg.image = [UIImage sd_animatedGIFWithData:imageData];
    
    
    
   
    
    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:gifData];

    Top_BgImg.animatedImage = image;
    

    
    
//    Top_BgImg.image = [UIImage imageNamed:@"launchimg"];
    Top_BgImg.x = 0;
    Top_BgImg.y = 0;
    Top_BgImg.height = 196+NaviHeight;
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
    ToolsTittle.text = @"嘿嘿，你已被这个星球最温暖的保障锁定～";
    ToolsTittle.sd_layout
    .leftSpaceToView(Top_BgImg, 28)
    .topSpaceToView(Top_BgImg, 26+NaviHeight)
    .widthIs(170)
    .autoHeightRatio(0);
    
    
    BannerView = [[SDCycleScrollView alloc]init];
    BannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(10, 88+NaviHeight,SCREEN_WIDTH-20,100) delegate:self placeholderImage:[UIImage imageNamed:@""]];
    BannerView.pageControlAliment =  SDCycleScrollViewPageContolAlimentCenter;
    BannerView.layer.cornerRadius = 8;
    BannerView.layer.masksToBounds = YES;

        BannerView.currentPageDotColor = MLNaviColor;

    BannerView.imageURLStringsGroup = @[
                                        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528796505753&di=4ef5f2dff1f19b336fbd3d1b36314a15&imgtype=0&src=http%3A%2F%2Fwww.fun99.cn%2Fuploads%2Fallimg%2Fc180604%2F152P9155025C0-11Z5.jpg",
                                        @"https://pics.sc.chinaz.com/files/pic/pic9/201806/zzpic12257.jpg",
                                        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1527485581800&di=7bd2c03c1fa5b8c496a8c6092e84bef0&imgtype=0&src=http%3A%2F%2Fi.shangc.net%2F2018%2F0526%2F20180526091117619.jpg",
                                        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488778259383&di=c5ccc270675a567e1d70c52886b95f24&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F16%2F50%2F51%2F50Y58PICp4P_1024.jpg"];
    
    
    [Top_BgImg addSubview:BannerView];
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
    if(sender.tag==0){//业绩报表
        MLNormalWebViewController *vc = [MLNormalWebViewController new];
        vc.TittleStr = @"业绩报表";
        vc.UrlStr = @"/perform/center";
        [[GetUnderController getvcwithtarget:self].navigationController pushViewController:vc animated:YES];
        
    }
    
    if(sender.tag==1){//下级管理
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

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
