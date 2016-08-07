//
//  NSString+XNLib.m
//  XNTalk
//
//  Created by Jiabao on 16/7/7.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "NSString+XNLib.h"

@implementation NSString (XNLib)


- (NSString*)md5 {
    const char *originalStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(originalStr, (CC_LONG)strlen(originalStr), result);
    NSMutableString *hash = [NSMutableString string];
    
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x", result[i]];
    }
    return [hash lowercaseString];
}

@end
