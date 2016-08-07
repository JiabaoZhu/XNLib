//
//  XNHttpConfig.m
//  XNTalk
//
//  Created by Jiabao on 16/7/8.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import "XNHttpConfig.h"

@implementation XNHttpConfig

IMPLEMENTATION_SINGLETON(Config)

- (instancetype)_init {
    
#ifdef ENABLE_DEV_ENVIRONMENT
    // dev 环境
    _environment = @"dev environment";
    _url = @"https://xntalk-api-dev.xiniunet.com/router";
    _appKey = @"0617CA8376F9901F28FF46B69BF9CF44";
    _secret = @"28570C9D069ED51226DD9F028BD5E6DD";
#elif defined(ENABLE_PRODUCTION_ENVIRONMENT)
    // 生产环境
    _environment = @"production environment";
    _url = @"https://xntalk-api.xiniunet.com/router";
    _appKey = @"0617CA8376F9901F28FF46B69BF9CF47";
    _secret = @"28570C9D069ED51226DD9F028BD5E6DC";
#else
    // 未知环境
    _environment = @"unknown environment";
    _url = @"";
    _appKey = @"";
    _secret = @"";
#endif
    
    return self;
}

- (NSError *)check {
    if (nil == _url || 0 == _url.length) {
        return [NSError errorWithDomain:@"url地址为空" code:-1 userInfo:nil];
    }
    if (nil == _appKey || 0 == _appKey.length) {
        return [NSError errorWithDomain:@"appkey为空" code:-1 userInfo:nil];
    }
    if (nil == _secret || 0 == _secret.length) {
        return [NSError errorWithDomain:@"secret为空" code:-1 userInfo:nil];
    }
    return nil;
}

@end
