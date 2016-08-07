//
//  XNAppData.h
//  XNTalk
//
//  Created by Jiabao on 16/7/3.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, XNAppDataDirectoryType) {
    XNAppDataDirectoryTypeNone = 0,
    XNAppDataDirectoryTypeHome = 1,
    XNAppDataDirectoryTypeDocument,
    XNAppDataDirectoryTypeLibrary,
    XNAppDataDirectoryTypeCaches,
    XNAppDataDirectoryTypeTmp
};

@interface XNAppData : NSObject

INTERFACE_SINGLETON(AppData)

#pragma mark - 获得应用程序版本
- (NSString*)appVersion;

#pragma mark - 获得应用程序名称
- (NSString*)appName;

#pragma mark - 获得路径
- (NSString*)directoryForType:(XNAppDataDirectoryType)directoryType;

#pragma mark - 获取Home目录
- (NSString*)homeDirectory;

#pragma mark - 获取Document目录
- (NSString*)documentDirectory;

#pragma mark - 获取Library目录
- (NSString*)libraryDirectory;

#pragma mark - 获取Caches目录
- (NSString*)cachesDirectory;

#pragma mark - 获取Tmp目录
- (NSString*)tmpDirectory;


#pragma mark - 通过文件名获取文件路径
- (NSString*)pathForName:(NSString *)fileName andSuffix:(NSString*)suffix inDirectory:(XNAppDataDirectoryType)directoryType;

#pragma mark - 判断文件是否存在
- (BOOL)fileExistsAtName:(NSString *)fileName andSuffix:(NSString*)suffix inDirectory:(XNAppDataDirectoryType)directoryType;

#pragma mark - 读写文件 (结果为 NSMutableDictionary* 或 NSMutableArray*)
- (NSMutableDictionary*)readDictForFile:(NSString*)fileName andSuffix:(NSString*)suffix inDirectory:(XNAppDataDirectoryType)directoryType;
- (NSMutableArray*)readArrayForFile:(NSString*)fileName andSuffix:(NSString*)suffix inDirectory:(XNAppDataDirectoryType)directoryType;

- (BOOL)writeDictToFile:(NSDictionary*)dict fileName:(NSString*)fileName andSuffix:(NSString*)suffix inDirectory:(XNAppDataDirectoryType)directoryType;
- (BOOL)writeArrayToFile:(NSArray*)array fileName:(NSString*)fileName andSuffix:(NSString*)suffix inDirectory:(XNAppDataDirectoryType)directoryType;

#pragma mark - 读写plist文件 (结果为 NSMutableDictionary* 或 NSMutableArray*)
- (NSMutableDictionary*)readDictForPlistFile:(NSString*)fileName inDirectory:(XNAppDataDirectoryType)directoryType;
- (NSMutableArray*)readArrayForPlistFile:(NSString*)fileName inDirectory:(XNAppDataDirectoryType)directoryType;

- (BOOL)writeDictToPlistFile:(NSDictionary*)dict fileName:(NSString*)fileName inDirectory:(XNAppDataDirectoryType)directoryType;
- (BOOL)writeArrayToPlistFile:(NSArray*)array fileName:(NSString*)fileName inDirectory:(XNAppDataDirectoryType)directoryType;
@end
