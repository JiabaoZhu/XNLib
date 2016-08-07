//
//  XNNetworkManager.m
//  XNTalk
//
//  Created by Jiabao on 16/7/8.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import <ifaddrs.h>
#import <arpa/inet.h>
#import "AFNetworking.h"
#import "XNNetworkManager.h"

@interface XNNetworkManager () {
    XNNetworkStatus _networkStatus;
}
@end

@implementation XNNetworkManager

IMPLEMENTATION_SINGLETON(Manager)

- (instancetype)_init {
    // 检查网络状态
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                _networkStatus = XNNetworkStatusUnknown;
                break;
            case AFNetworkReachabilityStatusNotReachable:
                _networkStatus = XNNetworkStatusNotReachable;
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                _networkStatus = XNNetworkStatusReachableViaWWAN;
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                _networkStatus = XNNetworkStatusReachableViaWiFi;
                break;
            default:
                _networkStatus = XNNetworkStatusUnknown;
                break;
        }
        
        if ([self.delegate respondsToSelector:@selector(networkManager:networkStatusChange:)]) {
            [self.delegate networkManager:self networkStatusChange:_networkStatus];
        }
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    return self;
}

#pragma mark - 网络状态
- (BOOL)isUseWifi {
    return (XNNetworkStatusReachableViaWiFi == _networkStatus);
}
- (BOOL)isUseWWAN {
    return (XNNetworkStatusReachableViaWWAN == _networkStatus);
}
- (BOOL)isNotReachable {
    return (XNNetworkStatusNotReachable == _networkStatus);
}
- (XNNetworkStatus)networkStatus {
    return _networkStatus;
}
- (NSString *)networkStatusString {
    NSString *str = nil;
    switch (_networkStatus) {
        case XNNetworkStatusUnknown:
            str = @"未知网络";
            break;
        case XNNetworkStatusNotReachable:
            str = @"无网络";
            break;
        case XNNetworkStatusReachableViaWiFi:
            str = @"无线网络";
            break;
        case XNNetworkStatusReachableViaWWAN:
            str = @"数据网络";
            break;
        default:
            break;
    }
    return str;
}

#pragma mark - 获取设备IP地址
- (NSString *)ipAddresses {
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (0 == success) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while (NULL != temp_addr) {
            if (AF_INET == temp_addr->ifa_addr->sa_family) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
}

@end
