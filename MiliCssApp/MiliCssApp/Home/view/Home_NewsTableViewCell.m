//
//  Home_NewsTableViewCell.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/28.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "Home_NewsTableViewCell.h"
#import "HKNewsBannerView.h"
#import "FindViewController.h"
@implementation Home_NewsTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        [self setupViews];
//        self.backgroundColor = [UIColor lightGrayColor];
        
        self.separatorImageView.hidden = YES;
    }
    return self;
}
-(void)setupViews{
}

#pragma mark -- 广播
-(void)makeBroadcasts:(NSMutableDictionary *)DataDic{
    NSArray *MLnewsArr = [DataDic xyValueForKey:@"articleList"];

    if (MLnewsArr !=@"") {
        
 
    NSMutableArray *newArr = [NSMutableArray new];
    for (int i = 0; i <MLnewsArr.count; i++) {
        NSString *tittle = [MLnewsArr[i] xyValueForKey:@"articleTitle"];
        NSString *readNo = [MLnewsArr[i] xyValueForKey:@"readNo"];
        NSString *newtsr = [NSString stringWithFormat:@"%@,%@",tittle,readNo];
        NSDictionary *dic = [NSDictionary dictionaryWithObject:newtsr forKey:@"title"];
        
        [newArr addObject:dic];
    }

    UIView *v =[UIView new];
    v.backgroundColor = [UIColor whiteColor];
    [self addSubview:v];

    v.x = 0;
    v.y = 0;
    v.width = SCREEN_WIDTH;
    v.height = 75;
    
    UIImageView *titleImg = [UIImageView new];
    titleImg.image = [UIImage imageNamed:@"img_home_militt_1"];
    [titleImg sizeToFit];
    [v addSubview:titleImg];
    [titleImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(v).offset(28);
        make.centerY.mas_equalTo(v);
       
    }];
    
    UIView *linev2 =[UIView new];
    linev2.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
    [v addSubview:linev2];
    [linev2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(titleImg);
        make.width.mas_equalTo(0);
        make.left.mas_equalTo(titleImg.mas_right).offset(5);
    }];
    

  
   
    HKNewsBannerView *newsView = [[HKNewsBannerView alloc] initWithFrame:CGRectMake(92, 20, 180, 35)];
    if (newArr.count>0) {
        NSArray *newsArr = @[[newArr[0] xyValueForKey:@"title"],[newArr[1] xyValueForKey:@"title"]];
        newsView.newsArray = newsArr;
        newsView.imageArray = @[@"img_home_militt_2",@"img_home_militt_2",];
    }
//    newsView.backgroundColor = [UIColor lightGrayColor];
    newsView.newsColor = [UIColor blackColor];
    newsView.clickNewsOperationBlock = ^(NSInteger tapIndex){
        MLDebugLog;
        NSLog(@"点击了消息%zd", tapIndex);
//        self.tabBarController.selectedIndex = 1;

        [GetUnderController getvcwithtarget:self].tabBarController.selectedIndex = 1;
        
    };
    [v addSubview:newsView];
    [v layoutIfNeeded];
    

    [newsView startRolling];

//    去看看按钮
    UIButton *GoseeBtn = [[UIButton alloc]init];
    [v addSubview:GoseeBtn];
    [GoseeBtn setImage:[UIImage imageNamed:@"button_home_militt"] forState:UIControlStateNormal];
    [GoseeBtn sizeToFit];
    GoseeBtn.x = v.width - 19 - GoseeBtn.width;
    GoseeBtn.centerY = v.height/2;
           }
//    GoseeBtn.sd_layout
//    .rightSpaceToView(v, 19)
//    .centerYEqualToView(v);
    
}
-(void)setDataDic:(NSMutableDictionary *)DataDic{
    [self makeBroadcasts:DataDic];

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
