//
//  XKAnimatedTransitioning.h
//  XKTransition
//
//  Created by 浪漫恋星空 on 2018/6/26.
//  Copyright © 2018年 浪漫恋星空. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XKTransitionConfiguration;

@interface XKAnimatedTransitioning : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign, getter=isPresentation) BOOL presentation;
@property (nonatomic, strong) XKTransitionConfiguration *configuration;

+ (instancetype)transitioningWithConfiguration:(XKTransitionConfiguration *)configuration isPresentation:(BOOL)presentation;

@end
