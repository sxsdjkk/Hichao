//
//  FeaturesCell.m
//  Hichao
//
//  Created by Tz101 on 15/3/10.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "FeaturesCell.h"
#import <UIImageView+WebCache.h>

@implementation FeaturesCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = M_GRAY_COLOR;
        
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = CGRectMake(10, 10, 440, 190);
        
        [self addSubview:_imageView];
        [_imageView release];
    }
    return self;
}
- (void)dealloc{
    [super dealloc];
    [_imageView release];
}

- (void)setItems:(TopicsItems *)items{
    _items = items;
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_items.component.picUrl]];
}

@end
