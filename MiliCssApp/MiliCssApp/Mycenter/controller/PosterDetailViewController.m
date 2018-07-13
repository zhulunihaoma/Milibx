//
//  PosterDetailViewController.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/6/4.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "PosterDetailViewController.h"
#import "SCAdView.h"
#import "HeroModel.h"
#import <UShareUI/UShareUI.h>
#import "MLMyRequest.h"
@interface PosterDetailViewController ()<SCAdViewDelegate>
{
    SCAdView *_adView;
    UIImageView *bgimg;
    NSMutableArray *DataDic;
    NSInteger Myindex;
    NSString *ProductName;
}


@end

@implementation PosterDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DataDic = [NSMutableArray new];
    [self RequestData];
    Myindex = 0;
}

-(void)RequestData{
    [self showMLhud];
    
    [MLMyRequest PostposterListWithproductCode:self.productCode merchantCode:[HLSPersonalInfoTool getmerchantCode] pageIndex:nil pageSize:nil Success:^(NSDictionary *dic) {
        [self.HUD hideAnimated:YES];
        HLSLog(@"---海报详情:%@",dic);
        if (self.noDataView) {
            [self.noDataView removeFromSuperview];
            self.noDataView = nil;
        }
        if ([[dic xyValueForKey:@"code"] integerValue] == SuccessCode) {

            
            if ([[dic xyValueForKey:@"result"] isEqual:[NSNull null]]) {
                [HLSLable lableWithText:@"暂无数据"];
                return ;
            }
            if ([[[dic xyValueForKey:@"result"] xyValueForKey:@"productList"] count]>0) {
                DataDic = [[[dic xyValueForKey:@"result"] xyValueForKey:@"productList"][0]  xyValueForKey:@"posterList"];
                
                ProductName = [[[dic xyValueForKey:@"result"] xyValueForKey:@"productList"][0]  xyValueForKey:@"productName"];
                
                [self SetupSubViews];
            }else{
                if (!self.noDataView) {
                    [self setupNoDataView];
                }
                
                
            }
            
            
        }else{
            [HLSLable lableWithText:[dic xyValueForKey:@"message"]];
        }
    } failure:^(NSError *error) {
        [self.HUD hideAnimated:YES];
//        [self checkNonet];
    }];
    
}
/**
 *  无数据View
 */
