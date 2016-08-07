//
//  XNHttpOperation.h
//  XNTalk
//
//  Created by Jiabao on 16/7/8.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XNHttpOperation;

typedef enum : NSInteger {
    XNHttpOperationTypePost = 1,
    XNHttpOperationTypeGet = 2
} XNHttpOperationType;

#pragma mark - 网络请求协议
@protocol XNHttpOperationDelegate <NSObject>
@required
- (void)httpOperationDidComplete:(XNHttpOperation *)httpOperation request:(XNBaseRequest*)request;
@end


@interface XNHttpOperation : NSObject

- (instancetype)init;
- (instancetype)initWithRequest:(XNBaseRequest*)request type:(XNHttpOperationType)type;

// 超时时间, 设为0表示将等待操作完成
@property (nonatomic, assign) NSTimeInterval timeOutSec;
@property (nonatomic, weak) id<XNHttpOperationDelegate> delegate;

- (void)post:(XNBaseRequest*)request;
- (void)get:(XNBaseRequest*)request;

// 结果
@property (nonatomic, assign, readonly) BOOL isSuccress;

// response类型
@property (nonatomic, assign, readonly) BOOL responseIsArray;
@property (nonatomic, assign, readonly) BOOL responseIsDictionary;

// 返回值
@property (nonatomic, copy, readonly) NSArray *responseArray;
@property (nonatomic, copy, readonly) NSDictionary *responseDictionary;

// 错误信息
@property (nonatomic, copy, readonly) NSString *errorMsg;

@end
