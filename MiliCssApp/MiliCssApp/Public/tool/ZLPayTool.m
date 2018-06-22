//
//  ZLPayTool.m
//  Cctobz
//
//  Created by 东方斑马 on 2017/6/17.
//  Copyright © 2017年 isu. All rights reserved.
//

#import "ZLPayTool.h"
#import <AlipaySDK/AlipaySDK.h>
#import "WXApi.h"
#import "WXApiObject.h"
@implementation ZLPayTool
//+(void)AliPayWithOrderStr:(NSString *)oderno WithPrice:(NSString *)price{
//
//    [BZWHttpTool PostalipayorderStringWithorderNo:oderno pay:price Success:^(NSDictionary *dic) {
//
//        if ([dic[@"ok"] boolValue]) {
////            [HLSLable lableWithText:@"qingqiu成功"];
//          NSString *alistr = [[dic xyValueForKey:@"res"] xyValueForKey:@"orderString"];
//            [self payWithalipayWithpayStr:alistr];//请求支付宝支付信息后才能发起支付宝支付
//
//
//        }else{
//
//            [HLSLable lableWithText:dic[@"message"]];
//            return ;
//        }
//
//    } failure:^(NSError *error) {
//
//    }];
//}
//
//
//
//
//
//
//+(void)payWithalipayWithpayStr:(NSString *)alistr{
//    // NOTE: 调用支付结果开始支付
//    NSString *appScheme = @"bzwuser";
//
//    [[AlipaySDK defaultService] payOrder:alistr fromScheme:appScheme callback:^(NSDictionary *resultDic) {
//        NSLog(@"reslut = %@",resultDic);
//    }];
//}
//
//
//#pragma mark -- 微信支付
//
//+(void)wxpayWithorderno:(NSString *)orderno{
//    [BZWHttpTool PostwechatpayorderStringWithorderNo:orderno Success:^(NSDictionary *dic) {
//
//        if ([dic[@"ok"] boolValue]) {
//
//            [self wxpayrequestwithDic:[dic xyValueForKey:@"res"]];
//
//        }else{
//
//            [HLSLable lableWithText:dic[@"message"]];
//            return ;
//        }
//
//    } failure:^(NSError *error) {
//
//    }];
//
//
//
//}
//
//+(void)wxpayrequestwithDic:(NSDictionary *)wxDic{
//    NSMutableString *stamp  = [wxDic objectForKey:@"timestamp"];
//    NSInteger time =  stamp.intValue/1000;
//
//
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    formatter.dateFormat = @"YYYY-MM-dd HH:mm:ss";
//    NSDate *date = [[NSDate alloc] init];
//    NSString *datestr = [formatter stringFromDate:date];
//    NSLog(@"%@",datestr);
//    NSInteger numtime = date.timeIntervalSince1970;
//    NSString *numtimestr = [NSString stringWithFormat:@"%ld",numtime];
//    NSLog(@"%@",numtimestr);
//    // 数字时间转化为时间戳,如果为13位,除以1000,或者去掉后3位即可
//    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:numtime];
//    NSString *datestr2 = [formatter stringFromDate:date2];
//
//
//
//    PayReq *request = [[PayReq alloc] init];
//    request.partnerId = [wxDic xyValueForKey:@"partnerid"];
//    request.prepayId= [wxDic xyValueForKey:@"prepayid"];
//    request.package = [wxDic xyValueForKey:@"package"];
//    request.nonceStr= [wxDic xyValueForKey:@"noncestr"];
//    request.timeStamp = stamp.intValue;
//    request.sign= [wxDic xyValueForKey:@"sign"];
//   // request.appID = [wxDic xyValueForKey:@"appid"];
//    [WXApi sendReq:request];
//}
////支付宝充值
//+(void)AliPayBalanceWithcost:(NSString *)cost{
//    [BZWHttpTool PostalipaypayBalanceWithuserType:nil userId:nil uid:[HLSPersonalInfoTool getUid] cost:cost Success:^(NSDictionary *dic) {
//        if ([dic[@"ok"] boolValue]) {
////            [HLSLable lableWithText:@"qingqiu成功"];
//            NSString *alistr = [[dic xyValueForKey:@"res"] xyValueForKey:@"orderString"];
//            [self payWithalipayWithpayStr:alistr];//请求支付宝支付信息后才能发起支付宝支付
//
//
//        }else{
//
//            [HLSLable lableWithText:dic[@"message"]];
//            return ;
//        }
//
//    } failure:^(NSError *error) {
//
//    }];
//}
//
////微信充值
//+(void)WechatBalanceWithcost:(NSString *)cost{
//    [BZWHttpTool PostwechatpayBalanceWithuserType:nil userId:nil uid:[HLSPersonalInfoTool getUid] cost:cost Success:^(NSDictionary *dic) {
//        if ([dic[@"ok"] boolValue]) {
//
//            [self wxpayrequestwithDic:[dic xyValueForKey:@"res"]];
//
//        }else{
//
//            [HLSLable lableWithText:dic[@"message"]];
//            return ;
//        }
//    } failure:^(NSError *error) {
//
//    }];
//
//}

@end
