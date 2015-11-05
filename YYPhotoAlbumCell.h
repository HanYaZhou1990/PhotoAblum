//
//  YYPhotoAlbumCell.h
//  PhotoAblum
//
//  Created by 韩亚周 on 15/11/4.
//  Copyright (c) 2015年 韩亚周. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYPhotoAlbumCell : UITableViewCell

/*!相册封面图*/
@property (nonatomic, strong) UIImageView    *groupImageView;
/*!相册的名字*/
@property (nonatomic, strong) UILabel        *groupNameLable;
/*!相册中的图片个数*/
@property (nonatomic, strong) UILabel        *numberOfImageLable;

@end
