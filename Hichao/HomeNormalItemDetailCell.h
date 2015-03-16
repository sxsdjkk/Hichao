//
//  HomeNormalItemDetailCell.h
//  Hichao
//
//  Created by sxsdjkk on 15/3/11.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HomeNormalItemDetailCell : UICollectionViewCell<UICollectionViewDataSource,UICollectionViewDelegate>//详情页
{
    HVCDBaseClass *_baseClass;
    
    HDGLBaseClass *_goodsListBaseClass;
    SkuBaseClass *_skuBaseClass;
    
    NSInteger _indexViewSelectedIndex;
}
@property (nonatomic,retain)UIImageView *userHeader;

@property (nonatomic,retain)UILabel *userNameLabel;

@property (nonatomic,retain)UILabel *descriptionLabel;

@property (nonatomic,retain)UIButton *mainImageView;

@property (nonatomic,retain)UICollectionView *indexCollectionView;

@property (nonatomic,retain)UICollectionView *goodsCollectionView;

- (void)setCellWithItem:(WaterFlowItems *)item;

@end
