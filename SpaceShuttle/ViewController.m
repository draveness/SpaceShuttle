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
    self.view.backgroundColor = [UIColor whiteColor];
    [SpaceShuttleRouter addRouteFrom:ViewController.class to:self.class];
    [SpaceShuttleRouter addRouteFrom:ViewController.class to:UIViewController.class];
    [SpaceShuttleRouter addRouteFrom:UIViewController.class to:UIViewController.class];
    [SpaceShuttleRouter removeRouteFrom:UIViewController.class to:UIViewController.class];
    NSLog(@"%d", [SpaceShuttleRouter checkValidRouteFrom:UIViewController.class to:UIViewController.class]);
    NSLog(@"%@", [SpaceShuttleRouter currentRoutes]);
    NSLog(@"%@", [self currentDestinations]);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, 200, 50)];
    [button setTitle:@"Push" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [button setCenter:self.view.center];
    [self.view addSubview:button];
}

- (void)push {
    [self launchTo:self.class];
}

@end
