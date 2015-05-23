//
//  SuccViewController.m
//  SpaceShuttle
//
//  Created by apple on 15/5/21.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import "SuccViewController.h"
#import "SpaceShuttle.h"

@interface SuccViewController ()

@end

@implementation SuccViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, 200, 50)];
    [button setTitle:@"Back" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [button setCenter:self.view.center];
    [self.view addSubview:button];
    NSLog(@"SuccViewController %@ %@", self.test, [self valueForKey:@"from"]);
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES supplies:@{@"test": @1}];
}

@end
