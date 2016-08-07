//
//  XNBaseRequest.h
//  XNTalk
//
//  Created by Jiabao on 16/7/7.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import "XNBaseContract.h"

@interface XNBaseRequest : XNBaseContract

#pragma mark - 类方法 初始化
+ (instancetype)request;
+ (instancetype)requestWithJsonDictionary:(NSDictionary*)dictionary;
+ (instancetype)requestWithJsonData:(NSData*)data;
+ (instancetype)requestWithJsonString:(NSString*)string;

#pragma mark - 实例方法 初始化
- (instancetype)init;
- (instancetype)initWithJsonDictionary:(NSDictionary*)dictionary;
- (instancetype)initWithJsonData:(NSData*)data;
- (instancetype)initWithJsonString:(NSString*)string;

#pragma mark - 生成签名
- (void)createSign;

#pragma mark - API方法
- (NSString*)method;

#pragma mark - 字段
// locale
INTERFACE_STRING_FIELD(Locale, locale)

// 时间戳
INTERFACE_STRING_FIELD(Timestamp, timestamp)

// 可选，指定响应格式, 默认json, 目前支持格式为xml,json
INTERFACE_STRING_FIELD(Format, format)

// API协议版本，可选值:1.0。
INTERFACE_STRING_FIELD(V, v)

// API输入参数签名结果, 当发送请求时, 自动生成签名
INTERFACE_STRING_FIELD(Sign, sign)

// 参数的加密方法选择，可选值是：md5,sha1。
INTERFACE_STRING_FIELD(Sign_method, sign_method)

//// 分配给用户的SessionKey，通过登陆授权获取。某个API是否需要传入session参数，需参考此API的API用户授权类型
//INTERFACE_STRING_FIELD(Session, session)

@end
