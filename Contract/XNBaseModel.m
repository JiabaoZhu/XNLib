//
//  XNBaseModel.m
//  XNTalk
//
//  Created by 赵世强 on 16/7/14.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import "XNBaseModel.h"

@implementation XNBaseModel

#pragma mark - 类方法 初始化
+ (instancetype)model {
    return [[self alloc] init];
}
+ (instancetype)modelWithJsonDictionary:(NSDictionary *)dictionary {
    return [[self alloc] initWithJsonDictionary:dictionary];
}
+ (instancetype)modelWithJsonData:(NSData*)data {
    return [[self alloc] initWithJsonData:data];
}
+ (instancetype)modelWithJsonString:(NSString*)string {
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

/**
 *  @brief 行版本号
 */
IMPLEMENTATION_INT_FIELD(RowVersion, rowVersion)

@end
