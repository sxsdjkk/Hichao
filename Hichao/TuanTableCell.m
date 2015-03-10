//
//  TuanTableCell.m
//  Hichao
//
//  Created by mac on 15/3/6.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "TuanTableCell.h"
#import "UIImageView+WebCache.h"

@implementation TuanTableCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor=[UIColor redColor];
        [self addSubview:_imageView];
        
        _titleLabel = [[UILabel alloc] init];
        [self addSubview:_titleLabel];
        
        
        _expiresImage = [[UIImageView alloc] init];
        [self addSubview:_expiresImage];
        _expiresLabel = [[UILabel alloc] init];
        [self addSubview:_expiresLabel];
        
        
        
        _disCountLabel = [[UILabel alloc] init];
        [self addSubview:_disCountLabel];
        
       
        _tianStateImage = [[UIImageView alloc] init];
        [self addSubview:_tianStateImage];
        _tuanStateLabel = [[UILabel alloc] init];
        [self addSubview:_tuanStateLabel];
        
        
        _peopleImage = [[UIImageView alloc] init];
        [self addSubview:_peopleImage];
        _peopleCountLabel = [[UILabel alloc] init];
        [self addSubview:_peopleCountLabel];
        
        
        
        
    }
    
    
    return self;
    
}

-(void)setItems:(StarItems *)items
{
    if(_items)
    {
        [_items release];
    }
    _items=items;
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_items.component.picUrl]];

    
    //picUrl : "http://s5.pimg.cn//group6/M00/80/DB/wKgBjFT2cdOATehJAAJdjrvnpmY71.jpeg?imageMogr2/auto-orient/thumbnail/600x%3E/quality/80"

    
    _imageView.frame = CGRectMake(12, 15, 457,239);
    

    
    _titleLabel.text = _items.component.title;
    _titleLabel.font = [UIFont systemFontOfSize:25];
    _titleLabel.frame = CGRectMake(18, 262, 223, 40);
    
    _expiresImage.image=[UIImage imageNamed:@"icon_bbs_time@2x"];
    _expiresLabel.text = _items.component.expires;
    _expiresImage.frame=CGRectMake(18, 313, 22, 22);
    _expiresLabel.frame = CGRectMake(44, 312, 172, 21);
    
    _peopleImage.image=[UIImage imageNamed:@"icon_zhidemai_list_user@2x"];
    _peopleCountLabel.text = _items.component.peopleCount;
    _peopleImage.frame = CGRectMake(256, 311, 22, 21);
    _peopleCountLabel.frame = CGRectMake(286, 311, 50, 21);
    
    
    _disCountLabel.text = _items.component.discount;
    _disCountLabel.frame = CGRectMake(380, 263, 89, 21);
    
    _tianStateImage.image=[UIImage imageNamed:@"icon_tuangou_jinxing.png"];
    _tuanStateLabel.text = _items.component.action.tuanState;
    _tianStateImage.frame = CGRectMake(35, 8, 98, 37);
    _tuanStateLabel.frame = CGRectMake(44, 16, 77, 21);
    
    if ([_tuanStateLabel.text isEqualToString:@"已结束"]) {
        _tianStateImage.image = [UIImage imageNamed:@"icon_tuangou_jieshu.png"];
    }
    
    
//    NSString * str= _items.component.discount;
    
}
    


- (void)awakeFromNib {
   
//    NSDate *datenow = [NSDate date];
//    NSDateFormatter * dm = [[NSDateFormatter alloc]init];
//    [dm setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
//    NSDate * newdate = [dm dateFromString:comments.createTime];
//    long dd = (long)[datenow timeIntervalSince1970] - [newdate timeIntervalSince1970];
//    NSString *timeString=@"";
//    if (dd/3600<1)
//    {
//        timeString = [NSString stringWithFormat:@"%ld", dd/60];
//        timeString=[NSString stringWithFormat:@"%@分钟前", timeString];
//    }
//    if (dd/3600>1&&dd/86400<1)
//    {
//        timeString = [NSString stringWithFormat:@"%ld", dd/3600];
//        timeString=[NSString stringWithFormat:@"%@小时前", timeString];
//    }
//    if (dd/86400>1)
//    {
//        timeString = [NSString stringWithFormat:@"%ld", dd/86400];
//        timeString=[NSString stringWithFormat:@"%@天前", timeString];
//    }
//    if (dd/86400>6) {
//        NSArray *timeArr = [comments.createTime componentsSeparatedByString:@" "];
//        timeString = [timeArr objectAtIndex:0];
//    }

}

-(void)dealloc{
    [super dealloc];
    
    [_imageView release];
    [_titleLabel release];
    [_expiresLabel release];
    [_disCountLabel release];
    [_peopleCountLabel release];

    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
