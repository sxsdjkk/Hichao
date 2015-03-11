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
        self.layer.borderColor = [[UIColor colorWithWhite:0.5 alpha:1.0] CGColor];
        self.layer.borderWidth = 2;
        _indexImageView = [[UIImageView alloc]initWithFrame:self.bounds];
        [self addSubview:_indexImageView];
        [_indexImageView release];
    }
    return self;
}

- (void)setSelected:(BOOL)selected
{
    if (selected)
    {
        self.layer.borderColor = [M_PINK_COLOR CGColor];
    }
    else
    {
        self.layer.borderColor = [[UIColor colorWithWhite:0.5 alpha:1.0] CGColor];
    }
}

@end
