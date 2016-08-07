//
//  XNJson.h
//  Jiabao
//
//  Created by Jiabao on 16/7/7.
//  Copyright © 2016年 Jiabao. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - NSString(XNJson)
@interface NSString (Json)

+ (instancetype)stringWithJsonData:(NSData*)data;
+ (instancetype)stringWithJsonDictionary:(NSDictionary*)dict;
+ (instancetype)stringWithJsonArray:(NSArray*)array;

- (NSData*)toJsonData;
- (NSMutableData*)toJsonMutableData;
- (NSArray*)toJsonArray;
- (NSMutableArray*)toJsonMutableArray;
- (NSDictionary*)toJsonDictionary;
- (NSMutableDictionary*)toJsonMutableDictionary;

@end

#pragma mark - NSData(XNJson)
@interface NSData (XNJson)

+ (instancetype)dataWithJsonString:(NSString*)string;
+ (instancetype)dataWithJsonDictionary:(NSDictionary*)dict;
+ (instancetype)dataWithJsonArray:(NSArray*)array;

- (NSString*)toJsonString;
- (NSMutableString*)toJsonMutableStirng;
- (NSArray*)toJsonArray;
- (NSMutableArray*)toJsonMutableArray;
- (NSDictionary*)toJsonDictionary;
- (NSMutableDictionary*)toJsonMutableDictionary;

@end

#pragma mark - NSDictionary(XNJson)
@interface NSDictionary (XNJson)

+ (instancetype)dictionaryWithJsonString:(NSString*)string;
+ (instancetype)dictionaryWithJsonData:(NSData*)data;

- (NSString*)toJsonString;
- (NSMutableString*)toJsonMutableStirng;
- (NSData*)toJsonData;
- (NSMutableData*)toJsonMutableData;

@end

#pragma mark - NSArray(XNJson)
@interface NSArray (XNJson)

+ (instancetype)arrayWithJsonString:(NSString*)string;
+ (instancetype)arrayWithJsonData:(NSData*)data;

- (NSString*)toJsonString;
- (NSMutableString*)toJsonMutableStirng;
- (NSData*)toJsonData;
- (NSMutableData*)toJsonMutableData;

@end

