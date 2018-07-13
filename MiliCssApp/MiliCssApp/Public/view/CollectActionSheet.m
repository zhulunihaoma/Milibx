//
//  CollectActionSheet.m
//  车源通
//
//  Created by AutoBuy on 15/5/8.
//  Copyright (c) 2015年 HORIZON. All rights reserved.
//

#import "CollectActionSheet.h"


@interface CollectActionSheet ()
@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) UIView *topView;

@property (nonatomic, strong) UIView *itemView;

@property (nonatomic,strong) NSArray *titlesArr;

@property (nonatomic,strong) NSString *cancelTitle;
@end
@implementation CollectActionSheet
{
    CGFloat _itemHeight;
    NSInteger _section;
}
- (instancetype)initWithTitle:(NSString *)title cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray*)titles
{
    if (self = [super init]) {
        self.title = title;
        self.cancelTitle = cancelTitle;
        self.titlesArr = titles;
    }
    
    _itemHeight = 50;
    [self setup];
    return self;
}

- (void)setup
{
    [self initTopView];
    [self initItemsView];
}

- (void)initTopView
{
    self.frame = CGRectMake(0, 0, kSCREENSIZE.width, kSCREENSIZE.height);
    self.backgroundColor = [UIColor clearColor];
    UIView *topView = [[UIView alloc] initWithFrame:self.bounds];
    topView.backgroundColor = [UIColor blackColor];
    topView.alpha = 0;
    [self addSubview:_topView = topView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancel)];
    [topView addGestureRecognizer:tap];
}

- (void)showInView:(UIView *)view
{
//    [CurrentWindow addSubview:self];//当前window会失去第一响应者
    [view addSubview:self];

    [UIView animateWithDuration:0.4 animations:^{
        self.y = 0;
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 animations:^{
            self.topView.alpha = 0.3;
        }];
    }];
}

- (void)setDelegate:(id<CollectActionSheetDelegate>)delegate
{
    _delegate = delegate;
    [self initItems];
}


- (void)initItemsView
{
    CGFloat height = _itemHeight * (self.titlesArr.count + 1) + 10 + (self.title.length == 0 ? 0 : _itemHeight);
    self.itemView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - height, kSCREENSIZE.width, height)];
    
    [self addSubview:self.itemView];
    [self initItems];
}

- (void)initItems
{
    int height = 0;
    if (self.title.length > 0) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width, _itemHeight)];
        label.backgroundColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:13];
        label.text = self.title;
        label.textColor = HLSColor(102, 102, 102);
        [self.itemView addSubview:label];
        
        height += 50;
        
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, height, label.width, 1)];
        view1.backgroundColor = HLSColor(244, 244, 244);
        [self.itemView addSubview:view1];
        height += 1;
    }
    
    for (int i = 0; i < self.titlesArr.count; i++) {
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, height, self.width, _itemHeight)];
        button.backgroundColor = [UIColor whiteColor];
        [button setTitle:self.titlesArr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        button.tag = i + 1;
        [button addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.itemView addSubview:button];
        height += 50;
        
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, height, self.width, 1)];
        view1.backgroundColor = HLSColor(244, 244, 244);
        [self.itemView addSubview:view1];
        height += 1;
    }
    
    
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, height, self.width, 10)];
    view2.backgroundColor = HLSColor(244, 244, 244);
    [self.itemView addSubview:view2];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, view2.bottom, self.width, _itemHeight)];
    button1.backgroundColor = [UIColor whiteColor];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 setTitle:self.cancelTitle forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont systemFontOfSize:15];
    button1.tag = 0;
    [button1 addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.itemView addSubview:button1];
}

- (void)initItemsWithSection
{
    
}

- (void)cancel
{
    [UIView animateWithDuration:0.25 animations:^{
        self.topView.alpha = 0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 animations:^{
            self.y = kSCREENSIZE.height - 64;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }];
    
}


- (void)clickBtn:(UIButton *)btn
{
    [self cancel];
    if ([self.delegate respondsToSelector:@selector(collectActionSheet:selectedIndex:)]) {
        [self.delegate collectActionSheet:self selectedIndex:btn.tag];
    }
}



@end
