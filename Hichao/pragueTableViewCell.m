//
//  pragueTableViewCell.m
//  Hichao
//
//  Created by mac on 15/3/9.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "pragueTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation pragueTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleImage = [[UIImageView alloc] init];
        [self addSubview:_titleImage];
        
        _titleLabel = [[UILabel alloc] init];
        [self addSubview:_titleLabel];
 
        _leftImage = [[UIImageView alloc] init];
        [self addSubview:_leftImage];
        _centreImage = [[UIImageView alloc] init];
        [self addSubview:_centreImage];
        _rightImage = [[UIImageView alloc] init];
        [self addSubview:_rightImage];

        
        _userImage = [[UIImageView alloc] init];
        [self addSubview:_userImage];
        _dateImage = [[UIImageView alloc] init];
        [self addSubview:_dateImage];
        _dateLable = [[UILabel alloc] init];
        [self addSubview:_leftImage];
        _userBut = [UIButton buttonWithType:UIButtonTypeSystem];
        [self addSubview:_userBut];
        
        
        
        _vImage = [[UIImageView alloc] init];
        [self addSubview:_vImage];
        _vLabel = [[UILabel alloc] init];
        [self addSubview:_vLabel];
        
        
        _CommentCountImage = [[UIImageView alloc] init];
        [self addSubview:_CommentCountImage];
        _CommentCountLabel = [[UILabel alloc] init];
        [self addSubview:_CommentCountLabel];
    
    }
    return self;
}





- (void)awakeFromNib {
   
    
}

-(void)setItems:(PgItems *)items{
    
    _items = items;
    
    _titleImage.frame = CGRectMake(23, 11, 25, 25);
    _titleLabel.text = _items.component.title;
    _titleLabel.frame = CGRectMake(86, 14, 361, 25);
   
    

    _leftImage.frame = CGRectMake(23, 48, 120, 120);
    _centreImage.frame = CGRectMake(175, 48, 120, 120);
    _rightImage.frame = CGRectMake(327, 48, 120, 120);
    
    [_userImage sd_setImageWithURL:[NSURL URLWithString:_items.component.userAvatar]];
    _userImage.frame = CGRectMake(30, 192, 40, 40);
    [_userBut setTitle:_items.component.userName forState:UIControlStateNormal];
    _userBut.frame = CGRectMake(86, 192, 69, 22);
    _dateImage.image=[UIImage imageNamed:@"icon_bbs_time@2x"];
    _dateImage.frame = CGRectMake(82, 214, 15, 15);
    _dateLable.text = _items.component.publishDate;
    _dateLable.frame = CGRectMake(97, 214, 82, 15);

    
    _vImage.frame = CGRectMake(318, 210, 19, 20);
    _vLabel.text = _items.component.v;
    _vLabel.frame = CGRectMake(345, 210, 42, 21);

    _CommentCountImage.frame = CGRectMake(195, 210, 19, 20);
    _CommentCountLabel.text = _items.component.commentCount;
    _CommentCountLabel.frame = CGRectMake(420, 210, 27, 21);

    
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end