//
//  HomeCellDetailGoodsListCell.h
//  Hichao
//
//  Created by sxsdjkk on 15/3/12.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCellDetailGoodsListCell : UICollectionViewCell

@property (nonatomic,retain)UIImageView *imageView;
@property (nonatomic,retain)UILabel *descriptionLabel;
@property (nonatomic,retain)UILabel *priceLabel;
@property (nonatomic,retain)UIButton *collectButton;


- (void)setCellWithList:(HDGLItemList *)list;

@end
