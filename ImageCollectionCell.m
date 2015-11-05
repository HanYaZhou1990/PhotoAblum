//
//  ImageCollectionCell.m
//  HNRuMi
//
//  Created by 韩亚周 on 15/11/3.
//  Copyright (c) 2015年 HYZ. All rights reserved.
//

#import "ImageCollectionCell.h"

@implementation ImageCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _backgroundImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _backgroundImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_backgroundImageView];
        
        _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _deleteButton.translatesAutoresizingMaskIntoConstraints = NO;
        _deleteButton.backgroundColor = [UIColor lightGrayColor];
        _deleteButton.layer.cornerRadius = 11.0f;
        _deleteButton.clipsToBounds = YES;
        [_deleteButton addTarget:self action:@selector(deleteButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_deleteButton];
        
        [self.contentView addConstraint:[NSLayoutConstraint
                                         constraintWithItem:_backgroundImageView
                                         attribute:NSLayoutAttributeTop
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:self.contentView
                                         attribute:NSLayoutAttributeTop
                                         multiplier:1.0
                                         constant:0]];
        [self.contentView addConstraint:[NSLayoutConstraint
                                         constraintWithItem:_backgroundImageView
                                         attribute:NSLayoutAttributeLeft
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:self.contentView
                                         attribute:NSLayoutAttributeLeft
                                         multiplier:1.0
                                         constant:0]];
        [self.contentView addConstraint:[NSLayoutConstraint
                                         constraintWithItem:_backgroundImageView
                                         attribute:NSLayoutAttributeBottom
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:self.contentView
                                         attribute:NSLayoutAttributeBottom
                                         multiplier:1.0
                                         constant:0]];
        [self.contentView addConstraint:[NSLayoutConstraint
                                         constraintWithItem:_backgroundImageView
                                         attribute:NSLayoutAttributeRight
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:self.contentView
                                         attribute:NSLayoutAttributeRight
                                         multiplier:1.0
                                         constant:0]];
        [self.contentView addConstraints:[NSLayoutConstraint
                                          constraintsWithVisualFormat:@"H:[_deleteButton(==22)]-8-|"
                                          options:1.0
                                          metrics:nil
                                          views:NSDictionaryOfVariableBindings(_deleteButton)]];
        [self.contentView addConstraints:[NSLayoutConstraint
                                          constraintsWithVisualFormat:@"V:|-8-[_deleteButton(==22)]"
                                          options:1.0
                                          metrics:nil
                                          views:NSDictionaryOfVariableBindings(_deleteButton)]];
    }
    return self;
}

- (void)deleteButtonClick:(UIButton *)sender{
    _deleteButtonHandle(self,sender);
}

- (void)setHiddenDeleteButton:(BOOL)hiddenDeleteButton{
    self.hiddenDeleteButton = hiddenDeleteButton;
    self.deleteButton.hidden = hiddenDeleteButton;
}

@end
