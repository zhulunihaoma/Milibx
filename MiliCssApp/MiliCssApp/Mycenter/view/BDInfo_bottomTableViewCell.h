//
//  BDInfo_bottomTableViewCell.h
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/28.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "HLSBaseCell.h"

@interface BDInfo_bottomTableViewCell : HLSBaseCell
@property (nonatomic, strong)UILabel *arealab;
@property (nonatomic, strong)UILabel *proname;
@property (nonatomic, strong)UILabel *degreelab;


@property (nonatomic, strong)NSDictionary *ProDic;
@property (nonatomic, assign)NSInteger index;
@property(nonatomic,assign)NSInteger padding;


@end
