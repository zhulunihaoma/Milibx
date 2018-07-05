//
//  ZLPayTool.h
//  Cctobz
//
//  Created by 东方斑马 on 2017/6/17.
//  Copyright © 2017年 isu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZLPayTool : NSObject
+(void)AliPayWithOrderStr:(NSString *)oderno WithPrice:(NSString *)price;
+(void)payWithalipayWithpayStr:(NSString *)alistr;
#pragma mark -- 微信支付
+(void)wxpayrequestwithDic:(NSDictionary *)wxDic;
+(void)wxpayWithorderno:(NSString *)orderno;
//支付宝充值
+(void)AliPayBalanceWithcost:(NSString *)cost;
//微信充值
+(void)WechatBalanceWithcost:(NSString *)cost;
@end
