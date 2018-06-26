//
//  UIViewController+XKTransition.h
//  XKTransition
//
//  Created by 浪漫恋星空 on 2018/6/26.
//  Copyright © 2018年 浪漫恋星空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XKTransitionConfiguration.h"

@interface UIViewController (XKTransition)

/**
 显示一个模态视图控制器
 
 @param viewController  模态视图控制器
 @param contentSize     模态窗口大小(内部会限制宽高最大值为屏幕的宽高)
 @param configuration   模态窗口的配置信息
 @param completion      模态窗口显示完毕时的回调
 */
- (void)presentModalWithViewController:(UIViewController *)viewController contentSize:(CGSize)contentSize configuration:(XKTransitionConfiguration *)configuration completion:(dispatch_block_t)completion NS_AVAILABLE_IOS(8_0);

/**
 显示一个模态视图
 
 @param view            模态视图控制器
 @param contentSize     模态窗口大小(内部会限制宽高最大值为屏幕的宽高)
 @param configuration   模态窗口的配置信息
 @param completion      模态窗口显示完毕时的回调
 */
- (void)presentModalWithView:(UIView *)view contentSize:(CGSize)contentSize configuration:(XKTransitionConfiguration *)configuration completion:(dispatch_block_t)completion NS_AVAILABLE_IOS(8_0);

@end
