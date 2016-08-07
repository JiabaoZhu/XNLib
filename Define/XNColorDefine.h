//
//  ColorDefine.h
//  IM
//
//  Created by Jiabao on 16/6/25.
//  Copyright © 2016年 Jiabao. All rights reserved.
//

#ifndef ColorDefine_h
#define ColorDefine_h

#import <Foundation/Foundation.h>

#pragma mark - 颜色的RGBA转换
#define COLOR_RGBA(redValue, greenValue, blueValue, alphaValue)     \
    [UIColor colorWithRed:(redValue / 255.0f)                       \
                    green:(greenValue / 255.0f)                     \
                     blue:(blueValue / 255.0f)                      \
                    alpha:alphaValue]
#define COLOR_RGBA_0X(rgbValue, alphaValue)           \
    COLOR_RGBA(((rgbValue >> 16) & 0xFF), ((rgbValue >> 8) & 0xFF), (rgbValue & 0xFF), alphaValue)

#pragma mark - 颜色的RGB转换
#define COLOR_RGB(redValue, greenValue, blueValue) COLOR_RGBA(redValue, greenValue, blueValue, 1.0)
#define COLOR_RGB_0X(rgbValue) COLOR_RGBA_0X(rgbValue, 1.0)

#pragma mark - 颜色

#define COLOR_WHITE     ([UIColor whiteColor])
#define COLOR_BLACK     ([UIColor blackColor])
#define COLOR_RED       ([UIColor redColor])
#define COLOR_GREEN     ([UIColor greenColor])
#define COLOR_BLUE      ([UIColor blueColor])
#define COLOR_CYAN      ([UIColor cyanColor])
#define COLOR_YELLOW    ([UIColor yellowColor])
#define COLOR_ORANGE    ([UIColor orangeColor])
#define COLOR_LIGHTGRAY ([UIColor lightGrayColor])
#define COLOR_DRAKGRAY  ([UIColor darkGrayColor])
#define COLOR_GRAY      ([UIColor grayColor])
#define COLOR_BROWN     ([UIColor brownColor])
#define COLOR_CLEAR     ([UIColor clearColor])

#endif /* ColorDefine_h */
