//
//  SpaceShuttleTransitionTask.m
//  SpaceShuttle
//
//  Created by apple on 15/5/21.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import "SpaceShuttleTransitionTask.h"
#import "SpaceShuttleRouter.h"
#import "UIViewController+Supply.h"

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

- (void)launch {
    NSAssert([SpaceShuttleRouter checkValidRouteFrom:self.departure.class to:self.destination], @"Route does not appear in the route map.");
    if ([self checkRequired]) {
        if (self.transitionStyle == SpaceShuttleTransitionStylePush) {
            [self pushTo:self.destination];
        } else if (self.transitionStyle == SpaceShuttleTransitionStylePresent) {
            [self presentTo:self.destination];
        }
    }
}

- (void)pushTo:(Class)klass {
    UINavigationController *navigationController = self.departure.navigationController;
    if (navigationController) {
        UIViewController *vc = [self setupViewControllerWithClass:klass];
        [navigationController pushViewController:vc animated:self.animated];
        self.completion();
    } else {
        NSLog(@"Depature does not have a navigation controller");
    }
}

- (void)presentTo:(Class)klass {
    UIViewController *vc = [self setupViewControllerWithClass:klass];
    [self.departure presentViewController:vc animated:self.animated completion:self.completion];
}

- (UIViewController *)setupViewControllerWithClass:(Class)klass {
    UIViewController *vc = [[klass alloc] init];
    for (NSString *key in self.supplies.allKeys) {
        id value = self.supplies[key];
        [vc setValue:value forKey:key];
    }
    return vc;
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
