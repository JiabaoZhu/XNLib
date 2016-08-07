//
//  XNBaseContract.m
//  XNTalk
//
//  Created by Jiabao on 16/7/5.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import "XNBaseContract.h"

@implementation XNBaseContract

//#pragma mark - 类方法 转换
//// Json数据转为Data
//+ (NSData*)JsonDictToData:(NSDictionary*)dict {
//    NSError *error = nil;
//    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
//    if ([data length] > 0 && error == nil) {
//        return data;
//    } else {
//        return nil;
//    }
//}
//+ (NSData*)JsonStringToData:(NSString*)string {
//    return [string dataUsingEncoding:NSUTF8StringEncoding];
//}
//+ (NSMutableData*)JsonDictToMutableData:(NSDictionary*)dict {
//    return [[self JsonDictToData:dict] mutableCopy];
//}
//+ (NSMutableData*)JsonStringToMutableData:(NSString*)string {
//    return [[self JsonStringToData:string] mutableCopy];
//}
//
//// Json数据转为String
//+ (NSString*)JsonDataToString:(NSData*)data {
//    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//}
//+ (NSString*)JsonDictToString:(NSDictionary*)dict {
//    return [self JsonDataToString:[self JsonDictToData:dict]];
//}
//+ (NSMutableString*)JsonDataToMutableString:(NSData*)data {
//    return [[self JsonDataToString:data] mutableCopy];
//}
//+ (NSMutableString*)JsonDictToMutableString:(NSDictionary*)dict {
//    return [[self JsonDictToMutableString:dict] mutableCopy];
//}
//
//// Json数据转为Dictionary
//+ (NSDictionary*)JsonDataToDict:(NSData*)data {
//    NSError *error = nil;
//    NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
//    if (dict != nil && error == nil) {
//        return dict;
//    }else{
//        // 解析错误
//        return nil;
//    }
//}
//+ (NSDictionary*)JsonStringToDict:(NSString*)string {
//    return [self JsonDataToDict:[self JsonStringToData:string]];
//}
//+ (NSMutableDictionary*)JsonDataToMutableDict:(NSData*)data {
//    return [[self JsonDataToDict:data] mutableCopy];
//}
//+ (NSMutableDictionary*)JsonStringToMutableDict:(NSString*)string {
//    return [[self JsonDataToDict:[self JsonStringToData:string]] mutableCopy];
//}

//#pragma mark - 类方法 初始化
//+ (instancetype)contract {
//    return [[self alloc] init];
//}
//+ (instancetype)contractWithJsonDict:(NSDictionary *)dict {
//    return [[self alloc] initWithJsonDict:dict];
//}
//+ (instancetype)contractWithJsonData:(NSData*)data {
//    return [[self alloc] initWithJsonData:data];
//}
//+ (instancetype)contractWithJsonString:(NSString*)string {
//    return [[self alloc] initWithJsonString:string];
//}

