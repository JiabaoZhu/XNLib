//
//  XNBaseContract.h
//  XNTalk
//
//  Created by Jiabao on 16/7/5.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NSTR2CSTR(n_str) [n_str UTF8String]
#define CSTR2NSTR(c_str) [[NSString alloc] initWithCString:(const char*)c_str encoding:NSUTF8StringEncoding]


#pragma mark - interface 函数

#define PRIVATE_INTERFACE_FIELD(Type, FunctionName, Field)                              \
    - (void)set##FunctionName:(Type)Field;                                              \
    - (Type)Field;                                                                      \
    - (BOOL)has##FunctionName;                                                          \
    - (void)remove##FunctionName;

#define INTERFACE_BOOL_FIELD(FunctionName, Field)                                       \
    PRIVATE_INTERFACE_FIELD(BOOL, FunctionName, Field)

#define INTERFACE_INT_FIELD(FunctionName, Field)                                        \
    PRIVATE_INTERFACE_FIELD(int, FunctionName, Field)

#define INTERFACE_FLOAT_FIELD(FunctionName, Field)                                      \
    PRIVATE_INTERFACE_FIELD(float, FunctionName, Field)

#define INTERFACE_DOUBLE_FIELD(FunctionName, Field)                                     \
    PRIVATE_INTERFACE_FIELD(double, FunctionName, Field)

#define INTERFACE_SINT8_FIELD(FunctionName, Field)                                      \
    PRIVATE_INTERFACE_FIELD(SInt8, FunctionName, Field)

#define INTERFACE_SINT16_FIELD(FunctionName, Field)                                     \
    PRIVATE_INTERFACE_FIELD(SInt16, FunctionName, Field)

#define INTERFACE_SINT32_FIELD(FunctionName, Field)                                     \
    PRIVATE_INTERFACE_FIELD(SInt32, FunctionName, Field)

#define INTERFACE_SINT64_FIELD(FunctionName, Field)                                     \
    PRIVATE_INTERFACE_FIELD(SInt64, FunctionName, Field)

#define INTERFACE_INTEGER_FIELD(FunctionName, Field)                                    \
    PRIVATE_INTERFACE_FIELD(NSInteger, FunctionName, Field)

#define INTERFACE_UINT8_FIELD(FunctionName, Field)                                      \
    PRIVATE_INTERFACE_FIELD(UInt8, FunctionName, Field)

#define INTERFACE_UINT16_FIELD(FunctionName, Field)                                     \
    PRIVATE_INTERFACE_FIELD(UInt16, FunctionName, Field)

#define INTERFACE_UINT32_FIELD(FunctionName, Field)                                     \
    PRIVATE_INTERFACE_FIELD(UInt32, FunctionName, Field)

#define INTERFACE_UINT64_FIELD(FunctionName, Field)                                     \
    PRIVATE_INTERFACE_FIELD(UInt64, FunctionName, Field)

#define INTERFACE_UINTEGER_FIELD(FunctionName, Field)                                   \
    PRIVATE_INTERFACE_FIELD(NSUInteger, FunctionName, Field)

#define INTERFACE_NUMBER_FIELD(FunctionName, Field)                                     \
    PRIVATE_INTERFACE_FIELD(NSNumber*, FunctionName, Field)

#define INTERFACE_STRING_FIELD(FunctionName, Field)                                     \
    PRIVATE_INTERFACE_FIELD(NSString*, FunctionName, Field)

#define INTERFACE_DICTIONARY_FIELD(FunctionName, Field)                                 \
    PRIVATE_INTERFACE_FIELD(NSDictionary*, FunctionName, Field)

#define INTERFACE_ARRAY_FIELD(FunctionName, Field)                                      \
    PRIVATE_INTERFACE_FIELD(NSArray*, FunctionName, Field)

#define INTERFACE_OBJECT_FIELD(Type, FunctionName, Field)                               \
    PRIVATE_INTERFACE_FIELD(Type*, FunctionName, Field)

#define INTERFACE_ID_FIELD(Type, FunctionName, Field)                                   \
    PRIVATE_INTERFACE_FIELD(Type*, FunctionName, Field)

#define INTERFACE_CONTRACT_FIELD(Type, FunctionName, Field)                             \
    PRIVATE_INTERFACE_FIELD(Type*, FunctionName, Field)


#pragma mark - implementation 函数

