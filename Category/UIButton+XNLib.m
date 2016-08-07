//
//  UIButton+XNLib.m
//  XNTalk
//
//  Created by Jiabao on 16/7/1.
//  Copyright © 2016年 Jiabao. All rights reserved.
//

#import "UIButton+XNLib.h"

@implementation UIButton (XNLib)

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state {
    UIImage *image = [UIImage imageWithColor:color];
    [self setBackgroundImage:image forState:state];
}

@end
