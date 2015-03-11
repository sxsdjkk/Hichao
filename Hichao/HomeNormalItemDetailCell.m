//
//  HomeNormalItemDetailCell.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/11.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "HomeNormalItemDetailCell.h"
#import <UIImageView+WebCache.h>

@implementation HomeNormalItemDetailCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = M_LIGHT_GRAY_COLOR;
        _userHeader = [[UIImageView alloc]initWithFrame:CGRectMake(30, 20, 60, 60)];
        _userHeader.layer.cornerRadius = 30.0;
        _userHeader.layer.masksToBounds = YES;
        [self addSubview:_userHeader];
        [_userHeader release];
//        _userHeader.backgroundColor = M_GRAY_COLOR;
        
        _userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 20, 200, 30)];
//        _userNameLabel.textColor = M_PINK_COLOR;
        _userNameLabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:_userNameLabel];
        [_userNameLabel release];
//        _userNameLabel.backgroundColor = M_GRAY_COLOR;
        
        _descriptionLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 50, 380, 32)];
        _descriptionLabel.font = [UIFont systemFontOfSize:14];
        _descriptionLabel.numberOfLines = 0;
        [self addSubview:_descriptionLabel];
        [_descriptionLabel release];
//        _descriptionLabel.backgroundColor = M_GRAY_COLOR;
        
        _mainImageView = [[UIImageView alloc]initWithFrame:CGRectMake(80, 100, 350, 550)];
        [self addSubview:_mainImageView];
        [_mainImageView release];
        _mainImageView.backgroundColor = M_GRAY_COLOR;
        
        UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc]init];
        layOut.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layOut.minimumLineSpacing = 0.0;
        layOut.minimumInteritemSpacing = 10.0;
        layOut.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layOut.itemSize = CGSizeMake(60, 60);
        

        _indexCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(500, 20, 400, 80) collectionViewLayout:layOut];
//        [_indexCollectionView registerClass:[UIImageView class] forCellWithReuseIdentifier:@"indexcell"];
        [self addSubview:_indexCollectionView];
        [_indexCollectionView release];
        [layOut release];
        _indexCollectionView.backgroundColor = M_GRAY_COLOR;
        
        UICollectionViewFlowLayout *layOut1 = [[UICollectionViewFlowLayout alloc]init];
        layOut.minimumLineSpacing = 10.0;
        layOut.minimumInteritemSpacing = 10.0;
        layOut.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layOut.itemSize = CGSizeMake(200, 200);
        
        _goodsCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(500, 120, 400, M_SCREEN_HEIGHT-120) collectionViewLayout:layOut1];
        [self addSubview:_goodsCollectionView];
        [_goodsCollectionView release];
        [layOut release];
        _goodsCollectionView.backgroundColor = M_GRAY_COLOR;
    }
    return self;
}

- (void)setCellWithItem:(WaterFlowItems *)item
{
    NSString *urlStr = [NSString stringWithFormat:@"http://api2.hichao.com/star?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=5jOo4szM5D_IOP4mRBQO9SPupA9rapUqooMjTfvwzFU&id=%@",item.component.action.actionIdentifier];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        HVCDBaseClass *_baseClass = [HVCDBaseClass modelObjectWithDictionary:responseObject];
        
        [_userHeader sd_setImageWithURL:[NSURL URLWithString:_baseClass.data.userAvatar]];
        
        _userNameLabel.text = _baseClass.data.userName;
        
        _descriptionLabel.text = _baseClass.data.dataDescription;
        
        [_mainImageView sd_setImageWithURL:[NSURL URLWithString:_baseClass.data.picUrl]];
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
    }];
    
}


- (void)dealloc
{
    [super dealloc];
    [_userHeader release];
    [_userNameLabel release];
    [_descriptionLabel release];
    [_mainImageView release];
    [_indexCollectionView release];
    [_goodsCollectionView release];
}

@end
