//
//  ViewController.m
//  SpaceShuttle
//
//  Created by apple on 15/5/19.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import "ViewController.h"
#import "SuccViewController.h"
#import "SpaceShuttle.h"
#import "PresentTransitionTask.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [SpaceShuttleRouter addRouteFrom:ViewController.class to:SuccViewController.class];
    [SpaceShuttleRouter addRouteFrom:SuccViewController.class to:ViewController.class];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, 200, 50)];
    [button setTitle:@"Push" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [button setCenter:self.view.center];
    [self.view addSubview:button];
    NSLog(@"ViewController %@", self.test);

}

- (void)push {
    PresentTransitionTask *task = [[PresentTransitionTask alloc] initWithDepature:self
                                        ];
    [task launch];
}

@end
