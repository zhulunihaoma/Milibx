//
//  Home_ToolsTableViewCell.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/28.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "Home_ToolsTableViewCell.h"
#import "MLNormalWebViewController.h"
#import "LoginViewController.h"
@implementation Home_ToolsTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        
        
        self.separatorImageView.hidden = YES;
    }
    return self;
}
-(void)setupViews{

    UILabel *ToolsTittle = [HLSLable LabelWithFont:16 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:self];
    [self addSubview:ToolsTittle];
    ToolsTittle.text = @"服务工具";
    ToolsTittle.sd_layout
    .leftSpaceToView(self, 17)
    .topSpaceToView(self, 20)
    .heightIs(20);
    [ToolsTittle setSingleLineAutoResizeWithMaxWidth:100];
    
//    //拿到当前视图准备好的画板
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    //利用path进行绘制三角形
//    CGContextBeginPath(context);//标记
//
//
//    CGFloat startX =  20;
//    CGFloat startY = 10;
//    CGContextMoveToPoint(context, startX, startY);//设置起点
//
//    CGContextAddLineToPoint(context, startX + 10, startY - 10);
//
//    CGContextAddLineToPoint(context, startX + 20, startY);
//
//
//    CGContextClosePath(context);//路径结束标志，不写默认封闭
//
//    [[UIColor redColor] setFill]; //设置填充色
//   [[UIColor redColor] setStroke];
//
//    CGContextDrawPath(context, kCGPathFillStroke);//绘制路径path
    
//    //定义画图的path
//
//    UIBezierPath *path = [[UIBezierPath alloc] init];
//
//    CGRect rect = CGRectMake(0, 10, 30, 30);
//
//    //path移动到开始画图的位置
//
//    [path moveToPoint:CGPointMake(rect.origin.x, rect.origin.y)];
//
//    //从开始位置画一条直线到（rect.origin.x + rect.size.width， rect.origin.y）
//
//    [path addLineToPoint:CGPointMake(rect.origin.x + rect.size.width, rect.origin.y)];
//
//    //再从rect.origin.x + rect.size.width， rect.origin.y））画一条线到(rect.origin.x + rect.size.width/2, rect.origin.y + rect.size.height)
//
//    [path addLineToPoint:CGPointMake(rect.origin.x + rect.size.width/2, rect.origin.y + rect.size.height)];
//
//
//
//    //关闭path
//
//    [path closePath];
//
//
//
//    //三角形内填充颜色
//
//    [[UIColor redColor] setFill];
//
//
//
//    [path fill];
    [AddTittleBG AddTittleBGWithTittlelab:ToolsTittle];

    
    

    UIScrollView *ToolsScrollView = [[UIScrollView alloc]init];
    [self addSubview:ToolsScrollView];
    ToolsScrollView.sd_layout
    .leftSpaceToView(self, 12)
    .rightSpaceToView(self, 12)
    .topSpaceToView(ToolsTittle, 15)
    .heightIs(102)
    .widthIs(SCREEN_WIDTH-24);
    ToolsScrollView.contentSize = CGSizeMake((167*3)-10, 85);
    ToolsScrollView.backgroundColor = [UIColor whiteColor];
    ToolsScrollView.showsHorizontalScrollIndicator = NO;
    UIImageView *Lipei = [[UIImageView alloc] init];
//    Lipei.backgroundColor = MLNaviColor;
    Lipei.image = [UIImage imageNamed:@"ico_home_4"];
    [ToolsScrollView addSubview:Lipei];
    Lipei.sd_layout
    .leftSpaceToView(ToolsScrollView, 0)
    .topSpaceToView(ToolsScrollView, 0)
    .heightIs(102)
    .widthIs((SCREEN_WIDTH-24)/3);
    // 理赔跳转
    UITapGestureRecognizer * tapLipei = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapLipei)];
    [Lipei addGestureRecognizer:tapLipei];
    Lipei.userInteractionEnabled = YES;
    
    UIImageView *GongLue = [[UIImageView alloc] init];
//    GongLue.backgroundColor = MLNaviColor;
    GongLue.image = [UIImage imageNamed:@"ico_home_5"];
    [ToolsScrollView addSubview:GongLue];
    GongLue.sd_layout
    .leftSpaceToView(Lipei, 0)
    .topSpaceToView(ToolsScrollView, 0)
    .heightIs(102)
    .widthIs((SCREEN_WIDTH-24)/3);
//    订单数量
    _ordernum = [HLSLable LabelWithFont:23 WithTextalignment:NSTextAlignmentLeft WithTextColor:MLTittleColor WithFatherView:GongLue];
   
   
//    ordernum.text = @"1笔";
    _ordernum.sd_layout
    .leftSpaceToView(GongLue, 18)
    .topSpaceToView(GongLue, 38)
    .widthIs(100)
    .maxHeightIs(30)
    .autoHeightRatio(0);
    
    // 订单跳转
    UITapGestureRecognizer * tapGongLue = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGongLue)];
    [GongLue addGestureRecognizer:tapGongLue];
    GongLue.userInteractionEnabled = YES;
    
    
    
    UIImageView *MyOrder = [[UIImageView alloc] init];
    MyOrder.image = [UIImage imageNamed:@"ico_home_6"];
//    MyOrder.backgroundColor = MLNaviColor;
    [ToolsScrollView addSubview:MyOrder];
    MyOrder.sd_layout
    .leftSpaceToView(GongLue, 0)
    .topSpaceToView(ToolsScrollView, 0)
    .heightIs(102)
    .widthIs((SCREEN_WIDTH-24)/3);
    // 订单跳转
    UITapGestureRecognizer * tapMyOrder = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapMyOrder)];
    [MyOrder addGestureRecognizer:tapMyOrder];
    MyOrder.userInteractionEnabled = YES;
}
-(void)setDataDic:(NSDictionary *)dataDic{
//    _dataDic = dataDic;orderNum
    NSString *stringnum = [NSString stringWithFormat:@"%@",[dataDic xyValueForKey:@"orderNum"]];

    NSString *string = [NSString stringWithFormat:@"%@笔",stringnum];
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:string];
    NSUInteger length = [string length];
    [attrString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:13] range:NSMakeRange(0, length)];//设置所有的字体
    UIFont *boldFont = [UIFont boldSystemFontOfSize:23];
    [attrString addAttribute:NSFontAttributeName value:boldFont range:[string rangeOfString:stringnum]];//设置Text这四个字母的字体为粗体
    _ordernum.attributedText = attrString;
    
}
//点击理赔
-(void)tapLipei{
    MLNormalWebViewController *vc = [MLNormalWebViewController new];
    vc.UrlStr = @"/product/claim";
    [[GetUnderController getvcwithtarget:self].navigationController pushViewController:vc animated:YES];
    
}
//点击订单列表
-(void)tapGongLue{
    if (![HLSPersonalInfoTool getCookies]) {
        
        LoginViewController *lvc = [[LoginViewController alloc]init];
        UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:lvc];
        nvc.navigationBarHidden = YES;
        [[GetUnderController getvcwithtarget:self] presentViewController:nvc animated:YES completion:nil];
        
    }else{
    MLNormalWebViewController *vc = [MLNormalWebViewController new];
    vc.UrlStr = @"/order/agentOrder";
    [[GetUnderController getvcwithtarget:self].navigationController pushViewController:vc animated:YES];
    }
}
//点击攻略
-(void)tapMyOrder{
      [GetUnderController getvcwithtarget:self].tabBarController.selectedIndex = 1;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"milisay" object:self];

}
-(void)initscrollView{
  
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
