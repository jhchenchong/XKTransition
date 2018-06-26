//
//  XKPresentationController.h
//  XKTransition
//
//  Created by 浪漫恋星空 on 2018/6/26.
//  Copyright © 2018年 浪漫恋星空. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XKTransitionConfiguration;

@interface XKPresentationController : UIPresentationController

@property (nonatomic, strong) XKTransitionConfiguration *configuration;

@end
