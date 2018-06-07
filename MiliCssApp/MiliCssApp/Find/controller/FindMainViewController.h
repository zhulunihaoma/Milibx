//
//  FindMainViewController.h
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/29.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "PublicTableViewController.h"

@interface FindMainViewController : PublicTableViewController
@property (nonatomic, strong) NSString *titleStr;

/**
 主体类型（资讯，保险公司，保险产品）
 */
@property (nonatomic, strong) NSString *typeStr;
/**
 分类数据（包含分类名和筛选条件数据）
 */
@property (nonatomic, strong) NSDictionary *ChooseDataDic;
@end
