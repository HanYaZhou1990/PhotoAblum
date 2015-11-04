//
//  YYImageCollectionCell.m
//  PhotoAblum
//
//  Created by 韩亚周 on 15/11/4.
//  Copyright (c) 2015年 韩亚周. All rights reserved.
//

#import "YYImageCollectionCell.h"

@implementation YYImageCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _backgroundImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_backgroundImageView];
        
        _selectedImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _selectedImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _selectedImageView.image = [UIImage imageNamed:@"3.png"];
        [self.contentView addSubview:_selectedImageView];
        
        [self.contentView addConstraints:[NSLayoutConstraint
                                          constraintsWithVisualFormat:[NSString stringWithFormat:@"H:|[_backgroundImageView]|"]
                                          options:1.0
                                          metrics:nil
                                          views:NSDictionaryOfVariableBindings(_backgroundImageView)]];
        
        [self.contentView addConstraints:[NSLayoutConstraint
                                          constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|[_backgroundImageView]|"]
                                          options:1.0
                                          metrics:nil
                                          views:NSDictionaryOfVariableBindings(_backgroundImageView)]];
        
        [self.contentView addConstraints:[NSLayoutConstraint
                                          constraintsWithVisualFormat:[NSString stringWithFormat:@"H:[_selectedImageView(==29)]-4-|"]
                                          options:1.0
                                          metrics:nil
                                          views:NSDictionaryOfVariableBindings(_selectedImageView)]];
        
        [self.contentView addConstraints:[NSLayoutConstraint
                                          constraintsWithVisualFormat:[NSString stringWithFormat:@"V:[_selectedImageView(==29)]-4-|"]
                                          options:1.0
                                          metrics:nil
                                          views:NSDictionaryOfVariableBindings(_selectedImageView)]];
    }
    return self;
}

- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    _selectedImageView.image = [UIImage imageNamed:selected?@"4.png":@"3.png"];
}

@end
