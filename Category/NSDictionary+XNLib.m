//
//  NSDictionary+XNLib.m
//  XNTalk
//
//  Created by Jiabao on 16/7/31.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import "NSDictionary+XNLib.h"

@implementation NSDictionary (XNLib)

#pragma mark - 检查有没有字段
- (BOOL)hasKey:(NSString *)key {
    for(NSString *temp in self.allKeys) {
        if ([temp isEqualToString:key]) {
            return YES;
        }
    }
    return NO;
}

@end