-(void)setupNoDataView{
    self.title = @"海报";
    self.noDataView = [[MLNoDataView alloc]initWithImageName:@"img_Load_3" text:@"海报陆续上架中，敬请期待" detailText:nil buttonTitle:nil];
    self.noDataView.y = NaviHeight;
    self.noDataView.width = SCREEN_WIDTH;
    self.noDataView.height = SCREEN_HEIGHT - 64;
    [self.view addSubview:self.noDataView];
    
    
}
-(void)SetupSubViews{
    bgimg = [[UIImageView alloc]init];
    NSString *SourceName;
    
    if (NaviHeight == 64) {
        SourceName  = @"bj_poster";
    }else{
        SourceName  = @"x_bj_poster";
        
    }
    
    
    bgimg.image = [UIImage imageNamed:SourceName];
    [self.view addSubview:bgimg];
    bgimg.userInteractionEnabled = YES;
    [bgimg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    // 名称
    UILabel *TittleLab = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentCenter WithTextColor:[UIColor whiteColor] WithFatherView:bgimg];
  
    TittleLab.sd_layout
    .heightIs(17)
    .topSpaceToView(bgimg, StatueBarHeight+12)
    .centerXEqualToView(bgimg);
    [TittleLab setSingleLineAutoResizeWithMaxWidth:(200)];
    TittleLab.text = @"海报";
    
    //    返回按钮
    
    UIButton *leftBtn = [[UIButton alloc]init];
    [leftBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateHighlighted];
    leftBtn.y = StatueBarHeight;
    leftBtn.width = NaviHeight - StatueBarHeight;
    leftBtn.height = NaviHeight - StatueBarHeight;
    leftBtn.x = NaviLeftPadding;
    leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    leftBtn.contentMode = UIViewContentModeCenter;
    [leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    [bgimg addSubview:leftBtn];
    
    //    [self showAdVertically];//垂直显示
    [self showAdHorizontally];//水平显示
    
//
    UILabel *PosterName = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentCenter WithTextColor:MLTittleColor WithFatherView:bgimg];
    PosterName.sd_layout
    .heightIs(14)
    .topSpaceToView(bgimg, Fit6(500)+StatueBarHeight)
    .centerXEqualToView(bgimg);
    [PosterName setSingleLineAutoResizeWithMaxWidth:(SCREEN_WIDTH)];
    
    PosterName.text = ProductName;
    
    
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat btnWidth = Fit6(155);
    CGFloat btnhieght;

    CGFloat btn_y;
//    if (iPhone6||iPhone5) {
//        if (StatueBarHeight == 44) {
//            btn_y = Fit6(550+StatueBarHeight);
//            btnhieght = Fit6(47);
//
//        }else{
//            btn_y = Fit6(475+StatueBarHeight);
//            btnhieght = 47;
//            btnWidth = (screenWidth - 70)/2;
//        }
//
//    }else{
//
//    }
    btn_y = (Fit6(550)+StatueBarHeight);
    btnWidth = 155;
    
    btnhieght = 47;
    CGFloat margin_x = (screenWidth-btnWidth)/2;
    UIButton *btn = [[UIButton alloc]initWithFrame:(CGRect){18,btn_y,btnWidth,btnhieght}];
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_poster_download_andriod"] forState:UIControlStateNormal];
//    btn.alpha = 0.8;
    [btn setTitle:@"下载" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = TextFontSize(16);
    [self.view addSubview:btn];
    [btn sizeToFit];

    [btn addTarget:self action:@selector(DownloadImg) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn1 = [[UIButton alloc]init];
    
//    [btn1 setTitle:@"分享" forState:UIControlStateNormal];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"btn_poster_enjoy_andriod"] forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn1.titleLabel.font = TextFontSize(16);
    [btn1 setTitle:@"分享" forState:UIControlStateNormal];

    [btn1 sizeToFit];
    btn1.x = screenWidth -btn1.width - 18;
    btn1.y = btn_y;
//    WithFrame:(CGRect){screenWidth-23,btn_y,btnWidth,btnhieght}

    btn1.alpha = 0.8;
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
  
    
   
    
}
#pragma mark --垂直模式
/**
 *  @brief 垂直显示
 */
-(void)showAdVertically{
    
    SCAdView *adView = [[SCAdView alloc] initWithBuilder:^(SCAdViewBuilder *builder) {
        
        //必须参数
        builder.adArray = @[@"刘备",@"李白",@"嬴政",@"韩信"];
        builder.viewFrame = (CGRect){0,0,self.view.bounds.size.width,self.view.bounds.size.height/1.5f};
        builder.adItemSize = (CGSize){self.view.bounds.size.width/2.5f,self.view.bounds.size.width/4.f};
        builder.secondaryItemMinAlpha = 0.6;//非必要参数，设置非主要广告的alpa值
        builder.autoScrollDirection = SCAdViewScrollDirectionTop;//设置垂直向下滚动
        builder.itemCellNibName = @"SCAdDemoCollectionViewCell";
        
        //非必要参数
        builder.allowedInfinite = NO;  //非必要参数 ：设置不无限循环轮播,默认为Yes
        //        builder.minimumLineSpacing = 40; //非必要参数: 如需要可填写，默认会自动计算
        //        builder.scrollEnabled = NO;//非必要参数
        builder.threeDimensionalScale = 1.45;//非必要参数: 若需要使用threeD效果，则需要填写放大或缩小倍数
        //        builder.allowedInfinite = NO;//非必要参数 : 如设置为NO，则按所需显示，不会无限轮播,也不具备轮播功能,默认为yes
        
    }];
    adView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:0.2];
    adView.delegate = self;
    _adView = adView;
    [self.view addSubview:adView];
}
#pragma mark -水平模式
/**
 *  @brief 水平显示
 */
-(void)showAdHorizontally{
    
    
    
    NSArray *testArray = DataDic;
    HLSLog(@"---第几个产品%ld",self.Posterindex);
    
    //模拟服务器获取到的数据
    NSMutableArray *arrayFromService  = [NSMutableArray array];
    for (NSDictionary *dic in testArray) {
        HeroModel *hero = [HeroModel new];
        hero.imageName = [dic xyValueForKey:@"imgBase64Url"];
        hero.introduction = [NSString stringWithFormat:@"我是海报:---->%@",[dic xyValueForKey:@"productName"]];
        [arrayFromService addObject:hero];
    }
    [arrayFromService exchangeObjectAtIndex:0 withObjectAtIndex:self.Posterindex];

    SCAdView *adView = [[SCAdView alloc] initWithBuilder:^(SCAdViewBuilder *builder) {
        builder.adArray = arrayFromService;
        builder.viewFrame = (CGRect){20,9+NaviHeight,SCREEN_WIDTH-40,Fit6(434)};
        builder.adItemSize = (CGSize){Fit6(SCREEN_WIDTH-110),Fit6(360)};
        builder.minimumLineSpacing = 0;
        builder.secondaryItemMinAlpha = 0.6;
        builder.threeDimensionalScale = 1.11;
        builder.itemCellNibName = @"SCAdDemoCollectionViewCell";
    }];
    adView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:0];
    adView.delegate = self;
    _adView = adView;
    [self.view addSubview:adView];
    
}
#pragma mark -delegate

