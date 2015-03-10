//
//  CollectionViewCell.h
//  Hichao
//
//  Created by mac on 15/3/8.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell

@property(nonatomic ,strong)UIImageView * imageView;

//icon_tuan_tujian_clothes@2x.png
//icon_tuan_remai_clothes@2x.png
@property(nonatomic ,strong)UIImageView *upImageView;



@property(nonatomic ,strong)UILabel * titleLabel;

@property(nonatomic ,strong)UILabel * priceLabel;
@property(nonatomic ,strong)UILabel * origLabel;

//bg_tuangou_zhekou_detail@2x.png
@property(nonatomic ,strong)UIImageView * disCountImage;
@property(nonatomic ,strong)UILabel * disCountLabel;

@property(nonatomic ,strong)UIImageView * peopleImage;
@property(nonatomic ,strong)UILabel * peopleLabel;

//button_tuangou_buy_detail.png
@property(nonatomic ,strong)UIButton * tuanButton;

@end
