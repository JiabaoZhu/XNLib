//
//  XNBaseRequest.m
//  XNTalk
//
//  Created by Jiabao on 16/7/7.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import "XNBaseRequest.h"

@implementation XNBaseRequest

#pragma mark - 类方法 初始化
+ (instancetype)request {
    return [[self alloc] init];
}
+ (instancetype)requestWithJsonDictionary:(NSDictionary *)dictionary {
    return [[self alloc] initWithJsonDictionary:dictionary];
}
+ (instancetype)requestWithJsonData:(NSData*)data {
    return [[self alloc] initWithJsonData:data];
}
+ (instancetype)requestWithJsonString:(NSString*)string {
    return [[self alloc] initWithJsonString:string];
}

#pragma mark - 实例方法 初始化
- (instancetype)init {
    self = [super init];
    [self _init];
    return self;
}

- (instancetype)initWithJsonDictionary:(NSDictionary *)dictionary {
    self = [super initWithJsonDictionary:dictionary];
    [self _init];
    return self;
}
- (instancetype)initWithJsonData:(NSData *)data {
    self = [super initWithJsonData:data];
    [self _init];
    return self;
}
- (instancetype)initWithJsonString:(NSString *)string {
    self = [super initWithJsonString:string];
    [self _init];
    return self;
}

- (void)_init {
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval since = [date timeIntervalSince1970]*1000;
    
    self.locale = @"zh_CN";
    self.timestamp = [NSString stringWithFormat:@"%.0f", since];
    self.format = @"json";
    self.v = @"1.0";
    self.sign_method = @"md5";
}

#pragma mark - 生成签名
- (void)createSign {
    NSMutableString *signString = [[NSMutableString alloc] init];
    // 排序签名
    NSArray *keyArray = [[self.fieldData allKeys] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    for (NSString *key in keyArray) {
        [signString appendString:key];
        id value = [self.fieldData objectForKey:key];
        if ([value isKindOfClass:[NSArray class]]) {
            [signString appendString:[(NSArray*)value toJsonString]];
        } else {
            [signString appendString:[NSString stringWithFormat:@"%@", [self.fieldData objectForKey:key]]];
        }
    }
    {
        NSString *secret = [self.fieldData objectForKey:@"secret"];
        signString = [NSMutableString stringWithFormat:@"%@%@%@", secret, signString, secret];
    }
    self.sign = [[signString md5] uppercaseString];
}

#pragma mark - API方法
- (NSString *)method {
    return @"baseRequest.method";
}

#pragma mark - 字段
// locale
IMPLEMENTATION_STRING_FIELD(Locale, locale)

// 时间戳
IMPLEMENTATION_STRING_FIELD(Timestamp, timestamp)

// 可选，指定响应格式, 默认json, 目前支持格式为xml,json
IMPLEMENTATION_STRING_FIELD(Format, format)

// API协议版本，可选值:1.0。
IMPLEMENTATION_STRING_FIELD(V, v)

// API输入参数签名结果, 当发送请求时, 自动生成签名
IMPLEMENTATION_STRING_FIELD(Sign, sign)

// 参数的加密方法选择，可选值是：md5,sha1。
IMPLEMENTATION_STRING_FIELD(Sign_method, sign_method)

//// 分配给用户的SessionKey，通过登陆授权获取。某个API是否需要传入session参数，需参考此API的API用户授权类型
//IMPLEMENTATION_STRING_FIELD(Session, session)


@end
