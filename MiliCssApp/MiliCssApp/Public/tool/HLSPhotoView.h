//
//  HLSPhotoView.h
//  车源通商家版
//
//  Created by AutoBuy on 15/9/8.
//  Copyright (c) 2015年 HORIZON. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HLSPhotoView;
@protocol HLSPhotoViewDelegate <NSObject>

- (void)photoView:(HLSPhotoView *)photoView clickIndex:(NSInteger)index;
- (void)Deletephoto:(HLSPhotoView *)photoView clickIndex:(NSInteger)index;

@end
@interface HLSPhotoView : UIView

@property (nonatomic,strong) NSMutableArray *photoArr;

@property (nonatomic,strong) UILabel *lable;

@property (nonatomic,weak) id<HLSPhotoViewDelegate> delegate;
@property (nonatomic,strong) UIButton *addPhotoBtn;

- (instancetype)initWithPhotoArr:(NSArray *)photoArr;

@property (nonatomic,assign) BOOL hideAddPhoto;
@property (nonatomic,assign) NSInteger maxNum;
@property (nonatomic,strong) UIButton *Btn1;
@property (nonatomic,strong) UIButton *Btn2;
@property (nonatomic,strong) UIButton *Btn3;
@property (nonatomic,strong) UIButton *Btn4;


@end
