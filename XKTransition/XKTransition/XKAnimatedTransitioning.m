//
//  XKAnimatedTransitioning.m
//  XKTransition
//
//  Created by 浪漫恋星空 on 2018/6/26.
//  Copyright © 2018年 浪漫恋星空. All rights reserved.
//

#import "XKAnimatedTransitioning.h"
#import "XKTransitionConfiguration.h"

@implementation XKAnimatedTransitioning

+ (instancetype)transitioningWithConfiguration:(XKTransitionConfiguration *)configuration isPresentation:(BOOL)presentation {
    XKAnimatedTransitioning *transitioning = [[XKAnimatedTransitioning alloc] init];
    transitioning.configuration = configuration;
    transitioning.presentation = presentation;
    return transitioning;
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return self.configuration.animationDuration;
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    BOOL isPresentation = self.isPresentation;
    if (isPresentation && toView) {
        [transitionContext.containerView addSubview:toView];
    }
    
    UIViewController *animatingVC = isPresentation ? toVC : fromVC;
    CGRect finalFrame = [transitionContext finalFrameForViewController:animatingVC];
    UIView *animatingView = isPresentation ? toView : fromView;
    
    switch (_configuration.direction) {
        case XKTransitionDirectionTop:
            animatingView.frame = isPresentation ? CGRectOffset(finalFrame, 0.0, -finalFrame.size.height) : finalFrame;
            break;
        case XKTransitionDirectionRight:
            animatingView.frame = isPresentation ? CGRectOffset(finalFrame, finalFrame.size.width, 0.0) : finalFrame;
            break;
        case XKTransitionDirectionBottom:
            animatingView.frame = isPresentation ? CGRectOffset(finalFrame, 0.0, finalFrame.size.height) : finalFrame;
            break;
        case XKTransitionDirectionLeft:
            animatingView.frame = isPresentation ? CGRectOffset(finalFrame, -finalFrame.size.width, 0.0) : finalFrame;
            break;
        case XKTransitionDirectionCenter:
            animatingView.frame = finalFrame;
            animatingView.alpha = isPresentation ? 0.0 : 1.0;
            break;
    }
    
    [UIView animateWithDuration:self.configuration.animationDuration delay:0.0 options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState animations:^{
        switch (self.configuration.direction) {
            case XKTransitionDirectionTop:
                animatingView.frame = isPresentation ? finalFrame : CGRectOffset(finalFrame, 0.0, -finalFrame.size.height);
                break;
            case XKTransitionDirectionRight:
                animatingView.frame = isPresentation ? finalFrame : CGRectOffset(finalFrame, finalFrame.size.width, 0.0);
                break;
            case XKTransitionDirectionBottom:
                animatingView.frame = isPresentation ? finalFrame : CGRectOffset(finalFrame, 0.0, finalFrame.size.height);
                break;
            case XKTransitionDirectionLeft:
                animatingView.frame = isPresentation ? finalFrame : CGRectOffset(finalFrame, -finalFrame.size.width, 0.0);
                break;
            case XKTransitionDirectionCenter:
                animatingView.alpha = isPresentation ? 1.0 : 0.0;
                break;
        }
    } completion:^(BOOL finished) {
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        if (!self.isPresentation && !wasCancelled) {
            [fromView removeFromSuperview];
        }
        [transitionContext completeTransition:!wasCancelled];
    }];
}

@end
