//
//  FeaturesCell.h
//  Hichao
//
//  Created by Tz101 on 15/3/10.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeaturesCell : UICollectionViewCell
{
    UIImageView *_imageView;
    UILabel *_tagLabel;
    UILabel *_titleLabel;
    UILabel *_timeLabel;
    UILabel *_collectionLabel;
    UIButton *_collectBtn;
}

@property (nonatomic,retain) TopicsItems *items;

@end
