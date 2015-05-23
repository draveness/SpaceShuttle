//
//  UIViewController+Helper.h
//  SpaceShuttle
//
//  Created by apple on 15/5/23.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Route)

- (NSSet *)currentDestinations;
- (void)addDestination:(Class)klass;
- (void)removeDestination:(Class)klass;
- (BOOL)checkValidDestination:(Class)klass;

@end

@interface UIViewController (Supply)

@property (nonatomic, strong) NSDictionary *supplies;

@end

@interface UIViewController (From)

@property (nonatomic, weak) UIViewController *from;

@end
