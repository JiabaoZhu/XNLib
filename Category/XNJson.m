//
//  XNJson.m
//  Jiabao
//
//  Created by Jiabao on 16/7/7.
//  Copyright © 2016年 Jiabao. All rights reserved.
//

#import "XNJson.h"

#pragma mark - 函数声明
// NSString
NSString* JsonDataToString(NSData* data);
NSString* JsonDictionaryToString(NSDictionary* dict);
NSString* JsonArrayToString(NSArray* array);

// NSData
NSData* JsonStringToData(NSString* string);
NSData* JsonDictionaryToData(NSDictionary* dict);
NSData* JsonArrayToData(NSArray* array);

// NSDictionary
NSDictionary* JsonStringToDictionary(NSString* string);
NSDictionary* JsonDataToDictionary(NSData* data);

// NSArray
NSArray* JsonStringToArray(NSString* string);
NSArray* JsonDataToArray(NSData* data);

#pragma mark - 函数实现
// NSData* -> NSString*
NSString* JsonDataToString(NSData* data) {
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
// NSDictionary* -> NSString*
NSString* JsonDictionaryToString(NSDictionary* dict) {
    return JsonDataToString(JsonDictionaryToData(dict));
}
// NSArray* -> NSString*
NSString* JsonArrayToString(NSArray* array) {
    return JsonDataToString(JsonArrayToData(array));
}
// NSString* -> NSData*
NSData* JsonStringToData(NSString* string) {
    return [string dataUsingEncoding:NSUTF8StringEncoding];
}
// NSDictionary* -> NSData*
NSData* JsonDictionaryToData(NSDictionary* dict) {
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
    if ([data length] > 0 && error == nil) {
        return data;
    } else {
        return nil;
    }
}
// NSArray* -> NSData*
NSData* JsonArrayToData(NSArray* array) {
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:array options:0 error:&error];
    if ([data length] > 0 && error == nil) {
        return data;
    } else {
        return nil;
    }
}
// NSString* -> NSDictionary*
NSDictionary* JsonStringToDictionary(NSString* string) {
    return JsonDataToDictionary(JsonStringToData(string));
}
// NSData* -> NSDictionary*
NSDictionary* JsonDataToDictionary(NSData* data) {
    NSError *error = nil;
    NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if (dict != nil && error == nil) {
        return dict;
    }else{
        // 解析错误
        return nil;
    }
}
// NSString* -> NSArray*
NSArray* JsonStringToArray(NSString* string) {
    return JsonDataToArray(JsonStringToData(string));
}
// NSData* -> NSArray*
NSArray* JsonDataToArray(NSData* data) {
    NSError *error = nil;
    NSArray* array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if (array != nil && error == nil) {
        return array;
    } else {
        // 解析错误
        return nil;
    }
}


#pragma mark - NSString(XNJson)
@implementation NSString (XNJson)

+ (instancetype)stringWithJsonData:(NSData*)data {
    return JsonDataToString(data);
}
+ (instancetype)stringWithJsonDictionary:(NSDictionary*)dict {
    return JsonDictionaryToString(dict);
}
+ (instancetype)stringWithJsonArray:(NSArray*)array {
    return JsonArrayToString(array);
}

- (NSData*)toJsonData {
    return JsonStringToData(self);
}
- (NSMutableData*)toJsonMutableData {
    return [JsonStringToData(self) mutableCopy];
}
- (NSArray*)toJsonArray {
    return JsonStringToArray(self);
}
- (NSMutableArray*)toJsonMutableArray {
    return [JsonStringToArray(self) mutableCopy];
}
- (NSDictionary*)toJsonDictionary {
    return JsonStringToDictionary(self);
}
- (NSMutableDictionary*)toJsonMutableDictionary {
    return [JsonStringToDictionary(self) mutableCopy];
}

@end

#pragma mark - NSData(XNJson)
@implementation NSData (XNJson)

+ (instancetype)dataWithJsonString:(NSString*)string {
    return JsonStringToData(string);
}
+ (instancetype)dataWithJsonDictionary:(NSDictionary*)dict {
    return JsonDictionaryToData(dict);
}
+ (instancetype)dataWithJsonArray:(NSArray*)array {
    return JsonArrayToData(array);
}

- (NSString*)toJsonString {
    return JsonDataToString(self);
}
- (NSMutableString*)toJsonMutableStirng {
    return [JsonDataToString(self) mutableCopy];
}
- (NSArray*)toJsonArray {
    return JsonDataToArray(self);
}
- (NSMutableArray*)toJsonMutableArray {
    return [JsonDataToArray(self) mutableCopy];
}
- (NSDictionary*)toJsonDictionary {
    return JsonDataToDictionary(self);
}
- (NSMutableDictionary*)toJsonMutableDictionary {
    return [JsonDataToDictionary(self) mutableCopy];
}

@end

#pragma mark - NSDictionary(XNJson)
@implementation NSDictionary (XNJson)

+ (instancetype)dictionaryWithJsonString:(NSString*)string {
    return JsonStringToDictionary(string);
}
+ (instancetype)dictionaryWithJsonData:(NSData*)data {
    return JsonDataToDictionary(data);
}

- (NSString*)toJsonString {
    return JsonDictionaryToString(self);
}
- (NSMutableString*)toJsonMutableStirng {
    return [JsonDictionaryToString(self) mutableCopy];
}
- (NSData*)toJsonData {
    return JsonDictionaryToData(self);
}
- (NSMutableData*)toJsonMutableData {
    return [JsonDictionaryToData(self) mutableCopy];
}

@end

#pragma mark - NSArray(XNJson)
@implementation NSArray (XNJson)

+ (instancetype)arrayWithJsonString:(NSString*)string {
    return JsonStringToArray(string);
}
+ (instancetype)arrayWithJsonData:(NSData*)data {
    return JsonDataToArray(data);
}

- (NSString*)toJsonString {
    return JsonArrayToString(self);
}
- (NSMutableString*)toJsonMutableStirng {
    return [JsonArrayToString(self) mutableCopy];
}
- (NSData*)toJsonData {
    return JsonArrayToData(self);
}
- (NSMutableData*)toJsonMutableData {
    return [JsonArrayToData(self) mutableCopy];
}

@end

