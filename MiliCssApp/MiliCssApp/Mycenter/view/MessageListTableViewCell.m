//
//  MessageListTableViewCell.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/31.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "MessageListTableViewCell.h"

@implementation MessageListTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        self.backgroundColor = [UIColor whiteColor];
        self.separatorImageView.hidden = YES;
        self.layer.cornerRadius = 8;
        self.layer.masksToBounds = YES;
    }
    return self;
}
-(void)setupViews{
//左侧图片
    self.LeftImg = [[UIImageView alloc]init];
    self.LeftImg.image = [UIImage imageNamed:@"ico_message_1"];
    [self addSubview:self.LeftImg];
    self.LeftImg.sd_layout
    .heightIs(45)
    .widthIs(45)
    .leftSpaceToView(self, 15)
    .centerYEqualToView(self);
//    红色点
    self.Redimg = [[UIImageView alloc]init];
    [self.LeftImg addSubview:self.Redimg];
    self.Redimg.sd_layout
    .heightIs(10)
    .widthIs(10)
    .rightSpaceToView(self.LeftImg, -5)
    .topSpaceToView(self.LeftImg, -5);
    
    
    // 名称
    _TittleLab = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:self];
    _TittleLab.sd_layout
    .heightIs(17)
    .topSpaceToView(self, 20)
    .leftSpaceToView(self.LeftImg, 11);
    [_TittleLab setSingleLineAutoResizeWithMaxWidth:(200)];
    
    _TittleLab.text = @"";
    
    // time
    _TimeLab = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLDetailColor WithFatherView:self];
    _TimeLab.sd_layout
    .heightIs(12)
    .topSpaceToView(self, 23)
    .rightSpaceToView(self, 13);
    [_TimeLab setSingleLineAutoResizeWithMaxWidth:(80)];
    
    _TimeLab.text = @"18/05/18";
    
    // des
    _DesLab = [HLSLable LabelWithFont:12 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLDetailColor WithFatherView:self];
    _DesLab.sd_layout
    .heightIs(12)
    .topSpaceToView(_TittleLab, 12)
    .leftEqualToView(_TittleLab)
    .rightSpaceToView(self, 21);
    
    _DesLab.text = @"";
}
-(void)setModel:(MessageModel *)Model{
    _Model = Model;
    NSString *Typeimg;
    switch ([Model.infoType integerValue]) {
        case 1:
            Typeimg = @"ico_message_1";
            break;
        case 2:
            Typeimg = @"ico_message_3";
            break;
        case 3:
            Typeimg = @"ico_message_4";
            break;
        case 4:
            Typeimg = @"ico_message_5";
            break;
        case 5:
            Typeimg = @"ico_message_2";
            break;
        default:
            break;
    }
    if (Model) {
        NSString *string = Model.gmtCreate;
        
        // 日期格式化类
        
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        
        // 设置日期格式 为了转换成功
        
        format.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        
        // NSString * -> NSDate *
        
        NSDate *data = [format dateFromString:string];
        
//        NSString *newString = [format stringFromDate:data];
       
        NSInteger timeSpxx = [[NSNumber numberWithDouble:[data timeIntervalSince1970]] integerValue];

        
        NSDate *datenow = [NSDate date];//现在时间
        //时间转时间戳的方法:
        
        
        NSInteger timeSp = [[NSNumber numberWithDouble:[datenow timeIntervalSince1970]] integerValue];
        
        NSLog(@"设备当前的时间戳:%ld",(long)timeSp); //时间戳的值
        NSLog(@"消息时间戳:%ld",(long)timeSpxx); //时间戳的值
        NSInteger timeSpcc = timeSp-timeSpxx;
        if (timeSpcc < 86400) {
            _TimeLab.text = @"今天";

        }else if (timeSpcc < 172800){
            _TimeLab.text = @"昨天";

        }else if (timeSpcc < 259200){
            _TimeLab.text = @"2天前";
            
        }else if (timeSpcc < 345600){
            _TimeLab.text = @"3天前";
            
        }else{
            _TimeLab.text = [[Model.gmtCreate substringToIndex:10] stringByReplacingOccurrencesOfString:@"-" withString:@"/"];

        }

        _TittleLab.text = Model.infoTitle;
        _DesLab.text = Model.infoContent;
        self.LeftImg.image = [UIImage imageNamed:Typeimg];
        if ([Model.status integerValue] == 1) {
            self.Redimg.image = [UIImage imageNamed:@"img_newmessage"];

        }
    }
    
}
#pragma mark - 将某个时间转化成 时间戳

+(NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format{
    
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    
    
    
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    
    //时间转时间戳的方法:
    
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue];
    
    
    
    NSLog(@"将某个时间转化成 时间戳&&&&&&&timeSp:%ld",(long)timeSp); //时间戳的值
    
    
    
    return timeSp;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
