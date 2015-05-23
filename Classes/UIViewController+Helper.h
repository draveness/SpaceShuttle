//
//  UIViewController+Helper.h
//  SpaceShuttle
//
//  Created by apple on 15/5/23.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Helper)

@property (nonatomic, weak) UIViewController *from;

- (UIViewController *)setupViewController:(UIViewController *)viewController withSupplies:(NSDictionary *)supplies;

@end
