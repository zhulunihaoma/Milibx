//
//  AddCell.h
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/28.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "HLSBaseCell.h"

@interface AddCell : HLSBaseCell
@property (nonatomic, strong)UILabel *titlelab;
@property (nonatomic, strong)UITextField *inputfield;
@property (nonatomic, strong)UITextField *choosefild;
@property (nonatomic, strong)UIImageView *arrow;

@property (nonatomic, assign)BOOL Ischoose;

@end
