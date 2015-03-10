//
//  TuanTableCell.h
//  Hichao
//
//  Created by mac on 15/3/6.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface TuanTableCell : UITableViewCell
{
    
    //1024 *768
    UIImageView *       _imageView;
    UILabel *           _titleLabel;
    
    UIImageView *       _expiresImage;
    UILabel *           _expiresLabel;
    
    UILabel *           _disCountLabel;
    
    UIImageView *       _peopleImage;
    UILabel *           _peopleCountLabel;
    
    
    UILabel *           _tuanStateLabel;
    UIImageView *       _tianStateImage;
    
    
    
}


@property(nonatomic,strong)StarItems * items;
@end
