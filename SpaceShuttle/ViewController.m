//
//  ViewController.m
//  SpaceShuttle
//
//  Created by apple on 15/5/19.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import "ViewController.h"
#import "SpaceShuttle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [SpaceShuttleRouter addRouteFrom:ViewController.class to:self.class];
    [SpaceShuttleRouter addRouteFrom:ViewController.class to:UIViewController.class];
    [SpaceShuttleRouter addRouteFrom:UIViewController.class to:UIViewController.class];
    [SpaceShuttleRouter removeRouteFrom:UIViewController.class to:UIViewController.class];
    NSLog(@"%d", [SpaceShuttleRouter checkValidRouteFrom:UIViewController.class to:UIViewController.class]);
    NSLog(@"%@", [SpaceShuttleRouter currentRoutes]);
    NSLog(@"%@", [self currentDestinations]);
}

@end
