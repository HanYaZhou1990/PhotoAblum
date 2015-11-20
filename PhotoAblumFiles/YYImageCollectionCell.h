//
//  YYImageCollectionCell.h
//  PhotoAblum
//
//  Created by 韩亚周 on 15/11/4.
//  Copyright (c) 2015年 韩亚周. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYImageCollectionCell : UICollectionViewCell

/*!相册封面图*/
@property (nonatomic, strong) UIImageView    *backgroundImageView;
/*!选择图*/
@property (nonatomic, strong) UIImageView    *selectedImageView;

@end
