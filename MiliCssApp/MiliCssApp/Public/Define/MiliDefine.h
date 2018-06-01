//
//  MiliDefine.h
//  MiliCssApp
//
//  Created by MLInsurance_huang on 2018/3/22.
//  Copyright © 2018年 zhu. All rights reserved.
//

#ifndef MiliDefine_h
#define MiliDefine_h

#define StatueBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define NaviHeight StatueBarHeight+44
#define NaviLeftPadding 10
#define TabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)

//字体
#define TextFontSize(a) [UIFont systemFontOfSize:(a)]
//获得RGB颜色
//RGB
#define COLORWithRGB(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define HLSColor(r, g, b)\
[UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1.0]

#define HLSOneColor(v) [UIColor colorWithRed:v / 255.0 green:v / 255.0 blue:v / 255.0 alpha:1.0]
#define HLSHexColor(rgbValue)                           [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
/**
 * HLSColor(250, 250, 250)导航灰
 */
#define MLNaviColor HLSColor(75, 220, 69)
/**
 * HLSColor(250, 250, 250)全局颜色
 */
#define MLBGColor HLSColor(237, 242, 238)
//标题颜色
#define MLTittleColor HLSColor(34, 34, 34)
//详情颜色
#define MLDetailColor HLSColor(156, 156, 156)

//获取屏幕宽高
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define kSCREENSIZE [[UIScreen mainScreen] bounds].size
#define iPhone4s kSCREENSIZE.height == 480
#define iPhone5 kSCREENSIZE.width == 320
#define iPhone6 kSCREENSIZE.width == 375
#define iPhone6plus kSCREENSIZE.width == 414
#define Fit6(a) a*(ScreenWidth/375)


//token
#define  TOKEN [NSString stringWithFormat:@"%@",DEF_PERSISTENT_GET_OBJECT(@"token")]/**<token*/

//版本号
#define kVersions @"versions"
#define CurrentVersions [mUserDefaults objectForKey:kVersions]//版本号

//获取用户信息
#define mUserDefaults [NSUserDefaults standardUserDefaults]

#define KUserInfoDic @"userInfoDic"
/**
 *    永久存储对象
 *
 *  NSUserDefaults保存的文件在tmp文件夹里
 *
 *    @param    object      需存储的对象
 *    @param    key         对应的key
 */
#define DEF_PERSISTENT_SET_OBJECT(object, key)                                                                                                 \
({                                                                                                                                             \
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];                                                                          \
[defaults setObject:object forKey:key];                                                                                                    \
[defaults synchronize];                                                                                                                    \
})


/**
 *    取出永久存储的对象
 *
 *    @param    key     所需对象对应的key
 *    @return    key     所对应的对象
 */
#define DEF_PERSISTENT_GET_OBJECT(key)  [[NSUserDefaults standardUserDefaults] objectForKey:key]

//调试模式下输入NSLog，发布后不再输入。
#ifndef __OPTIMIZE__
#define HLSLog(...) NSLog(__VA_ARGS__)
#else
#define HLSLog(...)                                                             \
{}
#endif

#define MLDebugLog       NSLog(@"%s,%d",__func__,__LINE__);

//简单的以AlertView显示提示信息
#define mAlertView(msg)                                                        \
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"      \
message:msg                  \
delegate:nil                  \
cancelButtonTitle:@"确定"            \
otherButtonTitles:nil];                \
[alert show];

//CurrentWindow
#define CurrentWindow [[[[UIApplication sharedApplication] keyWindow] subviews] lastObject]
//
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#endif /* MiliDefine_h */
