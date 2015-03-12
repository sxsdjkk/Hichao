//
//  HomeCellDetailGoodsListCell.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/12.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "HomeCellDetailGoodsListCell.h"
#import <UIImageView+WebCache.h>


@implementation HomeCellDetailGoodsListCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
        [self addSubview:_imageView];
        [_imageView release];
        
        _descriptionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.width+10, self.frame.size.width, 40)];
        _descriptionLabel.font = [UIFont systemFontOfSize:14];
        _descriptionLabel.numberOfLines = 0;
        [self addSubview:_descriptionLabel];
        [_descriptionLabel release];
        
        _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.width+50, self.frame.size.width/2, 30)];
        _priceLabel.font = [UIFont systemFontOfSize:16];
        _priceLabel.textColor = M_PINK_COLOR;
        _priceLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_priceLabel];
        [_priceLabel release];
        
        _collectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _collectButton.frame = CGRectMake(self.frame.size.width/2-20, self.frame.size.width+50, self.frame.size.width/2, 35);
        [_collectButton setImage:[UIImage imageNamed:@"nav_btn_collect@2x.png"] forState:UIControlStateNormal];
        [_collectButton setTitleColor:[UIColor colorWithWhite:0.4 alpha:1.0] forState:UIControlStateNormal];
        [self addSubview:_collectButton];
        
    }
    return self;
}

- (void)setCellWithList:(HDGLItemList *)list
{
    [_imageView sd_setImageWithURL:[NSURL URLWithString:list.component.picUrl]];
    
    _descriptionLabel.text = list.component.action.actionDescription;
    
    _priceLabel.text = [NSString stringWithFormat:@"￥%@",list.component.price];

    [_collectButton setTitle:list.component.collectionCount forState:UIControlStateNormal];
}

@end
