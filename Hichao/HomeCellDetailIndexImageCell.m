//
//  HomeCellDetailIndexImageCell.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/12.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "HomeCellDetailIndexImageCell.h"

@implementation HomeCellDetailIndexImageCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        _indexImageView = [[UIImageView alloc]initWithFrame:self.bounds];
        [self addSubview:_indexImageView];
        [_indexImageView release];
    }
    return self;
}

@end
