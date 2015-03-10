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
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
        
        [self addSubview:_imageView];
        
        [_imageView release];
        
        _textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.width, self.frame.size.width, self.frame.size.height-self.frame.size.width)];
        
        _textLabel.font = [UIFont systemFontOfSize:12];
        
        _textLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_textLabel];
        
        [_textLabel release];
        
    }
    return self;
}


- (void)dealloc
{
    [super dealloc];
    
    [_imageView release];
}


@end
