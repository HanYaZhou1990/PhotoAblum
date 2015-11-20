//
//  UIViewController+Present.m
//  PhotoAblum
//
//  Created by 韩亚周 on 15/11/5.
//  Copyright (c) 2015年 韩亚周. All rights reserved.
//

#import "UIViewController+Present.h"

@implementation UIViewController (Present)

- (void)yyPresentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^)(void))completion {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewControllerToPresent];
    [self presentViewController:nav animated:flag completion:completion];
}

@end
