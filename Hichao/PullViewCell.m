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
        [_itemBtn setImage:[UIImage imageNamed:@"icon_bbs_detail_link"] forState:UIControlStateNormal];
        [self addSubview:_itemBtn];
        
        _dayLabel = [[UILabel alloc] init];
        _dayLabel.font = [UIFont systemFontOfSize:50];
        _dayLabel.textColor = [UIColor grayColor];
        [self addSubview:_dayLabel];
        [_dayLabel release];
        
        _weekDay = [[UILabel alloc] init];
        _weekDay.textColor = [UIColor lightGrayColor];
        [self addSubview:_weekDay];
        [_weekDay release];
        
        _yearMonth = [[UILabel alloc] init];
        _yearMonth.textColor = [UIColor lightGrayColor];
        [self addSubview:_yearMonth];
        [_yearMonth release];
        
        _showTime = [[UILabel alloc] init];
        _showTime.textColor = M_PINK_COLOR;
        _showTime.font = [UIFont systemFontOfSize:24];
        [self addSubview:_showTime];
        [_showTime release];
        
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
        _imageView.layer.masksToBounds = YES;
        _imageView.layer.cornerRadius = 5;
    }
    return self;
}

- (void)dealloc{
    [super dealloc];
    [_imageView release];
    [_titleLabel release];
    [_leftLabel release];
    [_rightLabel release];
//    [_dayLabel release];
//    [_weekDay release];
//    [_yearMonth release];
//    [_showTime release];
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
    float width = [_items.width floatValue];
    float height = [_items.height floatValue];
    
    height = self.bounds.size.width * height / width;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_items.component.picUrl] placeholderImage:[UIImage imageNamed:@"background"]];
    
    if (items.component.weekDay == nil && _items.component.collectionCount != nil && _items.component.itemsCount != nil) {
        
        _titleLabel.text = _items.component.componentDescription;
        _leftLabel.text = _items.component.collectionCount;
        _rightLabel.text = _items.component.itemsCount;
        
        
        _imageView.frame = CGRectMake(0, 0, self.bounds.size.width, height);
        _titleLabel.frame = CGRectMake(8, height+8, self.bounds.size.width-8, 40.0f);
        
        _leftLabel.frame = CGRectMake(60, height+20+_titleLabel.frame.size.height, 60, 30);
        _collectBtn.frame = CGRectMake(25, height+20+_titleLabel.frame.size.height, 30, 30);
        _rightLabel.frame = CGRectMake(170, height+20+_titleLabel.frame.size.height, 60, 30);
        _itemBtn.frame = CGRectMake(135, height+20+_titleLabel.frame.size.height-5, 40, 40);
        
        _horizonalLine.frame = CGRectMake(8, height+_titleLabel.frame.size.height+10, self.bounds.size.width-8, 3);
        
        [_itemBtn setImage:[UIImage imageNamed:@"icon_bbs_detail_link"] forState:UIControlStateNormal];
    }else if (_items.component.collectionCount != nil){
        //精品-推荐
        
        _titleLabel.text = _items.component.componentDescription;
        _leftLabel.text = _items.component.collectionCount;
        _rightLabel.text = _items.component.price;
        
        
        _imageView.frame = CGRectMake(0, 0, self.bounds.size.width, height);
        _titleLabel.frame = CGRectMake(8, height+8, self.bounds.size.width-8, 40.0f);
        
        _leftLabel.frame = CGRectMake(60, height+20+_titleLabel.frame.size.height, 60, 30);
        _collectBtn.frame = CGRectMake(25, height+20+_titleLabel.frame.size.height, 30, 30);
        
        _rightLabel.frame = CGRectMake(170, height+20+_titleLabel.frame.size.height, 60, 30);
        _itemBtn.frame = CGRectMake(135, height+20+_titleLabel.frame.size.height-5, 40, 40);
        
        _horizonalLine.frame = CGRectMake(8, height+_titleLabel.frame.size.height+10, self.bounds.size.width-8, 3);
        
        [_itemBtn setImage:[UIImage imageNamed:@"icon_price_clothes"] forState:UIControlStateNormal];
    }
    else if (_items.component.discount != nil){
        //精品-值得买
        _titleLabel.text = _items.component.componentDescription;
        _leftLabel.text = _items.component.discount;
        _rightLabel.text = _items.component.price;
        
        _imageView.frame = CGRectMake(0, 0, self.bounds.size.width, height);
         _titleLabel.frame = CGRectMake(8, _imageView.frame.size.height+8, self.bounds.size.width-8, 40.0f);
        
        _leftLabel.frame = CGRectMake(60, height+20+_titleLabel.frame.size.height, 60, 30);
        _collectBtn.frame = CGRectMake(25, height+20+_titleLabel.frame.size.height, 30, 30);
        
        _rightLabel.frame = CGRectMake(170, height+20+_titleLabel.frame.size.height, 60, 30);
        _itemBtn.frame = CGRectMake(135, height+20+_titleLabel.frame.size.height-5, 40, 40);
        
        _horizonalLine.frame = CGRectMake(8, height+_titleLabel.frame.size.height+10, self.bounds.size.width-8, 3);
        
        [_itemBtn setImage:[UIImage imageNamed:@"icon_price_clothes"] forState:UIControlStateNormal];
        
    }else{
        UIImageView *blackLine = [[UIImageView alloc] init];
        blackLine.frame = CGRectMake(0, 0, self.bounds.size.width, 3);
        blackLine.backgroundColor = [UIColor grayColor];
        [self addSubview:blackLine];
        [blackLine release];
        
        _horizonalLine.frame = CGRectMake(8, 69, self.bounds.size.width-8, 3);
        _imageView.frame = CGRectMake(0, 80, self.bounds.size.width, height);
        
        _dayLabel.text = _items.component.day;
        _dayLabel.frame = CGRectMake(5, 11, 80, 50);
        
        _weekDay.text = _items.component.weekDay;
        _weekDay.frame = CGRectMake(60, 11, 80, 25);
        
        _yearMonth.text = [NSString stringWithFormat:@"%@.%@",_items.component.year,_items.component.monthOnly];
        _yearMonth.frame = CGRectMake(60, 36, 80, 25);
        
        _showTime.text = _items.component.showTime;
        _showTime.frame = CGRectMake(135, 36, 60, 30);
    
        UILabel *pubLabel = [[UILabel alloc] init];
        pubLabel.text = @"发布";
        pubLabel.textColor = [UIColor lightGrayColor];
        pubLabel.frame = CGRectMake(195, 40, 35, 25);
        [self addSubview:pubLabel];
        [pubLabel release];
        
        [self bringSubviewToFront:_imageView];
        
        [_itemBtn setImage:[UIImage imageNamed:@"icon_bbs_detail_link"] forState:UIControlStateNormal];
    }
    
}

@end
