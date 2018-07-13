//
//  Home_PromoteTableViewCell.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/28.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "Home_PromoteTableViewCell.h"
#import "TBCityIconFont.h"
#import "UIImage+TBCityIconFont.h"
#import "MLNormalWebViewController.h"
@implementation Home_PromoteTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        
        
        self.separatorImageView.hidden = YES;
    }
    return self;
}
-(void)setupViews{
    UIImageView *TittleColor = [[UIImageView alloc] init];
    TittleColor.backgroundColor = MLNaviColor;
    [self addSubview:TittleColor];
    TittleColor.sd_layout
    .leftSpaceToView(self, 15)
    .topSpaceToView(self, 20)
    .heightIs(15)
    .widthIs(4);
    
    UILabel *ToolsTittle = [HLSLable LabelWithFont:14 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:self];
    [self addSubview:ToolsTittle];
    ToolsTittle.text = @"产品推广";
    ToolsTittle.sd_layout
    .leftSpaceToView(TittleColor, 9)
    .topSpaceToView(self, 20)
    .heightIs(20);
    _ToolsTittle = ToolsTittle;
    [ToolsTittle setSingleLineAutoResizeWithMaxWidth:100];
    
//    更多
    UILabel *MoreBtn = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentRight WithTextColor:MLDetailColor WithFatherView:self];
    MoreBtn.font = [UIFont fontWithName:@"iconfont" size:12];//设置label的字体
    MoreBtn.text = @"更多\U0000e94d";

    MoreBtn.sd_layout
    .rightSpaceToView(self, 17)
    .topSpaceToView(self, 20)
    .heightIs(15)
    .widthIs(50);
    _MoreBtn = MoreBtn;
    //    跳转忘记密码
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goprolist)];
    [MoreBtn addGestureRecognizer:tap];
    MoreBtn.userInteractionEnabled = YES;

    
    

}
-(void)setDataDic:(NSMutableDictionary *)DataDic{
    _DataDic = DataDic;
    [_Pro_BgImg0 removeFromSuperview];
    [_Pro_BgImg1 removeFromSuperview];


    //    产品列表
    NSArray *proarr = [[NSArray alloc]init];
    proarr = [DataDic xyValueForKey:@"productList"];
    NSArray *labelarr = [[NSArray alloc]init];
    labelarr = @[@"img_home_pruduct_1",@"img_home_pruduct_2"];
    
    NSArray *Tagarr = [[NSArray alloc]init];
    Tagarr = @[@"img_home_label",@"img_home_label_2"];
    
    if (proarr !=@"") {
        
            if (proarr.count < 3) {
                _MoreBtn.hidden = YES;
            }

    for (int i = 0; i<proarr.count; i ++) {
        if (i < 2) {
            
      
        UIImageView *Pro_BgImg = [[UIImageView alloc]init];
            if (i == 0) {
                _Pro_BgImg0 = Pro_BgImg;
            }else{
                _Pro_BgImg1 = Pro_BgImg;

            }
        [self addSubview:Pro_BgImg];
        Pro_BgImg.userInteractionEnabled = YES;
            Pro_BgImg.image = [UIImage imageNamed:labelarr[i]];
        HLSLog(@"---登录%@",URLWith([proarr[i] xyValueForKey:@"imgUrl"]));
        Pro_BgImg.x = 5;
        if (i == 0) {
            Pro_BgImg.y = 51;
            
        }else{
            Pro_BgImg.y = 174;
            
        }
        Pro_BgImg.height = 119;
        Pro_BgImg.width = SCREEN_WIDTH-20+8;
        Pro_BgImg.layer.cornerRadius = 8;
        Pro_BgImg.layer.masksToBounds = YES;
            
//       产品图片
            UIImageView *right_img = [[UIImageView alloc]init];
            
            [Pro_BgImg addSubview:right_img];
        right_img.sd_layout
            .rightSpaceToView(Pro_BgImg, 5)
            .bottomSpaceToView(Pro_BgImg, 5)
            .widthIs(170)
            .heightIs(90);
            [right_img sd_setImageWithURL:URLWith([proarr[i] xyValueForKey:@"imgUrl"]) placeholderImage:HolderWith(@"")];

            

            
        //        tittle
        UILabel *Pro_Tittle = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:Pro_BgImg];
        Pro_Tittle.text = [proarr[i] xyValueForKey:@"productName"];
        Pro_Tittle.sd_layout
        .leftSpaceToView(Pro_BgImg, 25)
        .topSpaceToView(Pro_BgImg, 25)
        .heightIs(17);
        [Pro_Tittle setSingleLineAutoResizeWithMaxWidth:260];
        
        //        标签
        UIImageView *Pro_label = [[UIImageView alloc] initWithImage:[UIImage imageNamed:Tagarr[i]]];
        [Pro_BgImg addSubview:Pro_label];
        Pro_label.sd_layout
        .leftSpaceToView(Pro_Tittle, 5)
        .topSpaceToView(Pro_BgImg, 25)
        .heightIs(11)
        .widthIs(40);
        
        
        //        des
        UILabel *Pro_des = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLDetailColor WithFatherView:Pro_BgImg];
            Pro_des.text = [proarr[i] xyValueForKey:@"productFeature"];
        Pro_des.sd_layout
        .leftSpaceToView(Pro_BgImg, 25)
        .topSpaceToView(Pro_Tittle, 6)
        .widthIs(130)
        .maxHeightIs(30)
        .autoHeightRatio(0);
            
            
            
    Pro_des.numberOfLines = 2;
        //        des
        UILabel *Pro_count = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLNaviColor WithFatherView:Pro_BgImg];
        Pro_count.font = [UIFont fontWithName:@"iconfont" size:12];//设置label的字体
        NSArray *count =  [proarr[i] xyValueForKey:@"proxyList"];
        Pro_count.text = [NSString stringWithFormat:@"共%ld款计划\U0000e94d",count.count];
        //跳转到产品列表
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goJihuaList:)];
            Pro_BgImg.tag = 1000+i;
        [Pro_BgImg addGestureRecognizer:tap];
        Pro_BgImg.userInteractionEnabled = YES;
            
        Pro_count.sd_layout
        .leftSpaceToView(Pro_BgImg, 25)
        .bottomSpaceToView(Pro_BgImg, 22)
        .heightIs(17);
        [Pro_count setSingleLineAutoResizeWithMaxWidth:150];
        }
    }
    }
}
-(void)goprolist{
    MLNormalWebViewController *vc = [MLNormalWebViewController new];
    vc.TittleStr = @"产品列表";
    vc.UrlStr = @"/product/productpromote";
//    vc.AllUrlStr = @"http://127.0.0.1:8020/%E5%90%90%E6%A7%BD%E5%A4%A7%E4%BC%9A%E7%AE%A1%E7%90%86%E5%8F%B0/Home.html?__hbt=1530000711383";
    [[GetUnderController getvcwithtarget:self].navigationController pushViewController:vc animated:YES];
}
-(void)goJihuaList:(UITapGestureRecognizer *)tap {
    HLSLog(@"----ttt%ld",tap.view.tag);

    MLNormalWebViewController *vc = [MLNormalWebViewController new];
   
    NSString *productCode = [NSString stringWithFormat:@"/product/productpromoteplan?productCode=%@",[[_DataDic xyValueForKey:@"productList"][tap.view.tag-1000] xyValueForKey:@"productCode"]];
    vc.UrlStr = productCode;

    [[GetUnderController getvcwithtarget:self].navigationController pushViewController:vc animated:YES];
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
