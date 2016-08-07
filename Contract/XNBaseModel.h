//
//  XNBaseModel.h
//  XNTalk
//
//  Created by 赵世强 on 16/7/14.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import "XNBaseContract.h"

@interface XNBaseModel : XNBaseContract

#pragma mark - 类方法 初始化
+ (instancetype)model;
+ (instancetype)modelWithJsonDictionary:(NSDictionary*)dictionary;
+ (instancetype)modelWithJsonData:(NSData*)data;
+ (instancetype)modelWithJsonString:(NSString*)string;

#pragma mark - 实例方法 初始化
- (instancetype)init;
- (instancetype)initWithJsonDictionary:(NSDictionary*)dictionary;
- (instancetype)initWithJsonData:(NSData*)data;
- (instancetype)initWithJsonString:(NSString*)string;

#pragma mark - 字段

/**
 *  @brief 行版本号
 */
INTERFACE_INT_FIELD(RowVersion, rowVersion)

@end
