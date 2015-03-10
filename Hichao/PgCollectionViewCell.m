//
//  PgCollectionViewCell.m
//  Hichao
//
//  Created by mac on 15/3/10.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "PgCollectionViewCell.h"

@implementation PgCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = M_LIGHT_GRAY_COLOR;
        
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
        
        UIImageView *accessoryView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width-self.frame.size.height*0.8, self.frame.size.height*0.35, self.frame.size.height*0.3, self.frame.size.height*0.3)];
        
        accessoryView.image = [UIImage imageNamed:@"icon_arrow_leftstyle_right@2x.png"];
        
        [self addSubview:accessoryView];
        
        [accessoryView release];
        
        UIView *sepratorLine = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1)];
        
        sepratorLine.backgroundColor = [UIColor lightGrayColor];
        
        [self addSubview:sepratorLine];
        
        [sepratorLine release];
    }
    return self;
}

- (void)setSelected:(BOOL)selected
{
    if (selected)
    {
        //        self.backgroundColor = M_PINK_COLOR;
        self.textLabel.textColor = M_PINK_COLOR;
    }
    else
    {
        self.backgroundColor = M_LIGHT_GRAY_COLOR;
        self.textLabel.textColor = [UIColor blackColor];
    }
}

@end
