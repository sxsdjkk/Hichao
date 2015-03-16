//
//  FavoriteCollectionViewCell.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/16.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "FavoriteCollectionViewCell.h"

@implementation FavoriteCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        _imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        
        [self addSubview:_imageView];
        
        [_imageView release];
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
    [_imageView release];
}

@end
