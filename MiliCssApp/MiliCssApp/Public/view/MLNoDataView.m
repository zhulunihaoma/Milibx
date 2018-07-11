//
//  MLNoDataView.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/31.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "MLNoDataView.h"

@implementation MLNoDataView

- (instancetype)initWithImageName:(NSString *)imageName text:(NSString *)text detailText:(NSString *)detailText buttonTitle:(NSString *)buttonTitle {
    self = [super init];
    if (self) {
        
        CGFloat y ;
        if (iPhone6||iPhone5) {
            y = 50;
        }else{
            y = 100;

        }
        
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:imageName];
        [imageView sizeToFit];
        imageView.centerX = kSCREENSIZE.width / 2;
        imageView.y = y;
        [self addSubview:imageView];
        
        y = imageView.bottom + 5;
        
        UILabel *textLabel = [[UILabel alloc]init];
        textLabel.text = text;
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.textColor = MLDetailColor;
        textLabel.font = [UIFont systemFontOfSize:17];
        [textLabel sizeToFit];
        textLabel.width = kSCREENSIZE.width - 20;
        textLabel.centerX = SCREEN_WIDTH / 2;
        textLabel.y = y;
        textLabel.height = 20;
        [self addSubview:self.text = textLabel];
        
        y = textLabel.bottom + 10;
        
        if (detailText.length > 0) {
            UILabel *detailTextLabel = [[UILabel alloc]init];
            detailTextLabel.textAlignment = NSTextAlignmentCenter;
            detailTextLabel.text = detailText;
            detailTextLabel.textColor = MLDetailColor;
            detailTextLabel.font = [UIFont systemFontOfSize:15];
            [detailTextLabel sizeToFit];
            detailTextLabel.width = kSCREENSIZE.width - 20;
            detailTextLabel.centerX = kSCREENSIZE.width / 2;
            detailTextLabel.y = y;
            [self addSubview:detailTextLabel = self.detail];
            y = detailTextLabel.bottom + 15;
        }
        
        
        if (buttonTitle.length > 0) {
              y = imageView.bottom ;
            UIButton *button = [[UIButton alloc]init];
            [button setTitle:buttonTitle forState:UIControlStateNormal];
            
            [button setTitleColor:MLDetailColor forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"btn_refresh"] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:16];
//            button.layer.cornerRadius = 3;
//            button.layer.borderWidth = 0.5f;
            button.layer.borderColor = MLTittleColor.CGColor;
            button.y = y;
            button.width = 250;
            button.height = 40;
            button.centerX = kSCREENSIZE.width / 2;
            [self addSubview:self.button = button];
        }
        
    }
    return self;
    
    
    
}

@end
