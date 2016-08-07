//
//  XNRowModel.h
//  XNTalk
//
//  Created by Jiabao on 16/7/25.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import "XNBaseModel.h"

@interface XNRowModel : XNBaseModel

INTERFACE_UINT64_FIELD(Height, height)
INTERFACE_OBJECT_FIELD(UIImage, Image, image)
INTERFACE_STRING_FIELD(Title, title)
INTERFACE_STRING_FIELD(Value, value)
INTERFACE_OBJECT_FIELD(UIImage, ArrowImage, arrowImage)
INTERFACE_OBJECT_FIELD(UIColor, TopSeparateColor, topSeparateColor)
INTERFACE_OBJECT_FIELD(UIColor, BottomSeparateColor, bottomSeparateColor)
INTERFACE_OBJECT_FIELD(UIColor, BackgroundColor, backgroundColor)

@end
