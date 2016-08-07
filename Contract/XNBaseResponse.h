//
//  XNBaseResponse.h
//  XNTalk
//
//  Created by 赵世强 on 16/7/14.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import "XNBaseContract.h"

//@interface ErrorModel : XNBaseModel
//
//INTERFACE_STRING_FIELD(Code, code)
//INTERFACE_STRING_FIELD(Message, message)
//INTERFACE_STRING_FIELD(Type, type)
//
//@end

@interface XNBaseResponse : XNBaseContract

#pragma mark - 类方法 初始化
+ (instancetype)response;
+ (instancetype)responseWithJsonDictionary:(NSDictionary*)dictionary;
+ (instancetype)responseWithJsonData:(NSData*)data;
+ (instancetype)responseWithJsonString:(NSString*)string;

#pragma mark - 实例方法 初始化
- (instancetype)init;
- (instancetype)initWithJsonDictionary:(NSDictionary*)dictionary;
- (instancetype)initWithJsonData:(NSData*)data;
- (instancetype)initWithJsonString:(NSString*)string;

#pragma mark - 字段
INTERFACE_UINT64_FIELD(Code, code);
INTERFACE_STRING_FIELD(Message, message)
INTERFACE_ARRAY_FIELD(Errors, errors);
INTERFACE_ARRAY_FIELD(Result, result);
INTERFACE_UINT64_FIELD(TotalCount, totalCount);
//INTERFACE_CONTRACT_FIELD(ErrorModel, Errors, errors)

@end
