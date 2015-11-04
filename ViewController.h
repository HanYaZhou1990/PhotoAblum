//
//  ViewController.h
//  ;
//
//  Created by 韩亚周 on 15/11/3.
//  Copyright (c) 2015年 韩亚周. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "YYPhotoAlbumCell.h"
#import "YYImageViewController.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

/*!相册列表*/
@property (nonatomic, strong) UITableView            *photoAlbumTableView;
/*!相册列表组*/
@property (nonatomic, strong) NSMutableArray         *photoAlbumGroupArray;
@property (nonatomic, strong) ALAssetsLibrary *assetsLibrary;

@end

