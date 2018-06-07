//
//  MLNoDataView.h
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/31.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLNoDataView : UIView
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *text;
@property (nonatomic,strong) UILabel *detail;

- (instancetype)initWithImageName:(NSString *)imageName text:(NSString *)text detailText:(NSString *)detailText buttonTitle:(NSString *)buttonTitle;
@end
