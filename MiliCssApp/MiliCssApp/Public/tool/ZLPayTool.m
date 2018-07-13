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





+(void)payWithalipayWithpayStr:(NSString *)alistr{
    // NOTE: 调用支付结果开始支付
    NSString *appScheme = @"milicssapp";
    [[AlipaySDK defaultService] payOrder:alistr fromScheme:appScheme callback:^(NSDictionary *resultDic) {
        NSLog(@"reslut = %@",resultDic);
    }];
}




@end