#define PRIVATE_IMPLEMENTATION_FIELD(Type, FunctionName, Field, Key, Method)            \
    - (Type)Field {                                                                     \
        return [self getFieldValue_##Method:Key];                                       \
    }                                                                                   \
    - (void)set##FunctionName:(Type)Field {                                             \
        [self setFieldValue_##Method:Field forField:Key];                               \
    }                                                                                   \
    - (BOOL)has##FunctionName {                                                         \
        return [self hasField:Key];                                                     \
    }                                                                                   \
    - (void)remove##FunctionName {                                                      \
        [self removeObjectForField:Key];                                                \
    }

// 带Key
#define IMPLEMENTATION_BOOL_FIELD_KEY(FunctionName, Field, Key)                         \
    PRIVATE_IMPLEMENTATION_FIELD(BOOL, FunctionName, Field, Key, BOOL)

#define IMPLEMENTATION_INT_FIELD_KEY(FunctionName, Field, Key)                          \
    PRIVATE_IMPLEMENTATION_FIELD(int, FunctionName, Field, Key, int)

#define IMPLEMENTATION_FLOAT_FIELD_KEY(FunctionName, Field, Key)                        \
    PRIVATE_IMPLEMENTATION_FIELD(float, FunctionName, Field, Key, float)

#define IMPLEMENTATION_DOUBLE_FIELD_KEY(FunctionName, Field, Key)                       \
    PRIVATE_IMPLEMENTATION_FIELD(double, FunctionName, Field, Key, double)

#define IMPLEMENTATION_SINT8_FIELD_KEY(FunctionName, Field, Key)                        \
    PRIVATE_IMPLEMENTATION_FIELD(SInt8, FunctionName, Field, Key, SInt8)

#define IMPLEMENTATION_SINT16_FIELD_KEY(FunctionName, Field, Key)                       \
    PRIVATE_IMPLEMENTATION_FIELD(SInt16, FunctionName, Field, Key, SInt16)

#define IMPLEMENTATION_SINT32_FIELD_KEY(FunctionName, Field, Key)                       \
    PRIVATE_IMPLEMENTATION_FIELD(SInt32, FunctionName, Field, Key, SInt32)

#define IMPLEMENTATION_SINT64_FIELD_KEY(FunctionName, Field, Key)                       \
    PRIVATE_IMPLEMENTATION_FIELD(SInt64, FunctionName, Field, Key, SInt64)

#define IMPLEMENTATION_INTEGER_FIELD_KEY(FunctionName, Field, Key)                      \
    PRIVATE_IMPLEMENTATION_FIELD(NSInteger, FunctionName, Field, Key, Integer)

#define IMPLEMENTATION_UINT8_FIELD_KEY(FunctionName, Field, Key)                        \
    PRIVATE_IMPLEMENTATION_FIELD(UInt8, FunctionName, Field, Key, UInt8)

#define IMPLEMENTATION_UINT16_FIELD_KEY(FunctionName, Field, Key)                       \
    PRIVATE_IMPLEMENTATION_FIELD(UInt16, FunctionName, Field, Key, UInt16)

#define IMPLEMENTATION_UINT32_FIELD_KEY(FunctionName, Field, Key)                       \
    PRIVATE_IMPLEMENTATION_FIELD(UInt32, FunctionName, Field, Key, UInt32)

#define IMPLEMENTATION_UINT64_FIELD_KEY(FunctionName, Field, Key)                       \
    PRIVATE_IMPLEMENTATION_FIELD(UInt64, FunctionName, Field, Key, UInt64)

#define IMPLEMENTATION_UINTEGER_FIELD_KEY(FunctionName, Field, Key)                     \
    PRIVATE_IMPLEMENTATION_FIELD(NSUInteger, FunctionName, Field, Key, UInteger)

#define IMPLEMENTATION_NUMBER_FIELD_KEY(FunctionName, Field, Key)                       \
    PRIVATE_IMPLEMENTATION_FIELD(NSNumber*, FunctionName, Field, Key, Number)

#define IMPLEMENTATION_STRING_FIELD_KEY(FunctionName, Field, Key)                       \
    PRIVATE_IMPLEMENTATION_FIELD(NSString*, FunctionName, Field, Key, String)

#define IMPLEMENTATION_DICTIONARY_FIELD_KEY(FunctionName, Field, Key)                   \
    PRIVATE_IMPLEMENTATION_FIELD(NSDictionary*, FunctionName, Field, Key, Dictionary)

#define IMPLEMENTATION_ARRAY_FIELD_KEY(FunctionName, Field, Key)                        \
    PRIVATE_IMPLEMENTATION_FIELD(NSArray*, FunctionName, Field, Key, Array)

