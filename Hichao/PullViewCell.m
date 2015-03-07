//
//  PullViewCell.m
//  Hichao
//
//  Created by Tz101 on 15/3/7.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "PullViewCell.h"
#import <UIImageView+WebCache.h>

@implementation PullViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor whiteColor];
        _titleLabel.textColor = [UIColor blackColor];
        [self addSubview:_titleLabel];
    }
    return self;
}

- (void)dealloc{
    [super dealloc];
    [_imageView release];
    [_titleLabel release];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setItems:(WaterFlowItems *)items{
    _items = items;
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_items.component.picUrl]];
    
    _titleLabel.text = _items.component.componentDescription;
    
    float width = [_items.width floatValue];
    float height = [_items.height floatValue];
    
    height = self.bounds.size.width * height / width;
    
    _imageView.frame = CGRectMake(0, 0, self.bounds.size.width, height);
    _titleLabel.frame = CGRectMake(0, height, self.bounds.size.width, 44.0f);
    
}

@end
