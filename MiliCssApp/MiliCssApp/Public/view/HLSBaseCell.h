//
//  HLSBaseCell.h
//  车源网
//
//  Created by k1er on 14/12/25.
//  Copyright (c) 2014年 HORIZON. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLSBaseCell : UITableViewCell

//分割线
@property (nonatomic, strong) UIImageView *separatorImageView;

@property (nonatomic,assign) CGFloat lineHeight;
@property (nonatomic, assign) BOOL Isdeseled; //是否处于编辑状态

@end
