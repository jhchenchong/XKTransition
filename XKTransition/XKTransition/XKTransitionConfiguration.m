//
//  XKTransitionConfiguration.m
//  XKTransition
//
//  Created by 浪漫恋星空 on 2018/6/26.
//  Copyright © 2018年 浪漫恋星空. All rights reserved.
//

#import "XKTransitionConfiguration.h"

@implementation XKTransitionConfiguration

+ (instancetype)defaultConfiguration {
    return [[XKTransitionConfiguration alloc] init];
}

- (instancetype)init {
    if (self = [super init]) {
        _direction = XKTransitionDirectionBottom;
        _animationDuration = 0.5;
        _autoDismissModal = YES;
        _backgroundOpacity = 0.3;
        
        _enableShadow = NO;
        _shadowColor = [UIColor blackColor];
        _shadowWidth = 3.0;
        _shadowOpacity = 0.8;
        _shadowRadius = 5.0;
        
        _enableBackgroundAnimation = NO;
        _backgroundColor = [UIColor blackColor];
        _backgroundImage = nil;
        
        _enableInteractiveTransitioning = YES;
    }
    return self;
}


@end
