//
//  BDCenterTopTableViewCell.h
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/27.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "HLSBaseCell.h"
#import "BDInfoModel.h"
@interface BDCenterTopTableViewCell : HLSBaseCell
@property (nonatomic, strong)UILabel *uname;
@property (nonatomic, strong)UILabel *MyPhone;

@property (nonatomic, strong)UILabel *account;
@property (nonatomic, strong)UILabel *state;

@property (nonatomic, strong)UIImageView *leftimg;
@property (nonatomic, strong)UILabel *titlelab;
@property (nonatomic, strong)UILabel *policyAmount;
@property (nonatomic, strong)UILabel *prmAmount;
@property (nonatomic, strong)UILabel *selfPrmAmount;
@property (nonatomic, strong)UILabel *UnreadNum;
@property (nonatomic, strong) NSTimer *balanceLabelAnimationTimer;
@property (nonatomic, strong)UIButton *seebtn;

@property (nonatomic, strong)BDInfoModel *Model;
@end
