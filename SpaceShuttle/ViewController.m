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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"ViewController %@", self.test);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
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
    SuccViewController *succViewController = [[SuccViewController alloc] init];
    [self.navigationController pushViewController:succViewController
                                         animated:YES
                                         supplies:@{@"test":@1}];

}

@end
