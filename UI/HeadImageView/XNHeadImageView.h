//
//  XNHeadImageView.h
//  XNTalk
//
//  Created by 赵世强 on 16/7/18.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XNHeadImageView : NSObject

INTERFACE_SINGLETON(HeadImageView)

/**
 *  根据颜色和大小创建图片
 *
 *  @param color     图片颜色
 *  @param imageSize 图片大小
 *
 *  @return 生成的图片
 */
- (UIImage*)createImage:(UIColor*)color imageSize:(CGSize)imageSize;

/**
 *  在图片上添加文字
 *
 *  @param image     要添加的图片
 *  @param text      文本
 *  @param textColor 文本颜色
 *  @param textFont  文本的字体
 *
 *  @return 生成的图片
 */
- (UIImage*)addTextToImage:(UIImage*)image text:(NSString*)text textColor:(UIColor*)textColor textFont:(UIFont*)textFont;

/**
 *  创建头像图片
 *
 *  @param bgColor   图片的背景颜色
 *  @param size      图片大小
 *  @param text      名称
 *  @param textColor 名称颜色
 *  @param textFont  名称字体
 *  @param cahceKey  key值, 用来保存在字典中
 *
 *  @return 生成的图片
 */
- (UIImage*)createHeadImage:(UIColor*)bgColor size:(CGSize)size text:(NSString*)text textColor:(UIColor*)textColor textFont:(UIFont*)textFont cacheKey:(NSString*)cahceKey;

@end
