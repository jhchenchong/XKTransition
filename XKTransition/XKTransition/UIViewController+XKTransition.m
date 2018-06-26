//
//  UIViewController+XKTransition.m
//  XKTransition
//
//  Created by 浪漫恋星空 on 2018/6/26.
//  Copyright © 2018年 浪漫恋星空. All rights reserved.
//

#import "UIViewController+XKTransition.h"
#import <objc/message.h>
#import "XKTransitioningDelegate.h"

@implementation UIViewController (XKTransition)

- (void)presentModalWithViewController:(UIViewController *)viewController contentSize:(CGSize)contentSize configuration:(XKTransitionConfiguration *)configuration completion:(dispatch_block_t)completion {
    NSAssert(configuration != nil, @"configuration cann't be nil.");
    if (self.presentedViewController) { return; }
    viewController.modalPresentationStyle = UIModalPresentationCustom;
    viewController.preferredContentSize = contentSize;
    
    XKTransitioningDelegate *transitioningDelegate = [XKTransitioningDelegate transitioningDelegateWithConfiguration:configuration];
    viewController.transitioningDelegate = transitioningDelegate;
    objc_setAssociatedObject(viewController, _cmd, transitioningDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self presentViewController:viewController animated:true completion:completion];
}

- (void)presentModalWithView:(UIView *)view contentSize:(CGSize)contentSize configuration:(XKTransitionConfiguration *)configuration completion:(dispatch_block_t)completion {
    UIViewController *modalVC = [[UIViewController alloc] init];
    modalVC.view.backgroundColor = [UIColor clearColor];
    [modalVC.view addSubview:view];
    
    view.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *views = @{@"view": view};
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:views]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:views]];
    
    [self presentModalWithViewController:modalVC contentSize:contentSize configuration:configuration completion:completion];
}

@end
