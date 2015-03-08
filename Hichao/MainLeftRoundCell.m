//
//  MainLeftRoundCell.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/8.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "MainLeftRoundCell.h"

@implementation MainLeftRoundCell

- (id)init
{
    self = [super init];
    
    if (self)
    {
        _textLabel = [[UILabel alloc] initWithFrame:self.bounds];
        
        [self addSubview:_textLabel];
    }
    return self;
}

@end
