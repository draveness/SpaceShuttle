//
//  UIViewController+Route.m
//  SpaceShuttle
//
//  Created by apple on 15/5/21.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import "UIViewController+Route.h"
#import "SpaceShuttleRouter.h"

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
