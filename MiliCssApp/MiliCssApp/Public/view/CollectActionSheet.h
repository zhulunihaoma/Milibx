//
//  CollectActionSheet.h
//  车源通
//
//  Created by AutoBuy on 15/5/8.
//  Copyright (c) 2015年 HORIZON. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CollectActionSheet;
@protocol CollectActionSheetDelegate <NSObject>

- (void)collectActionSheet:(CollectActionSheet*)collectActionSheet selectedIndex:(NSInteger)index;

@end
@interface CollectActionSheet : UIView
@property (nonatomic,weak) id<CollectActionSheetDelegate> delegate;

- (instancetype)initWithTitle:(NSString *)title cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray*)titles;

- (void)showInView:(UIView *)view;


@end
