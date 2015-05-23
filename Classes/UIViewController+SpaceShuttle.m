//
//  UIViewController+SpaceShuttle.m
//  SpaceShuttle
//
//  Created by apple on 15/5/23.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import "UIViewController+SpaceShuttle.h"
#import "UIViewController+Helper.h"

@implementation UIViewController (SpaceShuttle)

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion supplies:(NSDictionary *)supplies {
    viewControllerToPresent.from = self;
    [self setupViewController:viewControllerToPresent withSupplies:supplies];
    [self presentViewController:viewControllerToPresent animated:YES completion:completion];
}

- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion supplies:(NSDictionary *)supplies {
    [self setupViewController:self.from withSupplies:supplies];
    [self dismissViewControllerAnimated:flag completion:completion];
}

@end
