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
        
        UIImageView *styleTag = [[UIImageView alloc] initWithFrame:CGRectMake(0, 210, 73, 25)];
        [styleTag setImage:[UIImage imageNamed:@"bg_topic_style_list_tag"]];
        [self addSubview:styleTag];
        [styleTag release];
        
        _tagLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 210, 60, 25)];
        _tagLabel.textColor = [UIColor whiteColor];
        [self addSubview:_tagLabel];
        [_tagLabel release];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 210, 270, 25)];
        _titleLabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:_titleLabel];
        [_titleLabel release];
        
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(350, 210, 90, 25)];
        _timeLabel.font = [UIFont systemFontOfSize:14];
        _timeLabel.textColor = [UIColor grayColor];
        [self addSubview:_timeLabel];
        [_timeLabel release];
        
        UIImageView *leftLine = [[UIImageView alloc] initWithFrame:CGRectMake(100, 260, 100, 3)];
        [leftLine setImage:[UIImage imageNamed:@"line_dot_detail_mingxing"]];
        [self addSubview:leftLine];
        [leftLine release];
        
        UIImageView *lineView = [[UIImageView alloc] initWithFrame:CGRectMake(280, 260, 100, 3)];
        [lineView setImage:[UIImage imageNamed:@"line_dot_detail_mingxing"]];
        [self addSubview:lineView];
        [lineView release];
        
        _collectBtn = [[UIButton alloc] initWithFrame:CGRectMake(210, 244, 32, 32)];
        [_collectBtn addTarget:self action:@selector(collectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_collectBtn];
        [_collectBtn release];
        
        _collectionLabel = [[UILabel alloc] initWithFrame:CGRectMake(242, 245, 60, 30)];
        [self addSubview:_collectionLabel];
        [_collectionLabel release];
    }
    return self;
}

- (void)collectBtnClick:(UIButton *)sender{
    People *p = [[DatabaseTool selectId:_items.component.action.actionIdentifier] retain];
    if (p.actionIdentifier == _items.component.action.actionIdentifier.intValue) {
        //Delete
        [DatabaseTool deleteId:_items.component.action.actionIdentifier];
        [UIView animateWithDuration:0.5 animations:^{
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:_collectBtn cache:YES];
            [_collectBtn setImage:[UIImage imageNamed:@"nav_btn_collect"] forState:UIControlStateNormal];
        }];
    }else{
        //Insert
        [DatabaseTool insertItemWithId:_items.component.action.actionIdentifier.intValue and:_items.component.action.actionType and:_items.component.picUrl];
        [UIView animateWithDuration:0.5 animations:^{
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:_collectBtn cache:YES];
            [_collectBtn setImage:[UIImage imageNamed:@"nav_btn_collect_on"] forState:UIControlStateNormal];
        }];
    }
    [p release];
}

- (void)dealloc{
    [super dealloc];
    [_imageView release];
    [_tagLabel release];
    [_tagLabel release];
    [_timeLabel release];
    [_collectionLabel release];
}

- (void)setItems:(TopicsItems *)items{
    _items = items;
    
    _tagLabel.text = _items.component.category;
    _titleLabel.text = _items.component.title;
    _timeLabel.text = [NSString stringWithFormat:@"%@.%@.%@",items.component.year,items.component.month,items.component.day];
    _collectionLabel.text = _items.component.collectionCount;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_items.component.picUrl]];
    
    People *p = [DatabaseTool selectId:_items.component.action.actionIdentifier];
    if (p.actionIdentifier == _items.component.action.actionIdentifier.intValue) {
        [_collectBtn setImage:[UIImage imageNamed:@"nav_btn_collect_on"] forState:UIControlStateNormal];
    }else{
        [_collectBtn setImage:[UIImage imageNamed:@"nav_btn_collect"] forState:UIControlStateNormal];
    }
    [p release];
}

@end
