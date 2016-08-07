//
//  UIViewController+XNLib.m
//  IM
//
//  Created by Jiabao on 16/6/28.
//  Copyright © 2016年 Jiabao. All rights reserved.
//

#import "UIViewController+XNLib.h"

@implementation UIViewController (XNLib)

/*
#pragma mark - 点击View事件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    // 使用了IQKeyboardManager库, 所以不用手动隐藏键盘
    // [self hideKeyboard];
}
*/

#pragma mark - 隐藏键盘
- (void)hideKeyboard {
    [self.view endEditing:YES];
    // [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    // [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

#pragma mark - 设置导航栏透明
- (void)setNavigationBarTranslucent {
    // 导航栏透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    // self.navigationController.navigationBar.translucent = YES;
}

@end
