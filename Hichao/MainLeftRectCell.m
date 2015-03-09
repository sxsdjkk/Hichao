//
//  MainLeftRectCell.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/9.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "MainLeftRectCell.h"

@implementation MainLeftRectCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = M_LIGHT_GRAY_COLOR;
        
        _titleImageView = [[UIImageView alloc]init];
        
        _titleImageView.bounds = CGRectMake(0, 0, self.frame.size.height-10, self.frame.size.height-10);
        
        _titleImageView.center = CGPointMake(self.frame.size.height-10, self.frame.size.height/2.0);
        
        _titleImageView.layer.cornerRadius = _titleImageView.frame.size.width/2.0;
        
        _titleImageView.layer.masksToBounds = YES;
        
        [self addSubview:_titleImageView];
        [_titleImageView release];
        
        _textLabel = [[UILabel alloc] init];
        
        _textLabel.frame = CGRectMake(self.frame.size.height*1.5, 0, self.frame.size.width - self.frame.size.height*2.5, self.frame.size.height);
        
        _textLabel.font = [UIFont systemFontOfSize:12];
        
        [self addSubview:_textLabel];
        
        [_textLabel release];
        
        UIImageView *accessoryView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width-self.frame.size.height*0.8, self.frame.size.height*0.3, self.frame.size.height*0.4, self.frame.size.height*0.4)];
        
        accessoryView.image = [UIImage imageNamed:@"icon_arrow_leftstyle_right@2x.png"];
        
        [self addSubview:accessoryView];
        
        [accessoryView release];
    }
    return self;
}

- (void)setSelected:(BOOL)selected
{
    if (selected)
    {
        self.backgroundColor = M_PINK_COLOR;
        self.textLabel.textColor = [UIColor whiteColor];
    }
    else
    {
        self.backgroundColor = M_LIGHT_GRAY_COLOR;
        self.textLabel.textColor = [UIColor blackColor];
    }
}




- (void)dealloc
{
    [super dealloc];
    [_textLabel release];
    [_titleImageView release];
}


@end
