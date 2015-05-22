//
//  UIViewController+Supply.m
//  SpaceShuttle
//
//  Created by apple on 15/5/21.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import "UIViewController+Supply.h"
#import <objc/runtime.h>
@implementation UIViewController (Supply)

- (NSDictionary *)supplies {
    return objc_getAssociatedObject(self, @selector(supplies));
}

- (void)setSupplies:(NSDictionary *)supplies {
    objc_setAssociatedObject(self, @selector(supplies), supplies, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
