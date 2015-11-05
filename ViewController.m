//
//  ViewController.m
//  PhotoAblum
//
//  Created by 韩亚周 on 15/11/3.
//  Copyright (c) 2015年 韩亚周. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)addImage:(UIBarButtonItem *)item {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照",@"相册",nil];
    [actionSheet showInView:self.view];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *addButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addImage:)];
    self.navigationItem.rightBarButtonItem = addButtonItem;
    
    _images = [NSMutableArray array];
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
    
    self.imageCollectionView=[[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    [_imageCollectionView registerClass:[ImageCollectionCell class] forCellWithReuseIdentifier:@"imageCell"];
    _imageCollectionView.delegate=self;
    _imageCollectionView.dataSource=self;
    _imageCollectionView.scrollsToTop = NO;
    _imageCollectionView.showsVerticalScrollIndicator=NO;
    _imageCollectionView.backgroundColor = [UIColor whiteColor];
    _imageCollectionView.translatesAutoresizingMaskIntoConstraints = NO;
    _imageCollectionView.allowsMultipleSelection = YES;
    [self.view addSubview:_imageCollectionView];
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:_imageCollectionView
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeTop
                              multiplier:1.0
                              constant:0]];
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:_imageCollectionView
                              attribute:NSLayoutAttributeLeft
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeLeft
                              multiplier:1.0
                              constant:0]];
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:_imageCollectionView
                              attribute:NSLayoutAttributeWidth
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeWidth
                              multiplier:1.0
                              constant:0]];
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:_imageCollectionView
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeHeight
                              multiplier:1.0
                              constant:0]];
}

#pragma mark -
#pragma mark UIActionSheetDelegate -
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
        {
        
        }
            break;
        case 1:
        {
        
        __block ViewController *myViewController = self;
        YYPhotoAlbumViewController *photoAblum = [[YYPhotoAlbumViewController alloc]init];
        photoAblum.dissmissHandle = ^(YYPhotoAlbumViewController *viewController,NSArray *imageResults){
            [myViewController.images addObjectsFromArray:imageResults];
            dispatch_async(dispatch_get_main_queue(), ^{
                [myViewController.imageCollectionView reloadData];
            });
        };
        photoAblum.maxCount = 9;
        photoAblum.currentCount = [_images count];
        [self yyPresentViewController:photoAblum animated:YES completion:nil];
        }
            break;
        case 2:
        {
        
        }
            break;
            
        default:
            break;
    }
}

#pragma mark -
#pragma mark UICollectionViewDataSource -
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_images count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];
    ALAsset *result = _images[indexPath.row];
    cell.backgroundImageView.image = [UIImage imageWithCGImage: result.thumbnail];
    cell.deleteButtonHandle = ^(ImageCollectionCell *imageCell,UIButton *sender){
        dispatch_async(dispatch_get_main_queue(), ^{
            [_images removeObjectAtIndex:indexPath.row];
            [collectionView deleteItemsAtIndexPaths:@[indexPath]];
            for ( int i = indexPath.row; i < [_images count]; i ++) {
                [collectionView reloadItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:i inSection:0]]];
            }
        });
    };
    return cell;
}

#pragma mark -
#pragma mark UICollectionViewDelegate -
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ImageCollectionCell * cell = (ImageCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSLog(@"应该放大第%d张图,可是，不想写了",indexPath.row);
}


#pragma mark -
#pragma mark UICollectionViewDelegateFlowLayout -
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((MAIN_WIDTH-(4-1)*2)/4, 78);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 2.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 2.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
