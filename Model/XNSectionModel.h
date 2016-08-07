//
//  XNSectionModel.h
//  XNTalk
//
//  Created by Jiabao on 16/7/25.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import "XNBaseModel.h"

@interface XNSectionModel : XNBaseModel

INTERFACE_UINT64_FIELD(HeaderHeight, headerHeight)
INTERFACE_STRING_FIELD(HeaderTitle, headerTitle)
INTERFACE_OBJECT_FIELD(UIColor, HeaderBackgroundColor, headerBackgroundColor)
INTERFACE_OBJECT_FIELD(UIView, HeaderView, headerView)

INTERFACE_ARRAY_FIELD(RowArray, rowArray)

INTERFACE_UINT64_FIELD(FooterHeight, footerHeight)
INTERFACE_STRING_FIELD(FooterTitle, footerTitle)
INTERFACE_OBJECT_FIELD(UIColor, FooterBackgroundColor, footerBackgroundColor)
INTERFACE_OBJECT_FIELD(UIView, FooterView, footerView)

@end
