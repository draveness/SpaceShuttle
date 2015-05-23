//
//  UINavigationController+SpaceShuttle.m
//  SpaceShuttle
//
//  Created by apple on 15/5/23.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import "UINavigationController+SpaceShuttle.h"
#import "UIViewController+SpaceShuttle.h"
#import "UIViewController+Helper.h"
#import <objc/runtime.h>

@implementation UINavigationController (SpaceShuttle)

- (UIViewController *)popViewControllerAnimated:(BOOL)animated supplies:(NSDictionary *)supplies {
    [self setupViewController:self.topViewController.from withSupplies:supplies];
    return [self popViewControllerAnimated:animated];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated supplies:(NSDictionary *)supplies {
    viewController.from = self.topViewController;
    [self setupViewController:viewController withSupplies:supplies];
    [self pushViewController:viewController animated:YES];
}

@end
