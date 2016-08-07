//
//  ScreenDefine.h
//  IM
//
//  Created by Jiabao on 16/6/25.
//  Copyright © 2016年 Jiabao. All rights reserved.
//

#ifndef ScreenDefine_h
#define ScreenDefine_h

#import <Foundation/Foundation.h>

#pragma mark 当前设备屏幕宽度
/**
 *  屏幕宽度
 *
 *  @return 当前设备屏幕宽度
 */
#define SCREEN_WIDTH    ([[UIScreen mainScreen] bounds].size.width)

#pragma mark 当前设备屏幕高度
/**
 *  屏幕高度
 *
 *  @return 当前设备屏幕高度
 */
#define SCREEN_HEIGHT   ([[UIScreen mainScreen] bounds].size.height)


#pragma mark 根据标注尺寸(基于iPhone5尺寸)计算实际宽度
/**
 *  @brief 根据在iPhone5的尺寸计算实际宽度
 *
 *  @param width: iPhone5下的实际宽度
 *
 *  @return 在当前设备上的真实宽度
 */
#define WIDTH_BY_IPHONE5(width) (width/640.0f)*SCREEN_WIDTH

#pragma mark 根据标注尺寸(基于iPhone5尺寸)计算实际高度
/**
 *  @brief 根据在iPhone5的尺寸计算实际高度
 *
 *  @param height: iPhone5下的实际高度
 *
 *  @return 在当前设备上的真实高度
 */
#define HEIGHT_BY_IPHONE5(height) (height/1136.0f)*SCREEN_HEIGHT


#pragma mark 根据标注尺寸(基于iPhone6尺寸)计算实际宽度
/**
 *  @brief 根据在iPhone6的尺寸计算实际宽度
 *
 *  @param width: iPhone6下的实际宽度
 *
 *  @return 在当前设备上的真实宽度
 */
#define WIDTH_BY_IPHONE6(width) (width/750.0f)*SCREEN_WIDTH

#pragma mark 根据标注尺寸(基于iPhone6尺寸)计算实际高度
/**
 *  @brief 根据在iPhone6的尺寸计算实际高度
 *
 *  @param height: iPhone6下的实际高度
 *
 *  @return 在当前设备上的真实高度
 */
#define HEIGHT_BY_IPHONE6(height) (height/1334.0f)*SCREEN_HEIGHT


#endif /* ScreenDefine_h */
