//
//  UIViewController+Helper.m
//  SpaceShuttle
//
//  Created by apple on 15/5/23.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import "UIViewController+Helper.h"
#import "SpaceShuttleRouter.h"
#import <objc/runtime.h>

@implementation UIViewController (Route)

- (NSSet *)currentDestinations {
    return [SpaceShuttleRouter currentRoutes][NSStringFromClass(self.class)];
}

- (void)addDestination:(Class)klass {
    [SpaceShuttleRouter addRouteFrom:self.class to:klass];
}

- (void)removeDestination:(Class)klass {
    [SpaceShuttleRouter removeRouteFrom:self.class to:klass];
}

- (BOOL)checkValidDestination:(Class)klass {
    return [SpaceShuttleRouter checkValidRouteFrom:self.class to:klass];
}

@end

@implementation UIViewController (Supply)

- (NSDictionary *)supplies {
    return objc_getAssociatedObject(self, @selector(supplies));
}

- (void)setSupplies:(NSDictionary *)supplies {
    objc_setAssociatedObject(self, @selector(supplies), supplies, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

@implementation UIViewController (From)

- (UIViewController *)from {
    return objc_getAssociatedObject(self, @selector(from));
}

- (void)setFrom:(UIViewController *)from {
    objc_setAssociatedObject(self, @selector(from), from, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
