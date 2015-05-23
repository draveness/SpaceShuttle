//
//  UIViewController+Helper.m
//  SpaceShuttle
//
//  Created by apple on 15/5/23.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import "UIViewController+Helper.h"
#import <objc/runtime.h>

@implementation UIViewController (Helper)

- (UIViewController *)from {
    return objc_getAssociatedObject(self, @selector(from));
}

- (void)setFrom:(UIViewController *)from {
    objc_setAssociatedObject(self, @selector(from), from, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIViewController *)setupViewController:(UIViewController *)viewController withSupplies:(NSDictionary *)supplies {
    for (NSString *key in supplies.allKeys) {
        id value = supplies[key];
        [viewController setValue:value forKey:key];
    }
    return viewController;
}

@end
