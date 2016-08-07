//
//  XNNetworkManager.h
//  XNTalk
//
//  Created by Jiabao on 16/7/8.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XNNetworkManager;

typedef enum : NSInteger {
    XNNetworkStatusUnknown          = -1,
    XNNetworkStatusNotReachable     = 0,
    XNNetworkStatusReachableViaWWAN = 1,
    XNNetworkStatusReachableViaWiFi = 2
} XNNetworkStatus;

@protocol XNNetworkManagerDelegate<NSObject>

@optional
- (void)networkManager:(XNNetworkManager *)manager networkStatusChange:(XNNetworkStatus)status;
@end

@interface XNNetworkManager : NSObject

INTERFACE_SINGLETON(Manager)

#pragma mark - 网络状态
- (BOOL)isUseWifi;
- (BOOL)isUseWWAN;
- (BOOL)isNotReachable;
- (XNNetworkStatus)networkStatus;
- (NSString*)networkStatusString;

#pragma mark - 获取设备IP地址
- (NSString *)ipAddresses;

@property (nonatomic, weak) id<XNNetworkManagerDelegate> delegate;

@end
