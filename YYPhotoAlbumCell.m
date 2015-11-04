//
//  YYPhotoAlbumCell.m
//  PhotoAblum
//
//  Created by 韩亚周 on 15/11/4.
//  Copyright (c) 2015年 韩亚周. All rights reserved.
//

#import "YYPhotoAlbumCell.h"

@implementation YYPhotoAlbumCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _groupImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _groupImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _groupImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _groupImageView.layer.borderWidth = 0.5f;
        [self.contentView addSubview:_groupImageView];
        
        _groupNameLable = [[UILabel alloc]initWithFrame:CGRectZero];
        _groupNameLable.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_groupNameLable];
        
        _numberOfImageLable = [[UILabel alloc]initWithFrame:CGRectZero];
        _numberOfImageLable.translatesAutoresizingMaskIntoConstraints = NO;
        _numberOfImageLable.font = [UIFont systemFontOfSize:15.0f];
        [self.contentView addSubview:_numberOfImageLable];
        
        [self.contentView addConstraints:[NSLayoutConstraint
                                          constraintsWithVisualFormat:[NSString stringWithFormat:@"H:|-[_groupImageView(==68)]"]
                                          options:1.0
                                          metrics:nil
                                          views:NSDictionaryOfVariableBindings(_groupImageView)]];
        
        [self.contentView addConstraints:[NSLayoutConstraint
                                          constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|-10-[_groupImageView]-10-|"]
                                          options:1.0
                                          metrics:nil
                                          views:NSDictionaryOfVariableBindings(_groupImageView)]];
        
        [self.contentView addConstraints:[NSLayoutConstraint
                                          constraintsWithVisualFormat:[NSString stringWithFormat:@"H:[_groupImageView]-[_groupNameLable]"]
                                          options:1.0
                                          metrics:nil
                                          views:NSDictionaryOfVariableBindings(_groupImageView,_groupNameLable)]];
        
        [self.contentView addConstraints:[NSLayoutConstraint
                                          constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|-10-[_groupNameLable(==28)]"]
                                          options:1.0
                                          metrics:nil
                                          views:NSDictionaryOfVariableBindings(_groupNameLable)]];
        [self.contentView addConstraints:[NSLayoutConstraint
                                          constraintsWithVisualFormat:[NSString stringWithFormat:@"H:[_groupImageView]-[_numberOfImageLable]"]
                                          options:1.0
                                          metrics:nil
                                          views:NSDictionaryOfVariableBindings(_groupImageView,_numberOfImageLable)]];
        
        [self.contentView addConstraints:[NSLayoutConstraint
                                          constraintsWithVisualFormat:[NSString stringWithFormat:@"V:[_groupNameLable(==28)]-[_numberOfImageLable(==28)]"]
                                          options:1.0
                                          metrics:nil
                                          views:NSDictionaryOfVariableBindings(_groupNameLable,_numberOfImageLable)]];
        
    }
    return self;
}

@end
