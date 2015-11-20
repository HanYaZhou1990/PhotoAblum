//
//  YYPhotoAlbumViewController.h
//  PhotoAblum
//
//  Created by 韩亚周 on 15/11/5.
//  Copyright (c) 2015年 韩亚周. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "YYPhotoAlbumCell.h"
#import "YYImageViewController.h"
#import "ALAssetsLibrary+Share.h"

@class YYPhotoAlbumViewController;

typedef void (^Dissmiss) (YYPhotoAlbumViewController *,NSArray *);

@interface YYPhotoAlbumViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

/*!相册列表*/
@property (nonatomic, strong) UITableView            *photoAlbumTableView;
/*!相册列表组*/
@property (nonatomic, strong) NSMutableArray         *photoAlbumGroupArray;
/*!当点击图片页面右上角的完成的时候，会回调并调用此回调*/
@property (nonatomic, copy)   Dissmiss               dissmissHandle;
/*!最多被选择的图片个数*/
@property (nonatomic, assign) NSInteger              maxCount;
/*!已被选出的图片个数*/
@property (nonatomic, assign) NSInteger              currentCount;

@end
