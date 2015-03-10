//
//  SelectedLeftCell.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/10.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "SelectedLeftCell.h"

@implementation SelectedLeftCell


- (id)initWithFrame:(CGRect)frame
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
