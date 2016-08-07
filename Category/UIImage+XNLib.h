//
//  UIImage+XNLib.h
//  XNTalk
//
//  Created by Jiabao on 16/7/3.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XNLib)

#pragma mark - 根据颜色和大小创建图片
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
