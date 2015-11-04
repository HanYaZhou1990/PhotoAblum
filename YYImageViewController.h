//
//  YYImageViewController.h
//  PhotoAblum
//
//  Created by 韩亚周 on 15/11/4.
//  Copyright (c) 2015年 韩亚周. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "YYImageCollectionCell.h"

#define MAIN_WIDTH [[UIScreen mainScreen] bounds].size.width

@interface YYImageViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

/*!相册*/
@property (nonatomic, strong) ALAssetsGroup     *photoGroup;
/*!相册中图片的个数*/
@property (nonatomic, assign) NSInteger         numberOfPhotoAblum;
/*!相册图片的展示*/
@property (nonatomic, strong) UICollectionView  *imageCollectionView;
@property (nonatomic, strong) NSMutableArray    *imageArray;

@end
