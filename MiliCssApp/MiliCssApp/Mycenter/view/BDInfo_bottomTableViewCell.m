//
//  BDInfo_bottomTableViewCell.m
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/28.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "BDInfo_bottomTableViewCell.h"

@implementation BDInfo_bottomTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.separatorImageView.x = 21;
            }
    return self;
}
-(void)setupViews{
    
    // 产品名称
    
    _proname = [[UILabel alloc]init];
    _proname.font = TextFontSize(16);
    _proname.textColor = MLTittleColor;
    _proname.layer.cornerRadius = 2;
    _proname.layer.backgroundColor = COLORWithRGB(0, 125, 125, 0.1).CGColor;
    [self addSubview:_proname];
    _proname.textAlignment = NSTextAlignmentLeft;
    
    
    if (_index == 0) {

            _proname.sd_layout
            .leftSpaceToView(self, 8)
            .rightSpaceToView(self, 14)
            .heightIs(32)
            .topSpaceToView(self, 0);
    }else{
        _proname.sd_layout
        .leftSpaceToView(self, 8)
        .rightSpaceToView(self, 14)
        .heightIs(32)
        .topSpaceToView(self, 21);
    }
    _proname.text = [NSString stringWithFormat:@"    %@", [_ProDic xyValueForKey:@"proxyName"]];
//    // 费率
//
//    _degreelab = [[UILabel alloc]init];
//    _degreelab.font = TextFontSize(14);
//    _degreelab.textColor = MLNaviColor;
//
//    [self addSubview:_degreelab];
//    _degreelab.textAlignment = NSTextAlignmentLeft;
//    _degreelab.sd_layout
//    .leftSpaceToView(self, 43)
//    .topSpaceToView(_proname, 13)
//    .heightIs(17)
//    .centerYEqualToView(self);
//    [_degreelab setSingleLineAutoResizeWithMaxWidth:(300)];
    
    //按钮
    //for循环来创建4个lab
//    NSDictionary *dic = [mUserDefaults objectForKey:KSearchArr];
    
    NSArray *arr = [_ProDic xyValueForKey:@"feeList"];//[dic xyValueForKey:@"arr"];
    UILabel *lastbtn = nil;
    for (int i = 0; i <[arr count]+1; i ++) {
        UILabel *manyBtn =[[HLSLable alloc]init];
        manyBtn.textColor = HLSColor(255, 78, 8);

//        [manyBtn setTitle:ReArr[i] forState:UIControlStateNormal];
//        HLSLog(@"---每个地区的保费%.2f",[[arr[i] xyValueForKey:@"areaFee"] floatValue]);
        manyBtn.textAlignment = NSTextAlignmentLeft;
        if (i == 0) {
            NSString *balance = [NSString stringWithFormat:@"%@:%.2f%@",@"默认推广费",[[_ProDic xyValueForKey:@"defaultFee"]  floatValue],@"%"];
            
            NSMutableAttributedString *aString =  [[NSMutableAttributedString alloc] initWithString: balance];
            
            
            [aString addAttribute:NSForegroundColorAttributeName value:MLDetailColor range:[balance rangeOfString:@"默认推广费:"]];
            

            
            manyBtn.attributedText= aString;
            
            
        }else{
//            manyBtn.text = [NSString stringWithFormat:@"%@:%.2f%@",[arr[i-1] xyValueForKey:@"areaName"],[[arr[i-1] xyValueForKey:@"areaFee"] floatValue],@"%"];
            NSString *balance = [NSString stringWithFormat:@"%@:%.2f%@",[arr[i-1] xyValueForKey:@"areaName"],[[arr[i-1] xyValueForKey:@"areaFee"] floatValue],@"%"];

            NSMutableAttributedString *aString =  [[NSMutableAttributedString alloc] initWithString: balance];
            
            
            
            
            [aString addAttribute:NSForegroundColorAttributeName value:MLDetailColor range:[balance rangeOfString:[NSString stringWithFormat:@"%@:",[arr[i-1] xyValueForKey:@"areaName"]]]];
            
            
            
            
            manyBtn.attributedText= aString;
        }
        [manyBtn sizeToFit];
        manyBtn.tag = 3000+i;

        manyBtn.font = [UIFont systemFontOfSize:Fit6(13)];
        
        [self addSubview:manyBtn];
        manyBtn.layer.cornerRadius = 3;
        HLSLog(@"这里是。。。%f",Fit6(80));
//        manyBtn.width = (SCREEN_WIDTH-Fit6(40))/3;
        manyBtn.backgroundColor = [UIColor whiteColor];
        if (lastbtn.right+6+manyBtn.width+10>SCREEN_WIDTH-10) {
//        if(i%3 ==0 && i !=0){
            manyBtn.y = lastbtn.bottom+5;
            manyBtn.x = Fit6(20);
            
        }else{
            if ( i == 0) {
                manyBtn.x = Fit6(20);
                if (_index == 0) {
                    manyBtn.y = Fit6(42);

                }else{
                    manyBtn.y =Fit6(62);

                }
                
            }else{
                manyBtn.x = lastbtn.right+Fit6(4);
                manyBtn.y = lastbtn.y;
                
            }
            
            
            
            
        }
        
        
        
        lastbtn = manyBtn;
    }
    
    
//  }
}
//-(void)setModel:(NSString *)model{
//    _arealab.text = @"东京";
//    _proname.text = @"  东京旅游保障";
//    _degreelab.text = @"推广费费率:99%";
//
//}
-(void)setProDic:(NSDictionary *)ProDic{
    HLSLog(@"这里是推广城市的列表---%@",ProDic);
    _ProDic = ProDic;

}
-(void)setIndex:(NSInteger)index{
    _index = index;
    [self setupViews];

}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    if (_index == 0) {
        _padding = 0;
    }else{
        _padding = 21;
    }

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