#pragma mark - 实例方法 初始化
- (instancetype)init {
    self = [super init];
    if (nil != self) {
        _fieldData = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (instancetype)initWithJsonDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (nil != self) {
        if (nil != dictionary) {
            _fieldData = [dictionary mutableCopy];
        } else {
            _fieldData = [[NSMutableDictionary alloc] init];
        }
    }
    return self;
}
- (instancetype)initWithJsonData:(NSData *)data {
    return [self initWithJsonDictionary:[data toJsonDictionary]];
}
- (instancetype)initWithJsonString:(NSString *)string {
    return [self initWithJsonDictionary:[string toJsonDictionary]];
}

#pragma mark - 获得Json数据
- (NSDictionary*)jsonDictionary {
    return [_fieldData mutableCopy];
}
- (NSData*)jsonData {
    return [_fieldData toJsonData];
}
- (NSString *)jsonString {
    return [_fieldData toJsonString];
}
- (NSMutableDictionary*)jsonMutableDictionary {
    return [_fieldData mutableCopy];
}
- (NSMutableData*)jsonMutableData {
    return [[self jsonData] mutableCopy];
}
- (NSMutableString*)jsonMutableString {
    return [[self jsonString] mutableCopy];
}

#pragma mark - 设置Json数据
- (void)setJsonDictionary:(NSDictionary*)dictionary {
    _fieldData = [dictionary mutableCopy];
}
- (void)setJsonData:(NSData*)data {
    _fieldData = [data toJsonMutableDictionary];
}
- (void)setJsonString:(NSString*)string {
    _fieldData = [string toJsonMutableDictionary];
}

#pragma mark - 检查有没有字段
- (BOOL)hasField:(NSString *)field {
    for(NSString *temp in self.fieldData.allKeys) {
        if ([temp isEqualToString:field]) {
            return YES;
        }
    }
    return NO;
}

#pragma mark - 移除key
- (void)removeObjectForField:(NSString *)field {
    [_fieldData removeObjectForKey:field];
}

#pragma mark - 设置字段的值
- (void)setFieldValue_BOOL: (BOOL)value forField:(NSString*)field {
    [_fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_int:(int)value forField:(NSString*)field {
    [_fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_float:(float)value forField:(NSString*)field {
    [_fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_double:(double)value forField:(NSString*)field {
    [_fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_SInt8:(SInt8)value forField:(NSString*)field {
    [_fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_SInt16:(SInt16)value forField:(NSString*)field {
    [_fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_SInt32:(SInt32)value forField:(NSString*)field {
    [_fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_SInt64:(SInt64)value forField:(NSString*)field {
    [_fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_Integer:(NSInteger)value forField:(NSString*)field {
    [_fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_UInt8:(UInt8)value forField:(NSString*)field {
    [_fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_UInt16:(UInt16)value forField:(NSString*)field {
    [_fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_UInt32:(UInt32)value forField:(NSString*)field {
    [_fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_UInt64:(UInt64)value forField:(NSString*)field {
    [_fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_UInteger:(NSUInteger)value forField:(NSString*)field {
    [_fieldData setObject:@(value) forKey:field];
}
- (void)setFieldValue_Number:(NSNumber*)value forField:(NSString*)field {
    if (nil == value) {
        [_fieldData removeObjectForKey:field];
    } else {
        [_fieldData setObject:value forKey:field];
    }
}
- (void)setFieldValue_String:(NSString*)value forField:(NSString*)field {
    if (nil == value) {
        [_fieldData removeObjectForKey:field];
    } else {
        [_fieldData setObject:value forKey:field];
    }
}
- (void)setFieldValue_Dictionary:(NSDictionary*)value forField:(NSString*)field {
    if (nil == value) {
        [_fieldData removeObjectForKey:field];
    } else {
        [_fieldData setObject:value forKey:field];
    }
}
- (void)setFieldValue_Array:(NSArray*)value forField:(NSString*)field {
    if (nil == value) {
        [_fieldData removeObjectForKey:field];
    } else {
        [_fieldData setObject:value forKey:field];
    }
}
- (void)setFieldValue_id:(id)value forField:(NSString*)field {
    if (nil == value) {
        [_fieldData removeObjectForKey:field];
    } else {
        [_fieldData setObject:value forKey:field];
    }    
}

#pragma mark - 获得字段的值
- (BOOL)getFieldValue_BOOL:(NSString*)field {
    return [[_fieldData objectForKey:field] boolValue];
}
- (int)getFieldValue_int:(NSString*)field {
    return [[_fieldData objectForKey:field] intValue];
}
- (float)getFieldValue_float:(NSString*)field {
    return [[_fieldData objectForKey:field] floatValue];
}
- (double)getFieldValue_double:(NSString*)field {
    return [[_fieldData objectForKey:field] doubleValue];
}
- (SInt8)getFieldValue_SInt8:(NSString*)field {
    return [[_fieldData objectForKey:field] intValue];
}
- (SInt16)getFieldValue_SInt16:(NSString*)field {
    return [[_fieldData objectForKey:field] intValue];
}
- (SInt32)getFieldValue_SInt32:(NSString*)field {
    return [[_fieldData objectForKey:field] intValue];
}
- (SInt64)getFieldValue_SInt64:(NSString*)field {
    return [[_fieldData objectForKey:field] longLongValue];
}
- (NSInteger)getFieldValue_Integer:(NSString*)field {
    return [[_fieldData objectForKey:field] integerValue];
}
- (UInt8)getFieldValue_UInt8:(NSString*)field {
    return (UInt8)[[_fieldData objectForKey:field] intValue];
}
- (UInt16)getFieldValue_UInt16:(NSString*)field {
    return (UInt16)[[_fieldData objectForKey:field] intValue];
}
- (UInt32)getFieldValue_UInt32:(NSString*)field {
    return (UInt32)[[_fieldData objectForKey:field] intValue];
}
- (UInt64)getFieldValue_UInt64:(NSString*)field {
    return (UInt64)[[_fieldData objectForKey:field] longLongValue];
}
- (NSUInteger)getFieldValue_UInteger:(NSString*)field {
    return (NSUInteger)[[_fieldData objectForKey:field] integerValue];
}
- (NSNumber*)getFieldValue_Number:(NSString*)field {
    return [_fieldData objectForKey:field];
}
- (NSString*)getFieldValue_String:(NSString*)field {
    return [_fieldData objectForKey:field];
}
- (NSDictionary*)getFieldValue_Dictionary:(NSString*)field {
    return [_fieldData objectForKey:field];
}
- (NSArray*)getFieldValue_Array:(NSString*)field {
    return [_fieldData objectForKey:field];
}
- (id)getFieldValue_id:(NSString*)field {
    return [_fieldData objectForKey:field];
}

@end

/*
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  BOOL value,             NSString* key) {
    [dict setObject:@(value) forKey:key];
}
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  int value,              NSString* key) {
    [dict setObject:@(value) forKey:key];
}
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  float value,            NSString* key) {
    [dict setObject:@(value) forKey:key];
}
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  UInt8 value,            NSString* key) {
    [dict setObject:@(value) forKey:key];
}
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  UInt16 value,           NSString* key) {
    [dict setObject:@(value) forKey:key];
}
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  UInt32 value,           NSString* key) {
    [dict setObject:@(value) forKey:key];
}
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  UInt64 value,           NSString* key) {
    [dict setObject:@(value) forKey:key];
}
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  NSInteger value,        NSString* key) {
    [dict setObject:@(value) forKey:key];
}
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  NSNumber* value,        NSString* key) {
    [dict setObject:value forKey:key];
}
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  NSString* value,        NSString* key) {
    [dict setObject:value forKey:key];
}
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  NSDictionary* value,    NSString* key) {
    [dict setObject:value forKey:key];
}
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  NSArray* value,         NSString* key) {
    [dict setObject:value forKey:key];
}
void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  XNBaseContract* value,  NSString* key) {
    [dict setObject:value forKey:key];
}

BOOL            __attribute__((overloadable)) getFieldValue(NSDictionary* dict, BOOL* value,            NSString* key) {
    NSNumber* number = [dict objectForKey:key];
    BOOL boolValue = [number boolValue];
    if (nil != value) {
        *value = boolValue;
    }
    return boolValue;
}
int             __attribute__((overloadable)) getFieldValue(NSDictionary* dict, int* value,             NSString* key) {
    
}
float           __attribute__((overloadable)) getFieldValue(NSDictionary* dict, float* value,           NSString* key) {
    
}
UInt8           __attribute__((overloadable)) getFieldValue(NSDictionary* dict, UInt8* value,           NSString* key) {
    
}
UInt16          __attribute__((overloadable)) getFieldValue(NSDictionary* dict, UInt16* value,          NSString* key) {
    
}
UInt32          __attribute__((overloadable)) getFieldValue(NSDictionary* dict, UInt32* value,          NSString* key) {
    
}
UInt64          __attribute__((overloadable)) getFieldValue(NSDictionary* dict, UInt64* value,          NSString* key) {
    
}
NSInteger       __attribute__((overloadable)) getFieldValue(NSDictionary* dict, NSInteger* value,       NSString* key) {
    
}
NSNumber*       __attribute__((overloadable)) getFieldValue(NSDictionary* dict, NSNumber** value,       NSString* key) {
    
}
NSString*       __attribute__((overloadable)) getFieldValue(NSDictionary* dict, NSString** value,       NSString* key) {
    
}
NSDictionary*   __attribute__((overloadable)) getFieldValue(NSDictionary* dict, NSDictionary** value,   NSString* key) {
    
}
NSArray*        __attribute__((overloadable)) getFieldValue(NSDictionary* dict, NSArray** value,        NSString* key) {
    
}
XNBaseContract* __attribute__((overloadable)) getFieldValue(NSDictionary* dict, XNBaseContract** value, NSString* key) {
    
}
*/