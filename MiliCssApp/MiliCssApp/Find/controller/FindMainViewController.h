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
 栏目Id
 */
@property (nonatomic, strong) NSString *columnId;

@end
