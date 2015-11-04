//
//  YYImageViewController.m
//  PhotoAblum
//
//  Created by 韩亚周 on 15/11/4.
//  Copyright (c) 2015年 韩亚周. All rights reserved.
//

#import "YYImageViewController.h"


@interface YYImageViewController ()
/*!没一行摆放多少个，如果手机是竖向，则摆放4个，横向则摆放7个*/
@property (nonatomic, assign) NSInteger         numberOfLines;

@end

@implementation YYImageViewController

- (void)doneButtonItemClicked:(UIBarButtonItem *)buttonItem{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonItemClicked:)];
    /*
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
    UIDeviceOrientation  orient = [UIDevice currentDevice].orientation;
    if (orient == UIDeviceOrientationPortrait ||
        orient == UIDeviceOrientationFaceUp ||
        orient == UIDeviceOrientationFaceDown ||
        orient == UIDeviceOrientationUnknown) {
        _numberOfLines = 4;
    }else{
        _numberOfLines = MAIN_WIDTH<=480?6:7;
    }
    [_imageCollectionView reloadData];
    */
    _numberOfLines = 4;
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
    
    self.imageCollectionView=[[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    [_imageCollectionView registerClass:[YYImageCollectionCell class] forCellWithReuseIdentifier:@"imageCell"];
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
    
    _imageArray = [NSMutableArray array];
    dispatch_async(dispatch_get_main_queue(), ^{
        @autoreleasepool {
            [_photoGroup enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                if (result) {
                    [_imageArray addObject:result];
                    if ([_imageArray count] == _numberOfPhotoAblum) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [_imageCollectionView reloadData];
                        });
                    }else{}
                }
            }];
        }
    });
}

#pragma mark -
#pragma mark UICollectionViewDataSource -
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_imageArray count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YYImageCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];
    ALAsset *result = _imageArray[indexPath.row];
    cell.backgroundImageView.image = [UIImage imageWithCGImage: result.thumbnail];
    return cell;
}

#pragma mark -
#pragma mark UICollectionViewDelegate -

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
}

#pragma mark -
#pragma mark UICollectionViewDelegateFlowLayout -
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((MAIN_WIDTH-(_numberOfLines-1)*2)/_numberOfLines, 78);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 2.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 2.0f;
}
/*
- (void)orientChange:(NSNotification *)noti
{
    UIDeviceOrientation  orient = [UIDevice currentDevice].orientation;
    if (orient == UIDeviceOrientationPortrait ||
        orient == UIDeviceOrientationFaceUp ||
        orient == UIDeviceOrientationFaceDown ||
        orient == UIDeviceOrientationUnknown) {
        _numberOfLines = 4;
    }else{
        _numberOfLines = MAIN_WIDTH<=480?6:7;
    }
    [_imageCollectionView reloadData];
}*/

//NSLog(@"%@",[UIImage imageWithCGImage: result.thumbnail]);
///*资源类型*/
//NSString *type=[result valueForProperty:ALAssetPropertyType];
//NSLog(@"type = %@",type);
///*照查看资源的地理位置信息*/
//NSLog(@"---> %@",[result valueForProperty:ALAssetPropertyLocation]);
///*拍摄时间*/
//NSLog(@"---> %@",[result valueForProperty:ALAssetPropertyDate]);
///*查看资源的描述信息*/
//NSLog(@"ALAssetPropertyRepresentations:%@",[result valueForProperty:ALAssetPropertyRepresentations]);
//NSLog(@"ALAssetPropertyURLs:%@",[result valueForProperty:ALAssetPropertyURLs]);
//
///*查看资源的url路径*/
//NSLog(@"ALAssetPropertyAssetURL:%@",[result valueForProperty:ALAssetPropertyAssetURL]);

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
