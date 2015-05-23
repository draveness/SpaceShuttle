//
//  SpaceShuttleTransitionTask.h
//  SpaceShuttle
//
//  Created by apple on 15/5/21.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    SpaceShuttleTransitionStylePush,
    SpaceShuttleTransitionStylePresent,
    SpaceShuttleTransitionStyleDismiss,
    SpaceShuttleTransitionStylePop,
} SpaceShuttleTransitionStyle;

@interface SpaceShuttleTransitionTask : NSObject

@property (nonatomic, weak, readonly) UIViewController *departure;
@property (nonatomic, strong) Class destination;
@property (nonatomic, assign) SpaceShuttleTransitionStyle transitionStyle;
@property (nonatomic, strong) NSDictionary *supplies;
@property (nonatomic, strong) NSArray *required;
@property (nonatomic, assign) BOOL animated;

- (instancetype)initWithDepature:(UIViewController *)depature;

- (void)launch;

@end
