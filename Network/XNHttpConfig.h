//
//  XNHttpConfig.h
//  XNTalk
//
//  Created by Jiabao on 16/7/8.
//  Copyright © 2016年 xiniunet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XNHelperDefine.h"

@interface XNHttpConfig : NSObject

INTERFACE_SINGLETON(Config)

- (NSError*)check;

#pragma mark 环境名称
@property (nonatomic, copy, readonly) NSString *environment;

#pragma mark URL
@property (nonatomic, copy) NSString *url;

#pragma mark appKey
@property (nonatomic, copy) NSString *appKey;

#pragma mark secret
@property (nonatomic, copy) NSString *secret;

@end
