//
//  YYPresentViewController.h
//  PhotoAblum
//
//  Created by 韩亚周 on 15/11/5.
//  Copyright (c) 2015年 韩亚周. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYPresentViewController : UIViewController
/*!重写系统的模态弹出方法，把viewcontrller加上导航*/
- (void)presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^)(void))completion;

@end
