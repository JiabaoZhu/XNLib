//
//  XNHelperDefine.h
//  XNTalk
//
//  Created by Jiabao on 16/6/29.
//  Copyright © 2016年 Jiabao. All rights reserved.
//

#ifndef XNHelperDefine_h
#define XNHelperDefine_h

#pragma mark - IOS8 and later
#define IOS8_LATER ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0)

#pragma mark - 判断是ARC还是MRC
#if __has_feature(objc_arc)
#define ARC_MODE
#else
#define MRC_MODE
#endif

// 从云信移植
#define SuppressPerformSelectorLeakWarning(Stuff)           \
    do {                                                    \
        _Pragma("clang diagnostic push")                    \
        _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
        Stuff;                                              \
        _Pragma("clang diagnostic pop")                     \
    } while (0)


#pragma mark - 声明单例
/**
 *  声明单例
 *
 *  @param name 单例的方法名 如传入Application 则单例方法名为 sharedApplication 和 defaultApplication
 *
 */
#define INTERFACE_SINGLETON(methodName)                     \
    +(instancetype)shared##methodName;                      \
    +(instancetype)default##methodName;

#pragma mark - 实现单例

#ifdef MRC_MODE
#define MRC_SINGLETON_METHODS                               \
    - (id)autorelease { return self; }                      \
    - (oneway void)release { }                              \
    - (id)retain { return self; }                           \
    - (NSUInteger)retainCount { return UINT_MAX; }          \
    - (void)dealloc { [super dealloc]; }

#else
#define MRC_SINGLETON_METHODS
#endif

/**
 *  实现单例
 *
 *  @param name 单例的方法名 如传入Application 则单例方法名为 sharedApplication 和 defaultApplication
 *
 *  如果需要初始化 请实现  _init 方法
 *
 */
#define IMPLEMENTATION_SINGLETON(methodName)                \
    static id sharedInstance = nil;                         \
    + (instancetype)shared##methodName {                    \
        return [[self alloc] init];                         \
    }                                                       \
    + (instancetype)default##methodName {                   \
        return [[self alloc] init];                         \
    }                                                       \
    + (instancetype)allocWithZone:(struct _NSZone *)zone {  \
        static dispatch_once_t onceToken;                   \
        dispatch_once(&onceToken, ^{                        \
            sharedInstance = [super allocWithZone:zone];    \
        });                                                 \
        return sharedInstance;                              \
    }                                                       \
    - (instancetype)copyWithZone:(NSZone *)zone {           \
        return sharedInstance;                              \
    }                                                       \
    - (instancetype)mutableCopyWithZone:(struct _NSZone *)zone { \
        return sharedInstance;                              \
    }                                                       \
    - (instancetype)init {                                  \
        static dispatch_once_t onceToken;                   \
        dispatch_once(&onceToken, ^{                        \
            sharedInstance = [super init];                  \
            if ([self respondsToSelector:@selector(_init)]) { \
                [self _init];                               \
            }                                               \
        });                                                 \
        return sharedInstance;                              \
    }                                                       \
    MRC_SINGLETON_METHODS


#pragma mark - 调试宏工具

// 展开
#define MACRO_EXPAND(macro) MACRO_EXPAND_PRIVATE(macro)
#define MACRO_EXPAND_PRIVATE(macro) macro

// 将展开后的宏转为 字符串
#define MACRO_TO_STRING(macro) MACRO_TO_STRING_PRIVATE(macro)
#define MACRO_TO_STRING_PRIVATE(macro) #macro

// 拼接宏
#define MACRO_APPEND(x, y) MACRO_APPEND_PRIVATE(x, y)
#define MACRO_APPEND_PRIVATE(x, y) x##y

#endif /* XNHelperDefine_h */
