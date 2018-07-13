//
//  ZLCategoryView.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/3/29.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "ZLCategoryView.h"


@interface ZLCategoryView ()<UIPickerViewDataSource,UIPickerViewDelegate>
{
    
    UIPickerView *pickerView;
    NSMutableString *category;
}
@end
@implementation ZLCategoryView
-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupPicker];
        category = [NSMutableString new];
        
    }
    return self;
    
}

-(void)setupPicker{
    pickerView  = [[UIPickerView alloc]init];
    [self addSubview:pickerView];
    [pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(@30);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH , 150));
    }];
    pickerView.delegate = self;
    pickerView.dataSource = self;
}



-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.dataArr count];
    
    
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.dataArr objectAtIndex:row];
    
}
-(void)Finish{
    [self downView];
    NSInteger selectedindex = [pickerView selectedRowInComponent:0];
    category  = self.dataArr[selectedindex];
    [self.delegate ChoosecategoryWithCategory:category andIndex:selectedindex+1];
}


@end
