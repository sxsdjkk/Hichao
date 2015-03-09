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
        self.titleImageView = [[UIImageView alloc]init];
        
        self.titleImageView.bounds = CGRectMake(0, 0, self.frame.size.height-10, self.frame.size.height-10);
        
        self.titleImageView.center = CGPointMake(self.frame.size.height-10, self.frame.size.height/2.0);
        
        self.titleImageView.layer.cornerRadius = self.titleImageView.frame.size.width/2.0;
        
        self.titleImageView.layer.masksToBounds = YES;
        
        [self addSubview:_titleImageView];
        [_titleImageView release];
        
        self.textLabel = [[UILabel alloc] init];
        
        self.textLabel.frame = CGRectMake(self.frame.size.height*1.5, 0, self.frame.size.width - self.frame.size.height*2.5, self.frame.size.height);
        
        self.textLabel.font = [UIFont systemFontOfSize:12];
        
        [self addSubview:_textLabel];
        
        [_textLabel release];
        
        UIImageView *accessoryView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width-self.frame.size.height*0.8, self.frame.size.height*0.3, self.frame.size.height*0.8, self.frame.size.height*0.8)];
        
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
        self.backgroundColor = [UIColor colorWithRed:239/255.0 green:240/255.0 blue:233/255.0 alpha:1.0];
        self.textLabel.textColor = [UIColor whiteColor];
    }
    else
    {
        self.backgroundColor = [UIColor colorWithRed:239/255.0 green:240/255.0 blue:233/255.0 alpha:1.0];
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
