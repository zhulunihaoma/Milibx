//
//  HLSPhotoView.m
//  车源通商家版
//
//  Created by AutoBuy on 15/9/8.
//  Copyright (c) 2015年 HORIZON. All rights reserved.
//

#import "HLSPhotoView.h"
#import "UIButton+WebCache.h"

@interface HLSPhotoView ()


@property (nonatomic,strong) NSMutableArray *photoBtnArr;

@end
@implementation HLSPhotoView
- (instancetype)initWithPhotoArr:(NSArray *)photoArr
{
    self = [super init];
    if (self) {
        self.photoBtnArr = [NSMutableArray array];
        if (photoArr) {
            self.photoArr = [NSMutableArray arrayWithArray:photoArr];
        }else {
            self.photoArr = [NSMutableArray array];
        }
        
        [self setupSubviews];
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.photoArr = [NSMutableArray array];
        self.photoBtnArr = [NSMutableArray array];
        [self setupSubviews];
    }
    return self;
}
- (void)setupSubviews {
    UIButton *addPhotoBtn = [[UIButton alloc]init];
    [addPhotoBtn setImage:[UIImage imageNamed:@"btn_feedback_photoadd"] forState:UIControlStateNormal];
    [addPhotoBtn addTarget:self action:@selector(clickPhoto:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.addPhotoBtn = addPhotoBtn];
    
    UILabel *label = [[UILabel alloc]init];
    label.textColor = MLDetailColor;
    [self addSubview:self.lable = label];
    
    
}
- (void)setPhotoArr:(NSMutableArray *)photoArr {
    _photoArr = photoArr;
    for (UIButton *btn in self.photoBtnArr) {
        [btn removeFromSuperview];
    
    }
    [self.photoBtnArr removeAllObjects];
    for (int i = 0; i < photoArr.count; i++) {
        NSString *imageUrl = photoArr[i];
        if (imageUrl.length == 0) {
            continue;
        }
        UIButton *btn = [[UIButton alloc]init];
        btn.clipsToBounds = YES;
        btn.tag = i + 1;
        
        
        [btn sd_setImageWithURL:URLWith(imageUrl) forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"morencheyuan"]];
        btn.contentMode = UIViewContentModeScaleAspectFill;
        [btn addTarget:self action:@selector(clickPhoto:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [self.photoBtnArr addObject:btn];
        
//        红色的叉号
        UIButton *btn_close = [[UIButton alloc]init];
        btn_close.clipsToBounds = YES;
        btn_close.tag = i + 1;
        [btn_close setImage:[UIImage imageNamed:@"btn_feedback_photodelete"] forState:UIControlStateNormal];
        btn_close.contentMode = UIViewContentModeScaleAspectFill;
        [btn_close addTarget:self action:@selector(DeletePhoto:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn_close];
        btn_close.x = 80+100*i;
        btn_close.y = 0;
        btn_close.width = 16;
        btn_close.height = 16;

        [self bringSubviewToFront:btn_close];

//        [btn.photoBtnArr addObject:btn_close];
    }
}

/**
 *  添加新照片
 */
- (void)clickPhoto:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(photoView:clickIndex:)]) {
        [self.delegate photoView:self clickIndex:btn.tag];
    }
}
/**
 *  删除照片
 */
- (void)DeletePhoto:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(photoView:clickIndex:)]) {
        [self.delegate Deletephoto:self clickIndex:btn.tag];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.addPhotoBtn.width = 90;
    self.addPhotoBtn.height = 90;
    
      for (int i = 0; i < self.photoBtnArr.count; i++) {
        UIButton *btn = self.photoBtnArr[i];
        btn.width = 90;
        btn.height = btn.width;
        btn.x = i * (10 + btn.width);
    }
    [UIView animateWithDuration:0.3 animations:^{
        self.addPhotoBtn.x = self.photoBtnArr.count * (10 + self.addPhotoBtn.width);
        self.lable.x = 0;
    }];
    self.lable.height = 30;

    self.lable.y = self.addPhotoBtn.height + 10;
    self.lable.width = self.width-self.addPhotoBtn.width-10;
    self.lable.numberOfLines = 0;
    
//
//    if (self.photoBtnArr.count > 0) {
//        self.lable.hidden = YES;
//    }else {
//        self.lable.hidden = NO;
//    }
    if (self.photoBtnArr.count > 2) {
        self.addPhotoBtn.hidden = YES;
        
    }else {
        self.addPhotoBtn.hidden = NO;
        
    }
    if (self.hideAddPhoto) {
        self.addPhotoBtn.hidden = YES;
    }
}
@end
