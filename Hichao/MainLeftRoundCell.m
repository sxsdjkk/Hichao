//
//  MainLeftRoundCell.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/8.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "MainLeftRoundCell.h"

@implementation MainLeftRoundCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        _backgroundImage = [[UIImageView alloc]initWithFrame:self.bounds];
        
        [self addSubview:_backgroundImage];
        
        self.backgroundImage.image = [UIImage imageNamed:@"home_left_btn_type@2x.png"];
        
        [_backgroundImage release];
        
        _textLabel = [[UILabel alloc] initWithFrame:self.bounds];
        
        [self addSubview:_textLabel];

        [_textLabel release];

        NSLog(@"_textLabel--retainCount---%d",_textLabel.retainCount);

        
        
//        _textLabel.layer.cornerRadius = _textLabel.frame.size.width/2.0;
//        
//        _textLabel.layer.masksToBounds = YES;
//        
//        _textLabel.layer.borderWidth = 0.5;
        
        _textLabel.backgroundColor = [UIColor clearColor];
        
        _textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)setSelected:(BOOL)selected
{
    if (selected)
    {
        self.backgroundImage.image = [UIImage imageNamed:@"home_left_btn_type_on@2x.png"];
        self.textLabel.textColor = [UIColor whiteColor];
    }
    else
    {
        self.backgroundImage.image = [UIImage imageNamed:@"home_left_btn_type@2x.png"];
        self.textLabel.textColor = [UIColor blackColor];
    }
}

- (void)dealloc
{
    [super dealloc];
    [_textLabel release];
    [_backgroundImage release];
}

@end
