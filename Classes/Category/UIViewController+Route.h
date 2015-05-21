//
//  UIViewController+Route.h
//  SpaceShuttle
//
//  Created by apple on 15/5/21.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Route)

- (NSSet *)currentDestinations;
- (void)addDestination:(Class)klass;
- (void)removeDestination:(Class)klass;
- (BOOL)checkValidDestination:(Class)klass;

@end
