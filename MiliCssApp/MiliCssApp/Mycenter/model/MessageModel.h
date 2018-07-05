//
//  MessageModel.h
//  MiliCssApp
//
//  Created by 朱璐 on 2018/6/25.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject
@property(nonatomic,copy)NSString *id;/**<新闻id*/
@property(nonatomic,copy)NSString *infoType;/**<消息类型>*/

@property(nonatomic,copy)NSString *infoTitle;/**<阅读数*/
@property(nonatomic,copy)NSString *infoContent;/**<消息内容>*/
@property(nonatomic,copy)NSString *status;/**<消息状态 1未读  0已读>*/
@property(nonatomic,copy)NSArray *appInfoContentlist;/**<消息内容列表>*/


@property(nonatomic,copy)NSString *gmtCreate;/**<时间>*/
//@property(nonatomic,copy)NSString *articleTitle;/**<大图>*/
@end
