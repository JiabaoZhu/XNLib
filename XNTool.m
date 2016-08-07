//
//  XNTool.m
//  IM
//
//  Created by Jiabao on 16/6/25.
//  Copyright © 2016年 Jiabao. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "XNTool.h"

@implementation XNTool

+ (BOOL)stringIsEmpty:(NSString *)str {
    if (nil == str || NULL == str) {
        return YES;
    }
    if ([str isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if (0 == [[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]) {
        return YES;
    }
    return NO;
}

@end
