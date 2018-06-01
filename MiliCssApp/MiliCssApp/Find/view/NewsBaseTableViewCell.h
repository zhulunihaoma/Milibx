//
//  NewsBaseTableViewCell.h
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/29.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "HLSBaseCell.h"

@interface NewsBaseTableViewCell : HLSBaseCell
@property(nonatomic,strong)UIImageView *News_img;
@property(nonatomic,strong)UILabel *News_Tag;
@property(nonatomic,strong)UILabel *News_Tittle;

@property(nonatomic,strong)UILabel *News_ReadNum;

@end