#define IMPLEMENTATION_OBJECT_FIELD_KEY(Type, FunctionName, Field, Key)                 \
    PRIVATE_IMPLEMENTATION_FIELD(Type*, FunctionName, Field, Key, id)

#define IMPLEMENTATION_ID_FIELD_KEY(Type, FunctionName, Field, Key)                     \
    PRIVATE_IMPLEMENTATION_FIELD(Type*, FunctionName, Field, Key, id)

#define IMPLEMENTATION_CONTRACT_FIELD_KEY(Type, FunctionName, Field, Key)               \
    - (Type*)Field {                                                                    \
        return [[Type alloc] initWithJsonDictionary:[self.fieldData objectForKey:Key]]; \
    }                                                                                   \
    - (void)set##FunctionName:(Type*)Field {                                            \
        if (nil == Field) {                                                             \
            [self.fieldData removeObjectForKey:Key];                                    \
        } else if (nil == Field.fieldData) {                                            \
            [self.fieldData removeObjectForKey:Key];                                    \
        } else {                                                                        \
            [self.fieldData setObject:Field.fieldData forKey:Key];                      \
        }                                                                               \
    }                                                                                   \
    - (BOOL)has##FunctionName {                                                         \
        return [self hasField:Key];                                                     \
    }                                                                                   \
    - (void)remove##FunctionName {                                                      \
        [self removeObjectForField:Key];                                                \
    }


