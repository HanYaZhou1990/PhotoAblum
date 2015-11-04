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

- (void)viewWillAppear:(BOOL)animated {

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableView) name:ALAssetsLibraryChangedNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ALAssetsLibraryChangedNotification object:nil];
}

- (void)reloadTableView
{
    [_photoAlbumGroupArray removeAllObjects];
    [_assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if (group) {
            [_photoAlbumGroupArray addObject:group];
            [_photoAlbumTableView reloadData];
        }
    } failureBlock:^(NSError *error) {
        NSLog(@"Group not found!\n");
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _photoAlbumGroupArray = [NSMutableArray array];
    
    _photoAlbumTableView = [[UITableView alloc]initWithFrame:CGRectZero];
    _photoAlbumTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [_photoAlbumTableView registerClass:[YYPhotoAlbumCell class] forCellReuseIdentifier:@"cell"];
    _photoAlbumTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _photoAlbumTableView.dataSource = self;
    _photoAlbumTableView.delegate = self;
    [self.view addSubview:_photoAlbumTableView];
    
    [self.view addConstraints:[NSLayoutConstraint
                              constraintsWithVisualFormat:@"H:|[_photoAlbumTableView]|"
                              options:1.0
                              metrics:nil
                               views:NSDictionaryOfVariableBindings(_photoAlbumTableView)]];
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|[_photoAlbumTableView]|"
                               options:1.0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(_photoAlbumTableView)]];
    
    
    _assetsLibrary = [[ALAssetsLibrary alloc] init];
    [_assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if (group) {
            [_photoAlbumGroupArray addObject:group];
            [_photoAlbumTableView reloadData];
            NSLog(@"---> %@",[group valueForProperty:ALAssetsGroupPropertyName]);
        }
    } failureBlock:^(NSError *error) {
        NSLog(@"Group not found!\n");
    }];
}

#pragma mark -
#pragma mark UITableViewDataSource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_photoAlbumGroupArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YYPhotoAlbumCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        //获取相册的封面图片
    CGImageRef poster = [_photoAlbumGroupArray[indexPath.row] posterImage];
    [cell.groupImageView setImage:[UIImage imageWithCGImage:poster]];
    cell.groupNameLable.text = [_photoAlbumGroupArray[indexPath.row] valueForProperty:ALAssetsGroupPropertyName];
    cell.numberOfImageLable.text = [NSString stringWithFormat:@"%ld",(NSInteger)[_photoAlbumGroupArray[indexPath.row] numberOfAssets]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88;
}
#pragma mark -
#pragma mark UITableViewDelegate -
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    YYImageViewController *imageViewController = [[YYImageViewController alloc]init];
    imageViewController.photoGroup = _photoAlbumGroupArray[indexPath.row];
    imageViewController.numberOfPhotoAblum = [_photoAlbumGroupArray[indexPath.row] numberOfAssets];
    [self.navigationController pushViewController:imageViewController animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
