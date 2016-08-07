//
//  XNAppData.m
//  XNTalk
//
//  Created by Jiabao on 16/7/3.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import "XNAppData.h"

@implementation XNAppData

IMPLEMENTATION_SINGLETON(AppData)

- (instancetype)_init {
    return self;
}

#pragma mark - 获得应用程序版本
- (NSString *)appVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

#pragma mark - 获得应用程序名称
- (NSString*)appName {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"];
}

#pragma mark - 获得路径
- (NSString*)directoryForType:(XNAppDataDirectoryType)directoryType {
    switch (directoryType) {
        case XNAppDataDirectoryTypeHome:
            return [self homeDirectory];
            break;
            
        case XNAppDataDirectoryTypeDocument:
            return [self documentDirectory];
            break;
            
        case XNAppDataDirectoryTypeLibrary:
            return [self libraryDirectory];
            break;
            
        case XNAppDataDirectoryTypeCaches:
            return [self cachesDirectory];
            break;
            
        case XNAppDataDirectoryTypeTmp:
            return [self tmpDirectory];
            break;
            
        default:
            break;
    }
    return @"";
}

#pragma mark - 获取Home目录
- (NSString*)homeDirectory {
    return NSHomeDirectory();
}

#pragma mark - 获取Document目录
- (NSString*)documentDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

#pragma mark - 获取Library目录
- (NSString*)libraryDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
}

#pragma mark - 获取Caches目录
- (NSString*)cachesDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

#pragma mark - 获取Tmp目录
- (NSString*)tmpDirectory {
    return NSTemporaryDirectory();
}

#pragma mark - 通过文件名获取文件路径
- (NSString*)pathForName:(NSString *)fileName andSuffix:(NSString*)suffix inDirectory:(XNAppDataDirectoryType)directoryType {
    NSString *fullFileName = [self checkFileNameHaveSuffix:fileName suffix:suffix];
    return [[self directoryForType:directoryType] stringByAppendingPathComponent:fullFileName];
}

#pragma mark - 判断文件是否存在
- (BOOL)fileExistsAtName:(NSString *)fileName andSuffix:(NSString*)suffix inDirectory:(XNAppDataDirectoryType)directoryType {
    NSString *path = [self pathForName:fileName andSuffix:suffix inDirectory:directoryType];
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

#pragma mark - 读写文件 (结果为 NSMutableDictionary* 或 NSMutableArray*)
- (NSMutableDictionary*)readDictForFile:(NSString*)fileName andSuffix:(NSString*)suffix inDirectory:(XNAppDataDirectoryType)directoryType {
    NSString *filePath = [self pathForName:fileName andSuffix:suffix inDirectory:directoryType];
    NSMutableDictionary *dict = nil;
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath]){
        dict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    }
    return dict;
}

- (NSMutableArray*)readArrayForFile:(NSString*)fileName andSuffix:(NSString*)suffix inDirectory:(XNAppDataDirectoryType)directoryType {
    NSString *filePath = [self pathForName:fileName andSuffix:suffix inDirectory:directoryType];
    NSMutableArray *array = nil;
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath]){
        array = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    }
    return array;
}

- (BOOL)writeDictToFile:(NSDictionary*)dict fileName:(NSString*)fileName andSuffix:(NSString*)suffix inDirectory:(XNAppDataDirectoryType)directoryType {
    NSString *filePath = [self pathForName:fileName andSuffix:suffix inDirectory:directoryType];
    return [dict writeToFile:filePath atomically:YES];
}

- (BOOL)writeArrayToFile:(NSArray*)array fileName:(NSString*)fileName andSuffix:(NSString*)suffix inDirectory:(XNAppDataDirectoryType)directoryType {
    NSString *filePath = [self pathForName:fileName andSuffix:suffix inDirectory:directoryType];
    return [array writeToFile:filePath atomically:YES];
}

#pragma mark - 读写plist文件 (结果为 NSMutableDictionary* 或 NSMutableArray*)

- (NSMutableDictionary *)readDictForPlistFile:(NSString *)fileName inDirectory:(XNAppDataDirectoryType)directoryType {
    return [self readDictForFile:fileName andSuffix:@"plist" inDirectory:directoryType];
}

- (NSMutableArray *)readArrayForPlistFile:(NSString *)fileName inDirectory:(XNAppDataDirectoryType)directoryType {
    return [self readArrayForFile:fileName andSuffix:@"plist" inDirectory:directoryType];
}

- (BOOL)writeDictToPlistFile:(NSDictionary *)dict fileName:(NSString *)fileName inDirectory:(XNAppDataDirectoryType)directoryType {
    return [self writeDictToFile:dict fileName:fileName andSuffix:@"plist" inDirectory:directoryType];
}

- (BOOL)writeArrayToPlistFile:(NSArray *)array fileName:(NSString *)fileName inDirectory:(XNAppDataDirectoryType)directoryType {
    return [self writeArrayToFile:array fileName:fileName andSuffix:@"plist" inDirectory:directoryType];
}

#pragma mark - 检查后缀名
- (NSString*)checkFileNameHaveSuffix:(NSString*)fileName suffix:(NSString*)suffix {
    NSString *fullFileName = nil;
    if ([fileName hasSuffix:[NSMutableString stringWithFormat:@".%@", suffix]]) {
        fullFileName = fileName;
    } else {
        fullFileName = [[NSString alloc] initWithFormat:@"%@.%@", fileName, suffix];
    }
    return fullFileName;
}

@end
