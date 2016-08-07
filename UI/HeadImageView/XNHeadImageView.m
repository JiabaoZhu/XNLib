//
//  XNHeadImageView.m
//  XNTalk
//
//  Created by 赵世强 on 16/7/18.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import "XNHeadImageView.h"

@interface XNHeadImageView () {
    NSMutableDictionary *_cacheImages;
}

@end

@implementation XNHeadImageView

IMPLEMENTATION_SINGLETON(HeadImageView)

- (instancetype)_init {
    _cacheImages = [[NSMutableDictionary alloc] init];
    return self;
}

- (UIImage*)createHeadImage:(UIColor*)bgColor size:(CGSize)size text:(NSString*)text textColor:(UIColor*)textColor textFont:(UIFont*)textFont cacheKey:(NSString*)cahceKey {
    if (300.0f > size.width) {
        size.width = 300.0f;
    }
    if (300.0f > size.height) {
        size.height = 300.0f;
    }
    
    UIImage *image = nil;
    NSString *key = [NSString stringWithFormat:@"%@@w%d@h%d", cahceKey, (int)size.width, (int)size.height];
    
    image = [_cacheImages objectForKey:key];
    if (nil == image) {
        image = [self createImage:bgColor imageSize:size];
        image = [self addTextToImage:image text:text textColor:textColor textFont:textFont];
    }
    return image;
}

- (UIImage*)createImage:(UIColor*)color imageSize:(CGSize)imageSize {
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    if (IOS8_LATER) {
        [color set];
    }
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage*)addTextToImage:(UIImage*)image text:(NSString*)text textColor:(UIColor*)textColor textFont:(UIFont*)textFont {
    if (nil == text || nil == textColor || nil == textFont) {
        return image;
    }
    CGFloat w = image.size.width;
    CGFloat h = image.size.height;
    UIGraphicsBeginImageContext(image.size);
    [[UIColor clearColor] set];
    [image drawInRect:CGRectMake(0, 0, w, h)];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    NSDictionary *attributes = @{ NSFontAttributeName: textFont,
                                  NSForegroundColorAttributeName: textColor,
                                  NSParagraphStyleAttributeName: paragraphStyle };
    [text drawInRect:CGRectMake(0, h/3, w, h) withAttributes:attributes];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
