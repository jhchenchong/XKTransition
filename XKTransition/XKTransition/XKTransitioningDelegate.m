//
//  XKTransitioningDelegate.m
//  XKTransition
//
//  Created by 浪漫恋星空 on 2018/6/26.
//  Copyright © 2018年 浪漫恋星空. All rights reserved.
//

#import "XKTransitioningDelegate.h"
#import "XKTransitionConfiguration.h"
#import "XKAnimatedTransitioning.h"
#import "XKPresentationController.h"
#import "XKDrivenInteractiveTransition.h"

@implementation XKTransitioningDelegate {
    XKTransitionConfiguration *_configuration;
}

+ (instancetype)transitioningDelegateWithConfiguration:(XKTransitionConfiguration *)configuration {
    XKTransitioningDelegate *delegate = [[XKTransitioningDelegate alloc] init];
    delegate->_configuration = configuration;
    return delegate;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [XKAnimatedTransitioning transitioningWithConfiguration:_configuration
                                                    isPresentation:YES];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [XKAnimatedTransitioning transitioningWithConfiguration:_configuration
                                                    isPresentation:NO];
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator {
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    if (_configuration.enableInteractiveTransitioning & _configuration.isStartedInteractiveTransitioning) {
        return [XKDrivenInteractiveTransition interactiveTransitionWithConfiguration:_configuration];
    }
    return nil;
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    XKPresentationController *presentationController = [[XKPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    presentationController.configuration = _configuration;
    return presentationController;
}

@end
