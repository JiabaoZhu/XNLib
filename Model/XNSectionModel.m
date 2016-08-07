//
//  XNSectionModel.m
//  XNTalk
//
//  Created by Jiabao on 16/7/25.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import "XNSectionModel.h"

@implementation XNSectionModel

IMPLEMENTATION_UINT64_FIELD(HeaderHeight, headerHeight)
IMPLEMENTATION_STRING_FIELD(HeaderTitle, headerTitle)
IMPLEMENTATION_OBJECT_FIELD(UIColor, HeaderBackgroundColor, headerBackgroundColor)
IMPLEMENTATION_OBJECT_FIELD(UIView, HeaderView, headerView)

IMPLEMENTATION_ARRAY_FIELD(RowArray, rowArray)

IMPLEMENTATION_UINT64_FIELD(FooterHeight, footerHeight)
IMPLEMENTATION_STRING_FIELD(FooterTitle, footerTitle)
IMPLEMENTATION_OBJECT_FIELD(UIColor, FooterBackgroundColor, footerBackgroundColor)
IMPLEMENTATION_OBJECT_FIELD(UIView, FooterView, footerView)

@end
