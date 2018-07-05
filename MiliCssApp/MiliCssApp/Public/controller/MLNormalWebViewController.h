//
//  MLNormalWebViewController.h
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/31.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "PublicViewController.h"
#import "NewsModel.h"

@interface MLNormalWebViewController : PublicViewController
@property(nonatomic,strong)NSString *TittleStr;
@property(nonatomic,strong)NSString *TypeStr;
@property(nonatomic,strong)NSString *UrlStr;
@property(nonatomic,strong)NSString *AllUrlStr;
@property (nonatomic, strong) NewsModel *newsmodel;

@end
