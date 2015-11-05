//
//  ImageCollectionCell.h
//  HNRuMi
//
//  Created by 韩亚周 on 15/11/3.
//  Copyright (c) 2015年 HYZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageCollectionCell;

typedef void (^deleteButtonClicked) (ImageCollectionCell *, UIButton *);

@interface ImageCollectionCell : UICollectionViewCell

/*!负责展示图片*/
@property (nonatomic, strong) UIImageView        *backgroundImageView;
/*!删除按钮*/
@property (nonatomic, strong, readonly) UIButton *deleteButton;
/*!负责删除按钮的展示和隐藏*/
@property (nonatomic, assign) BOOL               hiddenDeleteButton;

@property (nonatomic, copy) deleteButtonClicked  deleteButtonHandle;

@end
