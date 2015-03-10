//
//  pragueTableViewCell.h
//  Hichao
//
//  Created by mac on 15/3/9.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface pragueTableViewCell : UITableViewCell
{
    UIImageView *       _leftImage;
    UIImageView *       _centreImage;
    UIImageView *       _rightImage;
    

    UIImageView *       _titleImage;
    UILabel *           _titleLabel;
    
    UIImageView *       _userImage;
    UIImageView *       _dateImage;
    UILabel *           _dateLable;
    UIButton *          _userBut;
    
    
    UIImageView *       _vImage;
    UILabel *           _vLabel;
    
    
    UILabel *           _CommentCountLabel;
    UIImageView *       _CommentCountImage;
    
    
    
    
}
@property (nonatomic,strong) PgItems *items;


@end
