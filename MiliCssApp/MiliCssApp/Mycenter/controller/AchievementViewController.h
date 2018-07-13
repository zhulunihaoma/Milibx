//
//  AchievementViewController.h
//  MiliCssApp
//
//  Created by Mili_zhu on 2018/3/28.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "PublicTableViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
@protocol JsbridgeProtocol <JSExport>
-(NSString *)getCookie;
@end

@interface AchievementViewController : PublicTableViewController<JsbridgeProtocol>
@property(nonatomic,weak)id<JsbridgeProtocol>delegate;
@end
