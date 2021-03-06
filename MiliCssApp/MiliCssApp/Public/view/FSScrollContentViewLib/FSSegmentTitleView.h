//
//  FSSegmentTitleView.h
//  FSScrollContentViewDemo
//
//  Created by huim on 2017/5/3.
//  Copyright © 2017年 fengshun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FSSegmentTitleView;

typedef enum : NSUInteger {
    FSIndicatorTypeDefault,//默认与按钮长度相同
    FSIndicatorTypeEqualTitle,//与文字长度相同
    FSIndicatorTypeCustom,//自定义文字边缘延伸宽度
    FSIndicatorTypeGuDing,
    FSIndicatorTypeNone,
} FSIndicatorType;//指示器类型枚举

@protocol FSSegmentTitleViewDelegate <NSObject>

@optional

/**
 切换标题

 @param titleView FSSegmentTitleView
 @param startIndex 切换前标题索引
 @param endIndex 切换后标题索引
 */
- (void)FSSegmentTitleView:(FSSegmentTitleView *)titleView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex;

@end

@interface FSSegmentTitleView : UIView

@property (nonatomic, weak) id<FSSegmentTitleViewDelegate>delegate;

/**
 标题数组，必须传值
 */
@property (nonatomic, strong) NSArray *titlesArr;

/**
 标题文字间距，默认20
 */
@property (nonatomic, assign) CGFloat itemMargin;

/**
 当前选中标题索引，默认0
 */
@property (nonatomic, assign) NSInteger selectIndex;

/**
 标题字体大小，默认15
 */
@property (nonatomic, strong) UIFont *titleFont;

/**
 标题正常颜色，默认black
 */
@property (nonatomic, strong) UIColor *titleNormalColor;

/**
 标题选中颜色，默认red
 */
@property (nonatomic, strong) UIColor *titleSelectColor;

/**
 指示器颜色，默认与titleSelectColor一样,在FSIndicatorTypeNone下无效
 */
@property (nonatomic, strong) UIColor *indicatorColor;

/**
 在FSIndicatorTypeCustom时可自定义此属性，为指示器一端延伸长度，默认5
 */
@property (nonatomic, assign) CGFloat indicatorExtension;

/**
 对象方法创建FSSegmentTitleView

 @param frame frame
 @param delegate delegate
 @param incatorType 指示器类型
 @return FSSegmentTitleView
 */
- (instancetype)initWithFrame:(CGRect)frame delegate:(id<FSSegmentTitleViewDelegate>)delegate indicatorType:(FSIndicatorType)incatorType;

@end
