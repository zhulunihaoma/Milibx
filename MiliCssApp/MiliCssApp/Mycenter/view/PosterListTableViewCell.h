//
//  PosterListTableViewCell.h
//  MiliCssApp
//
//  Created by 朱璐 on 2018/6/4.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "HLSBaseCell.h"

@interface PosterListTableViewCell : HLSBaseCell
@property(nonatomic,strong)UIScrollView *PosterScrollView;
@property(nonatomic,strong)NSMutableDictionary *DataDic;
@end
