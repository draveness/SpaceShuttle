//
//  UINavigationController+SpaceShuttle.h
//  SpaceShuttle
//
//  Created by apple on 15/5/23.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (SpaceShuttle)

- (UIViewController *)popViewControllerAnimated:(BOOL)animated supplies:(NSDictionary *)supplies;

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated supplies:(NSDictionary *)supplies;

@end
