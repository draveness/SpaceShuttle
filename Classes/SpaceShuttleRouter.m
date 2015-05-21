//
//  SpaceShuttleRouter.m
//  SpaceShuttle
//
//  Created by apple on 15/5/21.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import "SpaceShuttleRouter.h"

@interface SpaceShuttleRouter ()

@property (nonatomic, strong) NSMutableDictionary *destinations;

@end

@implementation SpaceShuttleRouter

+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static SpaceShuttleRouter *instance;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
        instance.destinations = [[NSMutableDictionary alloc] init];
    });
    return instance;
}

+ (NSMutableDictionary *)currentDestinations {
    return [[[self sharedInstance] destinations] copy];
}

+ (void)addRouteFrom:(Class)fromKlass to:(Class)toKlass {
    NSString *fromClass = NSStringFromClass(fromKlass);
    NSString *toClass = NSStringFromClass(toKlass);

    NSMutableSet *set = [[self sharedInstance] destinations][fromClass];
    if (!set) {
        [[self sharedInstance] destinations][fromClass] = [[NSMutableSet alloc] initWithObjects:toClass, nil];
        return;
    }
    [set addObject:toClass];
}

+ (void)removeRouteFrom:(Class)fromKlass to:(Class)toKlass {
    NSString *fromClass = NSStringFromClass(fromKlass);
    NSString *toClass = NSStringFromClass(toKlass);

    NSMutableSet *set = [[self sharedInstance] destinations][fromClass];
    if (!set) {
        [[self sharedInstance] destinations][fromClass] = [[NSMutableSet alloc] init];
        return;
    }
    [set removeObject:toClass];
}

+ (BOOL)checkValidRouteFrom:(Class)fromKlass to:(Class)toKlass {
    NSString *fromClass = NSStringFromClass(fromKlass);
    NSString *toClass = NSStringFromClass(toKlass);

    NSMutableSet *set = [[self sharedInstance] destinations][fromClass];
    if (!set) return NO;
    return [set containsObject:toClass];
}

@end
