//
//  ALAssetsLibrary+Share.m
//  PhotoAblum
//
//  Created by 韩亚周 on 15/11/5.
//  Copyright (c) 2015年 韩亚周. All rights reserved.
//

#import "ALAssetsLibrary+Share.h"

@implementation ALAssetsLibrary(Share)

static ALAssetsLibrary *assetsLibrary = nil;
+ (ALAssetsLibrary *)defaultLibrary{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        assetsLibrary = [[ALAssetsLibrary alloc] init];
    });
    
    return assetsLibrary;
}

@end
