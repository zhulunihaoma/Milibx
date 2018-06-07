//
//  AutoBtns.m
//  Cctobz
//
//  Created by 东方斑马 on 2017/3/5.
//  Copyright © 2017年 isu. All rights reserved.
//

#import "AutoBtns.h"

@implementation AutoBtns
-(id)initWitWidthBtnNum:(NSInteger)num Names:(NSArray *)names Imgs:(NSArray *)imgs inView:(UIView *)containerView LRpadding:(CGFloat)LRpadding viewPadding :(CGFloat)viewPadding y:(CGFloat)y titlefont:(NSInteger)font titleColor:(UIColor *)color{

    self =  [super init];
    if (self) {
        
    }

    return self;
}
- (void)setupSubviews {



}
-(void)makeEqualWidthBtnNum:(NSInteger)num Names:(NSArray *)names Imgs:(NSArray *)imgs inView:(UIView *)containerView LRpadding:(CGFloat)LRpadding viewPadding :(CGFloat)viewPadding y:(CGFloat)y titlefont:(NSInteger)font titleColor:(UIColor *)color
{
    NSMutableArray *arr = [NSMutableArray new];
    
    for (int i = 0; i < num; i ++) {
        UIButton *btn = [[UIButton alloc]init];
        btn.userInteractionEnabled= YES;
        btn.backgroundColor = MLNaviColor;
        btn.tag = 6000+i;
        [arr addObject:btn];
        [btn addTarget:containerView action:@selector(BtnBlockpush:) forControlEvents:UIControlEventTouchUpInside];

        
    }
    
    //    NSArray *arrstr = @[@"品牌",@"品牌",@"品牌",@"品牌",@"啦啦啦啦啦",];
    int i = 0;
    
    UIButton *lastView;
    for (UIButton *view in arr) {
        [containerView addSubview:view];
        if (lastView) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(lastView.mas_top);
                make.left.equalTo(lastView.mas_right).offset(viewPadding);
                make.width.equalTo(lastView);
                make.height.mas_equalTo(lastView.mas_width);
                
            }];
        }else
        {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(containerView).offset(LRpadding);
                make.top.mas_equalTo(y);
                make.height.mas_equalTo(view.mas_width);
            }];
            
        }
        
        view.layer.cornerRadius = view.height/2;
        [view setImage:[UIImage imageNamed:imgs[i]] forState:UIControlStateNormal];
        UILabel *lab = [UILabel new];
        [containerView addSubview:lab];
        lab.text = names[i];
        lab.font = [UIFont systemFontOfSize:font];
        lab.textColor = color;
        [lab sizeToFit];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(view.mas_centerX);
            make.centerY.mas_equalTo(view.mas_centerY).offset(35);
            
        }];
        lastView=view;
        i++;

    }
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(containerView).offset(-LRpadding);
    }];
}

-(void)BtnBlockpush:(UIButton *)sender{
    
    if (self.BtnBlock) {
        self.BtnBlock(sender.tag);
    }
}


@end
