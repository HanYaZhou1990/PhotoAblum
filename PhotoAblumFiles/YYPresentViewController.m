//
//  YYPresentViewController.m
//  PhotoAblum
//
//  Created by 韩亚周 on 15/11/5.
//  Copyright (c) 2015年 韩亚周. All rights reserved.
//

#import "YYPresentViewController.h"

@implementation YYPresentViewController

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^)(void))completion {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewControllerToPresent];
    [super presentViewController:nav animated:flag completion:completion];
}

@end
