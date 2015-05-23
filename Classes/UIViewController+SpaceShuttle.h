//
//  UIViewController+SpaceShuttle.h
//  SpaceShuttle
//
//  Created by apple on 15/5/23.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SpaceShuttle)

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion supplies:(NSDictionary *)supplies;

- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion supplies:(NSDictionary *)supplies;

@end