-(void)sc_didClickAd:(id)adModel{
    NSLog(@"sc_didClickAd-->%@",adModel);
    if ([adModel isKindOfClass:[HeroModel class]]) {
        NSLog(@"%@",((HeroModel*)adModel).introduction);
    }
}

-(void)sc_scrollToIndex:(NSInteger)index{
    NSLog(@"sc_scrollToIndex现在是多少-->%ld",index);
    Myindex = index;
}


#pragma mark -operation
-(void)play{
    [_adView play];
}
-(void)pause{
    [_adView pause];
}
-(void)refresh{
    [_adView reloadWithDataArray:@[@"李白",@"李白",@"李白"]];
}

-(void)DownloadImg{
    NSString *imgstr = [DataDic[Myindex] xyValueForKey:@"imgBase64Url"];
    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgstr]]];
    [self imglongTapClickWithImg:img];
}
#pragma mark 长按手势弹出警告视图确认
-(void)imglongTapClickWithImg:(UIImage *)DownLoadImg

{
    
    
        
        UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"保存图片" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
            NSLog(@"取消保存图片");
        }];
        
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            NSLog(@"确认保存图片");
            
            // 保存图片到相册
            UIImageWriteToSavedPhotosAlbum(DownLoadImg,self,@selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:),nil);
            
         
            
        }];
        
        [alertControl addAction:cancel];
        [alertControl addAction:confirm];
        
        [self presentViewController:alertControl animated:YES completion:nil];
        
    
    
}

#pragma mark 保存图片后的回调
- (void)imageSavedToPhotosAlbum:(UIImage*)image didFinishSavingWithError:  (NSError*)error contextInfo:(id)contextInfo

{
    
    NSString*message =@"呵呵";
    
    if(!error) {
        
        message =@"成功保存到相册";
        
        UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alertControl addAction:action];
        
        [self presentViewController:alertControl animated:YES completion:nil];
        
    }else
        
    {
        
        message = [error description];
        
        
        UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alertControl addAction:action];
        
        [self presentViewController:alertControl animated:YES completion:nil];
        
    }
    
}

-(void)share{
    [UMSocialUIManager setPreDefinePlatforms:@[@(UMSocialPlatformType_QQ),@(UMSocialPlatformType_WechatSession),@(UMSocialPlatformType_WechatTimeLine)]];
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        // 根据获取的platformType确定所选平台进行下一步操作
        [self shareImageToPlatformType:platformType];
        
    }];
    
    
   
}
- (void)shareImageToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //创建图片内容对象
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    //如果有缩略图，则设置缩略图
    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[DataDic[Myindex] xyValueForKey:@"imgBase64Url"]]]];

    shareObject.thumbImage = img;
    [shareObject setShareImage:img];
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            NSLog(@"response data is %@",data);
        }
    }];
}
- (UIImage *)dataURL2Image: (NSString *) imgSrc
{
    NSURL *url = [NSURL URLWithString: imgSrc];
    NSData *data = [NSData dataWithContentsOfURL: url];
    UIImage *image = [UIImage imageWithData: data];
    
    return image;
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
