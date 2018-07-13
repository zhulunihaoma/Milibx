//
//  BDInfoModel.h
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/27.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDInfoModel : NSObject
@property(nonatomic,copy)NSString *policyAmount;/**<保费总额*/

@property(nonatomic,copy)NSString *prmAmount;/**<总推广费*/
@property(nonatomic,copy)NSString *selfPrmAmount;/**<净推广费>*/
@property(nonatomic,copy)NSString *merchantName;/**<代理人名称>*/


@end
