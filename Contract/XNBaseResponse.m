//
//  XNBaseResponse.m
//  XNTalk
//
//  Created by 赵世强 on 16/7/14.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import "XNBaseResponse.h"

//@implementation ErrorModel
//
//IMPLEMENTATION_STRING_FIELD(Code, code)
//IMPLEMENTATION_STRING_FIELD(Message, message)
//IMPLEMENTATION_STRING_FIELD(Type, type)
//
//@end

@implementation XNBaseResponse

#pragma mark - 类方法 初始化
+ (instancetype)response {
    return [[self alloc] init];
}
+ (instancetype)responseWithJsonDictionary:(NSDictionary *)dictionary {
    return [[self alloc] initWithJsonDictionary:dictionary];
}
+ (instancetype)responseWithJsonData:(NSData*)data {
    return [[self alloc] initWithJsonData:data];
}
+ (instancetype)responseWithJsonString:(NSString*)string {
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
}


#pragma mark - 字段
IMPLEMENTATION_UINT64_FIELD(Code, code);
IMPLEMENTATION_STRING_FIELD(Message, message)
IMPLEMENTATION_ARRAY_FIELD(Errors, errors);
IMPLEMENTATION_ARRAY_FIELD(Result, result);
IMPLEMENTATION_UINT64_FIELD(TotalCount, totalCount);
//IMPLEMENTATION_CONTRACT_FIELD(ErrorModel, Errors, errors)

@end
