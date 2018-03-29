//
//  ZLCategoryView.h
//  MiliCssApp
//
//  Created by 朱璐 on 2018/3/29.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "ZLJumpView.h"

@class ZLCategoryView;
@protocol ZLCategoryViewDelegate <NSObject>

-(void)ChoosecategoryWithCategory:(NSString *)Category andIndex:(NSInteger )index;

@end
@interface ZLCategoryView : ZLJumpView
@property(nonatomic,weak)id <ZLCategoryViewDelegate> delegate;
@end
