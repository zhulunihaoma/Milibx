//
//  PosterListTableViewCell.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/6/4.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "PosterListTableViewCell.h"
#import "PosterDetailViewController.h"

@implementation PosterListTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.separatorImageView.x = 30;
    }
    return self;
}
-(void)SetupViews:(NSArray *)posterListArr{
   NSArray *dataArr = posterListArr;
    UIScrollView *PosterScrollView = [[UIScrollView alloc]init];
    [self addSubview:PosterScrollView];
    PosterScrollView.sd_layout
    .leftSpaceToView(self, 0)
    .rightSpaceToView(self, 0)
    .topSpaceToView(self, 0)
    .heightIs(218)
    .widthIs(SCREEN_WIDTH);
    PosterScrollView.contentSize = CGSizeMake((167*3)-10, 85);
    PosterScrollView.backgroundColor = [UIColor whiteColor];
    PosterScrollView.showsHorizontalScrollIndicator = NO;
    
    
    UIImageView *lastView = nil;
    UILabel *lastLab = nil;

    for (int i = 0; i <dataArr.count; i++) {
        UIImageView *normalView = [[UIImageView alloc] init];
        //    GongLue.backgroundColor = MLNaviColor;

        [normalView sd_setImageWithURL:URLWith([dataArr[i] xyValueForKey:@"imgUrl"]) placeholderImage:HolderWith(@"img_loading")];
        

        
        [PosterScrollView addSubview:normalView];
        if (i == 0 ) {
            normalView.x = 17;
        }else{
            normalView.x = 17 +113*i;
        }
        normalView.tag = i+1000;
        normalView.y = 19;
        normalView.width = 105;
        normalView.height = 152;
        normalView.layer.borderColor = HLSOneColor(238).CGColor;
        normalView.layer.borderWidth = 4;
        normalView.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goPoster:)];
        [normalView addGestureRecognizer:tap];

        lastView = normalView;
        
        
       UILabel *normalLab = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:PosterScrollView];
        normalLab.text = [dataArr[i] xyValueForKey:@"productName"];
        if (i == 0 ) {
            normalLab.x = 15;
        }else{
            normalLab.x = 15 +i*114;
        }
        normalLab.y = normalView.bottom+10;
        normalLab.width = 105;
        normalLab.height = 15;
        lastLab = normalLab;
        
    }
    
}
-(void)goPoster:(UITapGestureRecognizer *)tap{
    PosterDetailViewController *vc = [PosterDetailViewController new];
    vc.productCode = [self.DataDic xyValueForKey:@"productCode"];
    [[GetUnderController getvcwithtarget:self].navigationController pushViewController:vc animated:YES];
}
-(void)setDataDic:(NSMutableDictionary *)DataDic{
    _DataDic = DataDic;
    NSArray *posterListArr = [DataDic xyValueForKey:@"posterList"];
    [self SetupViews:posterListArr];

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