// 不带Key
#define IMPLEMENTATION_BOOL_FIELD(FunctionName, Field)                                  \
    IMPLEMENTATION_BOOL_FIELD_KEY(FunctionName, Field, CSTR2NSTR(#Field))

#define IMPLEMENTATION_INT_FIELD(FunctionName, Field)                                   \
    IMPLEMENTATION_INT_FIELD_KEY(FunctionName, Field, CSTR2NSTR(#Field))

#define IMPLEMENTATION_FLOAT_FIELD(FunctionName, Field)                                 \
    IMPLEMENTATION_FLOAT_FIELD_KEY(FunctionName, Field, CSTR2NSTR(#Field))

#define IMPLEMENTATION_DOUBLE_FIELD(FunctionName, Field)                                \
    IMPLEMENTATION_DOUBLE_FIELD_KEY(FunctionName, Field, CSTR2NSTR(#Field))

#define IMPLEMENTATION_SINT8_FIELD(FunctionName, Field)                                 \
    IMPLEMENTATION_SINT8_FIELD_KEY(FunctionName, Field, CSTR2NSTR(#Field))

#define IMPLEMENTATION_SINT16_FIELD(FunctionName, Field)                                \
    IMPLEMENTATION_SINT16_FIELD_KEY(FunctionName, Field, CSTR2NSTR(#Field))

#define IMPLEMENTATION_SINT32_FIELD(FunctionName, Field)                                \
    IMPLEMENTATION_SINT32_FIELD_KEY(FunctionName, Field, CSTR2NSTR(#Field))

#define IMPLEMENTATION_SINT64_FIELD(FunctionName, Field)                                \
    IMPLEMENTATION_SINT64_FIELD_KEY(FunctionName, Field, CSTR2NSTR(#Field))

#define IMPLEMENTATION_INTEGER_FIELD(FunctionName, Field)                               \
    IMPLEMENTATION_INTEGER_FIELD_KEY(FunctionName, Field, CSTR2NSTR(#Field))

#define IMPLEMENTATION_UINT8_FIELD(FunctionName, Field)                                 \
    IMPLEMENTATION_UINT8_FIELD_KEY(FunctionName, Field, CSTR2NSTR(#Field))

#define IMPLEMENTATION_UINT16_FIELD(FunctionName, Field)                                \
    IMPLEMENTATION_UINT16_FIELD_KEY(FunctionName, Field, CSTR2NSTR(#Field))

#define IMPLEMENTATION_UINT32_FIELD(FunctionName, Field)                                \
    IMPLEMENTATION_UINT32_FIELD_KEY(FunctionName, Field, CSTR2NSTR(#Field))

#define IMPLEMENTATION_UINT64_FIELD(FunctionName, Field)                                \
    IMPLEMENTATION_UINT64_FIELD_KEY(FunctionName, Field, CSTR2NSTR(#Field))

#define IMPLEMENTATION_UINTEGER_FIELD(FunctionName, Field)                              \
    IMPLEMENTATION_UINTEGER_FIELD_KEY(FunctionName, Field, CSTR2NSTR(#Field))

#define IMPLEMENTATION_NUMBER_FIELD(FunctionName, Field)                                \
    IMPLEMENTATION_NUMBER_FIELD_KEY(FunctionName, Field, CSTR2NSTR(#Field))

#define IMPLEMENTATION_STRING_FIELD(FunctionName, Field)                                \
    IMPLEMENTATION_STRING_FIELD_KEY(FunctionName, Field, CSTR2NSTR(#Field))

#define IMPLEMENTATION_DICTIONARY_FIELD(FunctionName, Field)                            \
    IMPLEMENTATION_DICTIONARY_FIELD_KEY(FunctionName, Field, CSTR2NSTR(#Field))

#define IMPLEMENTATION_ARRAY_FIELD(FunctionName, Field)                                 \
    IMPLEMENTATION_ARRAY_FIELD_KEY(FunctionName, Field, CSTR2NSTR(#Field))

#define IMPLEMENTATION_OBJECT_FIELD(Type, FunctionName, Field)                          \
    IMPLEMENTATION_OBJECT_FIELD_KEY(Type, FunctionName, Field, CSTR2NSTR(#Field))

#define IMPLEMENTATION_ID_FIELD(Type, FunctionName, Field)                              \
    IMPLEMENTATION_ID_FIELD_KEY(Type, FunctionName, Field, CSTR2NSTR(#Field))

#define IMPLEMENTATION_CONTRACT_FIELD(Type, FunctionName, Field)                        \
    IMPLEMENTATION_CONTRACT_FIELD_KEY(Type, FunctionName, Field, CSTR2NSTR(#Field))

@interface XNBaseContract : NSObject

#pragma mark - 类方法 转换

//// Json数据转为Data
//+ (NSData*)JsonDictToData:(NSDictionary*)dict;
//+ (NSData*)JsonStringToData:(NSString*)string;
//+ (NSMutableData*)JsonDictToMutableData:(NSDictionary*)dict;
//+ (NSMutableData*)JsonStringToMutableData:(NSString*)string;
//
//// Json数据转为String
//+ (NSString*)JsonDictToString:(NSDictionary*)dict;
//+ (NSString*)JsonDataToString:(NSData*)data;
//+ (NSMutableString*)JsonDictToMutableString:(NSDictionary*)dict;
//+ (NSMutableString*)JsonDataToMutableString:(NSData*)data;
//
//// Json数据转为Dictionary
//+ (NSDictionary*)JsonStringToDict:(NSString*)string;
//+ (NSDictionary*)JsonDataToDict:(NSData*)data;
//+ (NSMutableDictionary*)JsonDataToMutableDict:(NSData*)data;
//+ (NSMutableDictionary*)JsonStringToMutableDict:(NSString*)string;


//#pragma mark - 类方法 初始化
//+ (instancetype)contract;
//+ (instancetype)contractWithJsonDict:(NSDictionary*)dict;
//+ (instancetype)contractWithJsonData:(NSData*)data;
//+ (instancetype)contractWithJsonString:(NSString*)string;

#pragma mark - 实例方法 初始化
- (instancetype)init;
- (instancetype)initWithJsonDictionary:(NSDictionary*)dictionary;
- (instancetype)initWithJsonData:(NSData*)data;
- (instancetype)initWithJsonString:(NSString*)string;

#pragma mark - 获得Json数据
- (NSDictionary*)jsonDictionary;
- (NSData*)jsonData;
- (NSString*)jsonString;
- (NSMutableDictionary*)jsonMutableDictionary;
- (NSMutableData*)jsonMutableData;
- (NSMutableString*)jsonMutableString;

#pragma mark - 设置Json数据
- (void)setJsonDictionary:(NSDictionary*)dictionary;
- (void)setJsonData:(NSData*)data;
- (void)setJsonString:(NSString*)string;

#pragma mark - 检查有没有字段
- (BOOL)hasField:(NSString *)field;

#pragma mark - 移除key
- (void)removeObjectForField:(NSString *)field;

#pragma mark - 设置字段的值
- (void)setFieldValue_BOOL: (BOOL)value forField:(NSString*)field;
- (void)setFieldValue_int:(int)value forField:(NSString*)field;
- (void)setFieldValue_float:(float)value forField:(NSString*)field;
- (void)setFieldValue_double:(double)value forField:(NSString*)field;
- (void)setFieldValue_SInt8:(SInt8)value forField:(NSString*)field;
- (void)setFieldValue_SInt16:(SInt16)value forField:(NSString*)field;
- (void)setFieldValue_SInt32:(SInt32)value forField:(NSString*)field;
- (void)setFieldValue_SInt64:(SInt64)value forField:(NSString*)field;
- (void)setFieldValue_Integer:(NSInteger)value forField:(NSString*)field;
- (void)setFieldValue_UInt8:(UInt8)value forField:(NSString*)field;
- (void)setFieldValue_UInt16:(UInt16)value forField:(NSString*)field;
- (void)setFieldValue_UInt32:(UInt32)value forField:(NSString*)field;
- (void)setFieldValue_UInt64:(UInt64)value forField:(NSString*)field;
- (void)setFieldValue_UInteger:(NSUInteger)value forField:(NSString*)field;
- (void)setFieldValue_Number:(NSNumber*)value forField:(NSString*)field;
- (void)setFieldValue_String:(NSString*)value forField:(NSString*)field;
- (void)setFieldValue_Dictionary:(NSDictionary*)value forField:(NSString*)field;
- (void)setFieldValue_Array:(NSArray*)value forField:(NSString*)field;
- (void)setFieldValue_id:(id)value forField:(NSString*)field;

#pragma mark - 获得字段的值
- (BOOL)getFieldValue_BOOL:(NSString*)field;
- (int)getFieldValue_int:(NSString*)field;
- (float)getFieldValue_float:(NSString*)field;
- (double)getFieldValue_double:(NSString*)field;
- (SInt8)getFieldValue_SInt8:(NSString*)field;
- (SInt16)getFieldValue_SInt16:(NSString*)field;
- (SInt32)getFieldValue_SInt32:(NSString*)field;
- (SInt64)getFieldValue_SInt64:(NSString*)field;
- (NSInteger)getFieldValue_Integer:(NSString*)field;
- (UInt8)getFieldValue_UInt8:(NSString*)field;
- (UInt16)getFieldValue_UInt16:(NSString*)field;
- (UInt32)getFieldValue_UInt32:(NSString*)field;
- (UInt64)getFieldValue_UInt64:(NSString*)field;
- (NSUInteger)getFieldValue_UInteger:(NSString*)field;
- (NSNumber*)getFieldValue_Number:(NSString*)field;
- (NSString*)getFieldValue_String:(NSString*)field;
- (NSDictionary*)getFieldValue_Dictionary:(NSString*)field;
- (NSArray*)getFieldValue_Array:(NSString*)field;
- (id)getFieldValue_id:(NSString*)field;

@property (nonatomic, strong, readonly) NSMutableDictionary *fieldData;
@end

/*
 void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  BOOL value,             NSString* key);
 void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  int value,              NSString* key);
 void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  float value,            NSString* key);
 void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  UInt8 value,            NSString* key);
 void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  UInt16 value,           NSString* key);
 void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  UInt32 value,           NSString* key);
 void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  UInt64 value,           NSString* key);
 void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  NSInteger value,        NSString* key);
 void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  NSNumber* value,        NSString* key);
 void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  NSString* value,        NSString* key);
 void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  NSDictionary* value,    NSString* key);
 void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  NSArray* value,         NSString* key);
 void __attribute__((overloadable)) setFieldValue(   NSMutableDictionary* dict,  XNBaseContract* value,  NSString* key);
 
 BOOL            __attribute__((overloadable)) getFieldValue_BOOL(NSDictionary* dict, NSString* key);
 int             __attribute__((overloadable)) getFieldValue_int(NSDictionary* dict, NSString* key);
 float           __attribute__((overloadable)) getFieldValue_float(NSDictionary* dict, NSString* key);
 UInt8           __attribute__((overloadable)) getFieldValue_Int8(NSDictionary* dict, NSString* key);
 UInt16          __attribute__((overloadable)) getFieldValue_Int16(NSDictionary* dict, NSString* key);
 UInt32          __attribute__((overloadable)) getFieldValue_Int32(NSDictionary* dict, NSString* key);
 UInt64          __attribute__((overloadable)) getFieldValue_Int64(NSDictionary* dict, NSString* key);
 NSInteger       __attribute__((overloadable)) getFieldValue_Interger(NSDictionary* dict, NSString* key);
 NSNumber*       __attribute__((overloadable)) getFieldValue_Number(NSDictionary* dict, NSString* key);
 NSString*       __attribute__((overloadable)) getFieldValue_String(NSDictionary* dict, NSString* key);
 NSDictionary*   __attribute__((overloadable)) getFieldValue_Dictionary(NSDictionary* dict, NSString* key);
 NSArray*        __attribute__((overloadable)) getFieldValue_Array(NSDictionary* dict, NSString* key);
 XNBaseContract* __attribute__((overloadable)) getFieldValue_Contract(NSDictionary* dict, NSString* key);
 */

