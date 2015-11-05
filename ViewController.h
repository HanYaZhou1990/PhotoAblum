//
//  ViewController.h
//  ;
//
//  Created by 韩亚周 on 15/11/3.
//  Copyright (c) 2015年 韩亚周. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYPhotoAlbumViewController.h"
#import "UIViewController+Present.h"
#import "ImageCollectionCell.h"

/*由于模态弹出的页面没有上导航，所以写了两个解决方案
 1.#import "YYPresentViewController.h"
 然后把继承改为 YYPresentViewController
 2.#import "UIViewController+Present.h"
 使用 yyPresentViewController: animated: completion: 我修改过的方法进行模态弹出
 */

@interface ViewController : UIViewController<UIActionSheetDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

/*!图片的展示*/
@property (nonatomic, strong) UICollectionView            *imageCollectionView;
/*!被选出来的图片*/
@property (nonatomic, strong) NSMutableArray              *images;

@end

