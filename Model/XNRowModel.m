//
//  XNRowModel.m
//  XNTalk
//
//  Created by Jiabao on 16/7/25.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import "XNRowModel.h"

@implementation XNRowModel

IMPLEMENTATION_UINT64_FIELD(Height, height)
IMPLEMENTATION_OBJECT_FIELD(UIImage, Image, image)
IMPLEMENTATION_STRING_FIELD(Title, title)
IMPLEMENTATION_STRING_FIELD(Value, value)
IMPLEMENTATION_OBJECT_FIELD(UIImage, ArrowImage, arrowImage)
IMPLEMENTATION_OBJECT_FIELD(UIColor, TopSeparateColor, topSeparateColor)
IMPLEMENTATION_OBJECT_FIELD(UIColor, BottomSeparateColor, bottomSeparateColor)
IMPLEMENTATION_OBJECT_FIELD(UIColor, BackgroundColor, backgroundColor)

@end
