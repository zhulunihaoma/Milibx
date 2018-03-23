//
//  MiliDefine.h
//  MiliCssApp
//
//  Created by MLInsurance_huang on 2018/3/22.
//  Copyright © 2018年 zhu. All rights reserved.
//

#ifndef MiliDefine_h
#define MiliDefine_h
//获得RGB颜色
#define HLSColor(r, g, b)\
[UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1.0]

#define HLSOneColor(v) [UIColor colorWithRed:v / 255.0 green:v / 255.0 blue:v / 255.0 alpha:1.0]
#define HLSHexColor(rgbValue)                           [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
/**
 * HLSColor(250, 250, 250)导航灰
 */
#define MLNaviColor HLSColor(250, 250, 250)

//获取屏幕宽高
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define kSCREENSIZE [[UIScreen mainScreen] bounds].size
#define iPhone4s kSCREENSIZE.height == 480
#define iPhone5 kSCREENSIZE.width == 320
#define iPhone6 kSCREENSIZE.width == 375
#define iPhone6plus kSCREENSIZE.width == 414
#define Fit6(a) a*(ScreenWidth/375)
#endif /* MiliDefine_h */
