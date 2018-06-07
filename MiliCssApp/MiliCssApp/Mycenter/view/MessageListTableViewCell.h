//
//  MessageListTableViewCell.h
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/31.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "HLSBaseCell.h"

@interface MessageListTableViewCell : HLSBaseCell
@property(nonatomic,strong)UIImageView *LeftImg;
@property(nonatomic,strong)UILabel *TittleLab;
@property(nonatomic,strong)UILabel *DesLab;
@property(nonatomic,strong)UILabel *TimeLab;

@end
