//
//  NewsModel.h
//  MiliCssApp
//
//  Created by 朱璐 on 2018/6/14.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject
@property(nonatomic,copy)NSString *id;/**<新闻id*/
@property(nonatomic,copy)NSString *articleId;/**<新闻id*/


@property(nonatomic,copy)NSString *readNo;/**<阅读数*/
@property(nonatomic,copy)NSString *articleLabel;/**<标签>*/
@property(nonatomic,copy)NSString *imgSmallUrl;/**<小图>*/
@property(nonatomic,copy)NSString *imgBigUrl;/**<大图>*/
@property(nonatomic,copy)NSString *articleTitle;/**<大图>*/
@property(nonatomic,copy)NSString *content;/**<内容>*/

@end
