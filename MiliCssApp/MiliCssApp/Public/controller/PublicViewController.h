//
//  PublicViewController.h
//  板车通
//
//  Created by k1er on 15/3/11.
//  Copyright (c) 2015年 horizon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "HLSNoDataView.h"
#import "CustomNavigation.h"
#import "HomeInfolistViewController.h"
@interface PublicViewController : UIViewController
//设置自定义视图
@property (nonatomic,strong) CustomNavigation *navigationView;
@property (nonatomic, assign) BOOL isMore;

@property (nonatomic, strong) MBProgressHUD *HUD;
@property (nonatomic, strong) UIButton *moreBtn;

- (void)back;
- (void)clickRightBtn;

@end
