//
//  PresentTransitionTask.m
//  SpaceShuttle
//
//  Created by apple on 15/5/22.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import "PresentTransitionTask.h"
#import "SuccViewController.h"

@implementation PresentTransitionTask

- (instancetype)initWithDepature:(UIViewController *)depature {
    if (self = [super initWithDepature:depature]) {
        self.transitionStyle = SpaceShuttleTransitionStylePresent;
        self.destination = SuccViewController.class;
        self.required = @[@"test"];
        self.supplies = @{@"test":@1};
    }
    return self;
}

@end
