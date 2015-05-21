//
//  SpaceShuttleRouter.h
//  SpaceShuttle
//
//  Created by apple on 15/5/21.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpaceShuttleRouter : NSObject

+ (NSMutableDictionary *)currentRoutes;
+ (void)addRouteFrom:(Class)fromKlass to:(Class)toKlass;
+ (void)removeRouteFrom:(Class)fromKlass to:(Class)toKlass;
+ (BOOL)checkValidRouteFrom:(Class)fromKlass to:(Class)toKlass;

@end
