//
//  PullViewCell.h
//  Hichao
//
//  Created by Tz101 on 15/3/7.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PullViewCell : UITableViewCell
{
    UIImageView *_imageView;
    UILabel *_titleLabel;
}
@property (nonatomic,retain) WaterFlowItems *items;
@end
