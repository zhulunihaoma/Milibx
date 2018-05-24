//
//  JSONTool.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/23.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "JSONTool.h"

@implementation JSONTool
+ (NSString*)dictionaryToJson:(NSDictionary *)dic

{
 
        NSError *error;
        
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
        
        NSString *jsonString;
        
        if (!jsonData) {
            
            NSLog(@"%@",error);
            
        }else{
            
            jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
            
        }
        
        NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
        
        NSRange range = {0,jsonString.length};
        
        //去掉字符串中的空格
        
        [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
        
        NSRange range2 = {0,mutStr.length};
        
        //去掉字符串中的换行符
        
        [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
        
        return mutStr;
        
    
    
}
@end
