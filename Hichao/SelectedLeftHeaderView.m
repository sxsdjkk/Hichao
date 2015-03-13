//
//  SelectedLeftHeaderView.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/10.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "SelectedLeftHeaderView.h"

@implementation SelectedLeftHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        _backgroundBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _backgroundBtn.frame = self.bounds;
        
        [self addSubview:_backgroundBtn];
        
        _titleImageView = [[UIImageView alloc]init];
        
        _titleImageView.bounds = CGRectMake(0, 0, self.frame.size.height-8, self.frame.size.height-8);
        
        _titleImageView.center = CGPointMake(self.frame.size.height-18, self.frame.size.height/2.0);
        
        _titleImageView.layer.cornerRadius = _titleImageView.frame.size.width/2.0;
        
        _titleImageView.layer.masksToBounds = YES;
        
        [self addSubview:_titleImageView];
        
        [_titleImageView release];
        
        _textLabel = [[UILabel alloc] init];
        
        _textLabel.frame = CGRectMake(self.frame.size.height*1.5, 0, self.frame.size.width - self.frame.size.height*2.5, self.frame.size.height);
        
        _textLabel.font = [UIFont systemFontOfSize:16];
        
        [self addSubview:_textLabel];
        
        [_textLabel release];
        
        _accessoryView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width-self.frame.size.height*0.8, self.frame.size.height*0.35, self.frame.size.height*0.3, self.frame.size.height*0.3)];
        
        _accessoryView.image = [UIImage imageNamed:@"icon_arrow_leftstyle_down@2x.png"];
        
        [self addSubview:_accessoryView];
        
        [_accessoryView release];
        
        UIView *topSepratorLine = [[UIView alloc]init];
        
        topSepratorLine.frame = CGRectMake(0, 0, self.frame.size.width, 1);
        
        topSepratorLine.backgroundColor = [UIColor lightGrayColor];
        
        [self addSubview:topSepratorLine];
        
        [topSepratorLine release];
        
        UIView *sepratorLine = [[UIView alloc]init];
        
        sepratorLine.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, 1);
        
        sepratorLine.backgroundColor = [UIColor lightGrayColor];
        
        [self addSubview:sepratorLine];
        
        [sepratorLine release];
        


    }
    return self;
}

- (void)setOpened:(BOOL)isOpen
{
    if (isOpen)
    {
        _textLabel.textColor = M_PINK_COLOR;
        
        _accessoryView.image = [UIImage imageNamed:@"icon_arrow_leftstyle_up@2x.png"];
    }
    else
    {
        _textLabel.textColor = [UIColor blackColor];
        
        _accessoryView.image = [UIImage imageNamed:@"icon_arrow_leftstyle_down@2x.png"];
    }
}

- (void)dealloc
{
    [super dealloc];
    [_backgroundBtn release];
    [_titleImageView release];
    [_textLabel release];
    [_accessoryView release];
}

@end
