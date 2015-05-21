//
//  UIViewController+Navigation.m
//  SpaceShuttle
//
//  Created by apple on 15/5/21.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import "UIViewController+Navigation.h"
#import "UIViewController+Route.h"

@implementation UIViewController (Navigation)

- (void)launchTo:(Class)klass {
    if ([self checkValidDestination:klass]) {
        id vc = [[klass alloc] init];
        if (self.navigationController) {
            [self.navigationController pushViewController:vc animated:YES];
        } else {
            [self presentViewController:vc animated:YES completion:nil];
        }
    }
}

@end
