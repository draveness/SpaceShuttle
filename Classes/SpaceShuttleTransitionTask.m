//
//  SpaceShuttleTransitionTask.m
//  SpaceShuttle
//
//  Created by apple on 15/5/21.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import "SpaceShuttleTransitionTask.h"
#import "SpaceShuttleRouter.h"
#import "UIViewController+Helper.h"

@interface SpaceShuttleTransitionTask ()

@property (nonatomic, weak) UIViewController *departure;

@end

@implementation SpaceShuttleTransitionTask

- (instancetype)initWithDepature:(UIViewController *)depature {
    if (self = [super init]) {
        self.departure = depature;
        self.transitionStyle = SpaceShuttleTransitionStylePush;
        self.animated = YES;
    }
    return self;
}

- (void)setTransitionStyle:(SpaceShuttleTransitionStyle)transitionStyle {
    _transitionStyle = transitionStyle;
    if (_transitionStyle == SpaceShuttleTransitionStyleDismiss ||
        _transitionStyle == SpaceShuttleTransitionStylePop) {
        self.destination = self.departure.from.class;
    }
}

- (void)launch {
    NSAssert([SpaceShuttleRouter checkValidRouteFrom:self.departure.class to:self.destination], @"Route does not appear in the route map.");
    if ([self checkRequired]) {
        if (self.transitionStyle == SpaceShuttleTransitionStylePush) {
            [self pushTo:self.destination];
        } else if (self.transitionStyle == SpaceShuttleTransitionStylePresent) {
            [self presentTo:self.destination];
        } else if (self.transitionStyle == SpaceShuttleTransitionStyleDismiss) {
            [self dismiss];
        } else {

        }
    }
}

- (void)pushTo:(Class)klass {
    UINavigationController *navigationController = self.departure.navigationController;
    if (navigationController) {
        UIViewController *viewController = [self setupViewControllerWithClass:klass];
        viewController.from = self.departure;
        [navigationController pushViewController:viewController animated:self.animated];
    } else {
        NSLog(@"Depature does not have a navigation controller");
    }
}

- (void)presentTo:(Class)klass {
    UIViewController *viewController = [self setupViewControllerWithClass:klass];
    viewController.from = self.departure;
    [self.departure presentViewController:viewController animated:self.animated completion:nil];
}

- (void)popTo:(Class)klass {
    UINavigationController *navigationController = self.departure.navigationController;
    if (navigationController) {
        [navigationController popViewControllerAnimated:self.animated];
        [self setupViewController:self.departure.from];
    } else {
        NSLog(@"Depature does not have a navigation controller");
    }
}

- (void)dismiss {
    [self.departure dismissViewControllerAnimated:self.animated completion:nil];
    [self setupViewController:self.departure.from];
}

- (UIViewController *)setupViewControllerWithClass:(Class)klass {
    UIViewController *viewController = [[klass alloc] init];
    return [self setupViewController:viewController];
}

- (UIViewController *)setupViewController:(UIViewController *)viewController {
    for (NSString *key in self.supplies.allKeys) {
        id value = self.supplies[key];
        [viewController setValue:value forKey:key];
    }
    return viewController;
}

- (BOOL)checkRequired {
    for (NSString *key in self.required) {
        if (!self.supplies[key]) {
            NSLog(@"You didn't provide all required key before navigation");
            return NO;
        }
    }
    return YES;
}

@end
