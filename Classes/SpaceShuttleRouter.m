//
//  SpaceShuttleRouter.m
//  SpaceShuttle
//
//  Created by apple on 15/5/21.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import "SpaceShuttleRouter.h"

@interface SpaceShuttleRouter ()

@property (nonatomic, strong) NSMutableDictionary *routes;

@end

@implementation SpaceShuttleRouter

+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static SpaceShuttleRouter *instance;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
        instance.routes = [[NSMutableDictionary alloc] init];
    });
    return instance;
}

+ (NSMutableDictionary *)currentRoutes {
    return [[[self sharedInstance] routes] copy];
}

+ (void)addRouteFrom:(Class)fromKlass to:(Class)toKlass {
    [self sanityCheck:fromKlass];
    [self sanityCheck:toKlass];

    NSString *fromClass = NSStringFromClass(fromKlass);
    NSString *toClass = NSStringFromClass(toKlass);

    NSMutableSet *set = [[self sharedInstance] routes][fromClass];
    if (!set) {
        [[self sharedInstance] routes][fromClass] = [[NSMutableSet alloc] initWithObjects:toClass, nil];
        return;
    }
    [set addObject:toClass];
}

+ (void)removeRouteFrom:(Class)fromKlass to:(Class)toKlass {
    [self sanityCheck:fromKlass];
    [self sanityCheck:toKlass];

    NSString *fromClass = NSStringFromClass(fromKlass);
    NSString *toClass = NSStringFromClass(toKlass);

    NSMutableSet *set = [[self sharedInstance] routes][fromClass];
    if (!set) {
        [[self sharedInstance] routes][fromClass] = [[NSMutableSet alloc] init];
        return;
    }
    [set removeObject:toClass];
}

+ (BOOL)checkValidRouteFrom:(Class)fromKlass to:(Class)toKlass {
    [self sanityCheck:fromKlass];
    [self sanityCheck:toKlass];

    NSString *fromClass = NSStringFromClass(fromKlass);
    NSString *toClass = NSStringFromClass(toKlass);

    NSMutableSet *set = [[self sharedInstance] routes][fromClass];
    if (!set) return NO;
    return [set containsObject:toClass];
}

+ (void)sanityCheck:(Class)klass {
    NSAssert([klass isSubclassOfClass:[UIViewController class]], @"FATAL ERROR: CLASS MUST BE UIViewController's SUBCLASS");
}

@end
