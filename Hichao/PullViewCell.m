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
        _titleLabel.textColor = [UIColor grayColor];
        _titleLabel.numberOfLines = 2;
        _titleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_titleLabel];
        
        _horizonalLine = [[UIImageView alloc] init];
        [_horizonalLine setImage:[UIImage imageNamed:@"line_dot_detail_clothes"]];
        [self addSubview:_horizonalLine];
        
        _leftLabel = [[UILabel alloc] init];
        _leftLabel.backgroundColor = [UIColor whiteColor];
        [self addSubview:_leftLabel];
        
        _rightLabel = [[UILabel alloc] init];
        _rightLabel.backgroundColor = [UIColor whiteColor];
        [self addSubview:_rightLabel];
        
        _collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_collectBtn setImage:[UIImage imageNamed:@"nav_btn_collect"] forState:UIControlStateNormal];
        [self addSubview:_collectBtn];
        
        _itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_itemBtn setImage:[UIImage imageNamed:@"icon_bbs_detail_link.png"] forState:UIControlStateNormal];
        [self addSubview:_itemBtn];
    }
    return self;
}

- (void)dealloc{
    [super dealloc];
    [_imageView release];
    [_titleLabel release];
    [_leftLabel release];
    [_rightLabel release];
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
    
    if (items.component.weekDay == nil) {
        [_imageView sd_setImageWithURL:[NSURL URLWithString:_items.component.picUrl]];
        
        _titleLabel.text = _items.component.componentDescription;
        _leftLabel.text = _items.component.collectionCount;
        _rightLabel.text = _items.component.itemsCount;
        
        float width = [_items.width floatValue];
        float height = [_items.height floatValue];
        
        height = self.bounds.size.width * height / width;
        
        _imageView.frame = CGRectMake(0, 0, self.bounds.size.width, height);
        _titleLabel.frame = CGRectMake(8, height+8, self.bounds.size.width-8, 40.0f);
        
        _leftLabel.frame = CGRectMake(60, height+20+_titleLabel.frame.size.height, 60, 30);
        _collectBtn.frame = CGRectMake(25, height+20+_titleLabel.frame.size.height, 30, 30);
        _rightLabel.frame = CGRectMake(170, height+20+_titleLabel.frame.size.height, 60, 30);
        _itemBtn.frame = CGRectMake(135, height+20+_titleLabel.frame.size.height-5, 40, 40);
        
        _horizonalLine.frame = CGRectMake(8, height+_titleLabel.frame.size.height+10, self.bounds.size.width-8, 3);
        
    }
    
}

@end
