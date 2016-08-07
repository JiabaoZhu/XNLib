//
//  XNHttpOperation.m
//  XNTalk
//
//  Created by Jiabao on 16/7/8.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import "XNHttpOperation.h"

@interface XNHttpOperation () {
    NSURLSessionDataTask *task;
    NSTimer *timer;
}
@end

@implementation XNHttpOperation

- (instancetype)init {
    self = [super init];
    if (nil == self) {
        _timeOutSec = 10.0f;
        _responseIsArray = NO;
        _responseIsDictionary = NO;
        _isSuccress = NO;
    }
    return self;
}

- (instancetype)initWithRequest:(XNBaseRequest *)request type:(XNHttpOperationType)type {
    self = [self init];
    if (nil != self) {
        [self operation:request type:type];
    }
    return self;
}

- (void)post:(XNBaseRequest*)request {
    [self operation:request type:XNHttpOperationTypePost];
}

- (void)get:(XNBaseRequest*)request {
    
}

- (void)operation:(XNBaseRequest*)request type:(XNHttpOperationType)type {
    NSError *error = [[XNHttpConfig defaultConfig] check];
    if (nil != error) {
        _errorMsg = error.domain;
        return;
    } else if ([[XNNetworkManager defaultManager] isNotReachable]) {
        _errorMsg = @"网络连接出现异常, 请检查网络设置";
        return;
    }
    
    [request.fieldData setObject:[request method] forKey:@"method"];
    [request.fieldData setObject:[XNHttpConfig defaultConfig].appKey forKey:@"app_key"];
    [request.fieldData setObject:[XNHttpConfig defaultConfig].secret forKey:@"secret"];
    [request createSign];
    
    // 开启计时器, 准备计算是否超时
    if (0 != _timeOutSec) {
        timer = [NSTimer scheduledTimerWithTimeInterval:_timeOutSec target:self selector:@selector(requestTimeOut) userInfo:nil repeats:NO];
    }
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    task = [manager POST:[XNHttpConfig defaultConfig].url parameters:request.fieldData progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [timer invalidate];
        
        _isSuccress = NO;
        _responseIsArray = NO;
        _responseIsDictionary = NO;
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            _isSuccress = YES;
            _responseIsDictionary = YES;
            _responseDictionary = [responseObject copy];
            
            NSArray *errors = [responseObject objectForKey:@"errors"];
            
            if (0 < [[responseObject objectForKey:@"message"] length]) {
                _isSuccress = NO;
                _errorMsg = [responseObject objectForKey:@"message"];
            } else if (0 < [errors count]) {
                _isSuccress = NO;
                _errorMsg = [[errors objectAtIndex:0] objectForKey:@"message"];
            }
        } else if ([responseObject isKindOfClass:[NSArray class]]) {
            _isSuccress = YES;
            _responseIsArray = YES;
            _responseArray = [responseObject copy];
        } else if ([responseObject isKindOfClass:[NSString class]]) {
            // 404错误
            if([responseObject hasPrefix:@"<html>"]) {
                _errorMsg = @"系统后台接口出错";
            } else {
                _isSuccress = YES;
                _responseIsDictionary = YES;
                _responseDictionary = [(NSString*)responseObject toJsonDictionary];
            }
        }
        
#if defined(ENABLE_HTTP_LOG)
        if (_responseIsDictionary) {
            NSLog(@"\nmethod: %@ \n\nrequest: %@ \n\nresponse[dict]:%@\n\n\n", request.method, request.fieldData, _responseDictionary);
        } else if (_responseIsArray) {
            NSLog(@"\nmethod: %@ \n\nrequest: %@ \n\nresponse[array]:%@\n\n\n", request.method, request.fieldData, _responseArray);
        } else {
            NSLog(@"\nmethod: %@ \n\nrequest: %@ \n\nresponse[string]:%@\n\n\n", request.method, request.fieldData, responseObject);
        }
#endif
        
        if ([self.delegate respondsToSelector:@selector(httpOperationDidComplete:request:)]) {
            [self.delegate httpOperationDidComplete:self request:request];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [timer invalidate];
        _isSuccress = NO;
        _responseIsArray = NO;
        _responseIsDictionary = NO;
        _errorMsg = error.domain;
        if ([self.delegate respondsToSelector:@selector(httpOperationDidComplete:request:)]) {
            [self.delegate httpOperationDidComplete:self request:request];
        }
    }];
}

-(void)requestTimeOut
{
    [task cancel];
    _isSuccress = NO;
    _errorMsg = @"请求操作超时";
}

@end
