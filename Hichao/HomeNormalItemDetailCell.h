//
//  HomeNormalItemDetailCell.h
//  Hichao
//
//  Created by sxsdjkk on 15/3/11.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HomeNormalItemDetailCell : UICollectionViewCell //详情页

@property (nonatomic,retain)UIImageView *userHeader;

@property (nonatomic,retain)UILabel *userNameLabel;

@property (nonatomic,retain)UILabel *descriptionLabel;

@property (nonatomic,retain)UIImageView *mainImageView;

@property (nonatomic,retain)UICollectionView *indexCollectionView;

@property (nonatomic,retain)UICollectionView *goodsCollectionView;

- (void)setCellWithItem:(WaterFlowItems *)item;

@end
