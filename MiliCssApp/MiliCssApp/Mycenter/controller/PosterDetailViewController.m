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
@interface PosterDetailViewController ()<SCAdViewDelegate>
{
    SCAdView *_adView;
    UIImageView *bgimg;
}


@end

@implementation PosterDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self SetupSubViews];
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
    .topSpaceToView(bgimg, 524)
    .centerXEqualToView(bgimg);
    [PosterName setSingleLineAutoResizeWithMaxWidth:(SCREEN_WIDTH)];
    
    PosterName.text = @"华安宠物意外升级";
    
    
    
    CGFloat btnWidth = 155;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat margin_x = (screenWidth-btnWidth)/2;
    UIButton *btn = [[UIButton alloc]initWithFrame:(CGRect){23,574,btnWidth,47}];
    [btn setImage:[UIImage imageNamed:@"btn_poster_download"] forState:UIControlStateNormal];
    btn.alpha = 0.8;
    [self.view addSubview:btn];
    [btn sizeToFit];

    [btn addTarget:self action:@selector(DownloadImg) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn1 = [[UIButton alloc]initWithFrame:(CGRect){screenWidth-23-btnWidth,574,btnWidth,47}];
//    [btn1 setTitle:@"分享" forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"btn_poster_enjoy"] forState:UIControlStateNormal];
    [btn1 sizeToFit];

    btn1.alpha = 0.8;
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
  
    
   
    
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
    NSArray *testArray =@[@"刘备",@"李白",@"嬴政",@"韩信",@"bj_feedback"];
    //模拟服务器获取到的数据
    NSMutableArray *arrayFromService  = [NSMutableArray array];
    for (NSString *text in testArray) {
        HeroModel *hero = [HeroModel new];
        hero.imageName = text;
        hero.introduction = [NSString stringWithFormat:@"我是王者农药的:---->%@",text];
        [arrayFromService addObject:hero];
    }
    
    SCAdView *adView = [[SCAdView alloc] initWithBuilder:^(SCAdViewBuilder *builder) {
        builder.adArray = arrayFromService;
        builder.viewFrame = (CGRect){20,9+NaviHeight,self.view.bounds.size.width-40,434};
        builder.adItemSize = (CGSize){265,390};
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
    NSLog(@"sc_scrollToIndex-->%ld",index);
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
    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488778259383&di=c5ccc270675a567e1d70c52886b95f24&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F16%2F50%2F51%2F50Y58PICp4P_1024.jpg"]]];
    [self imglongTapClick];
}
#pragma mark 长按手势弹出警告视图确认
-(void)imglongTapClick

{
    
    
        
        UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"保存图片" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
            NSLog(@"取消保存图片");
        }];
        
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            NSLog(@"确认保存图片");
            
            // 保存图片到相册
            UIImageWriteToSavedPhotosAlbum(bgimg.image,self,@selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:),nil);
            
            //            UIImageWriteToSavedPhotosAlbum(<#UIImage * _Nonnull image#>, <#id  _Nullable completionTarget#>, <#SEL  _Nullable completionSelector#>, <#void * _Nullable contextInfo#>)
            
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
