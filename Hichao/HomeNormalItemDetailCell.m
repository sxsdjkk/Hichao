//
//  HomeNormalItemDetailCell.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/11.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "HomeNormalItemDetailCell.h"
#import "HomeCellDetailIndexImageCell.h"
#import "HomeCellDetailGoodsListCell.h"
#import <UIImageView+WebCache.h>
#import <UIButton+WebCache.h>

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
        _userNameLabel.textColor = M_PINK_COLOR;
        _userNameLabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:_userNameLabel];
        [_userNameLabel release];
//        _userNameLabel.backgroundColor = M_GRAY_COLOR;
        
        _descriptionLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 50, 380, 40)];
        _descriptionLabel.font = [UIFont systemFontOfSize:14];
        _descriptionLabel.numberOfLines = 0;
        [self addSubview:_descriptionLabel];
        [_descriptionLabel release];
//        _descriptionLabel.backgroundColor = M_GRAY_COLOR;
        
        _mainImageView = [[UIButton alloc]initWithFrame:CGRectMake(80, 100, 350, 550)];
        [self addSubview:_mainImageView];
        [_mainImageView release];
        _mainImageView.backgroundColor = M_GRAY_COLOR;
        
        UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc]init];
        layOut.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layOut.minimumLineSpacing = 10.0;
        layOut.minimumInteritemSpacing = 10.0;
        layOut.sectionInset = UIEdgeInsetsMake(0, 10, 0, 0);
        layOut.itemSize = CGSizeMake(60, 60);
        

        _indexCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(500, 20, 400, 80) collectionViewLayout:layOut];
        [_indexCollectionView registerClass:[HomeCellDetailIndexImageCell class] forCellWithReuseIdentifier:@"indexcell"];
        _indexCollectionView.dataSource = self;
        _indexCollectionView.delegate = self;
        [self addSubview:_indexCollectionView];
        [_indexCollectionView release];
        [layOut release];
        _indexCollectionView.backgroundColor = M_GRAY_COLOR;
        
        UICollectionViewFlowLayout *layOut1 = [[UICollectionViewFlowLayout alloc]init];
        layOut1.minimumLineSpacing = 20.0;
        layOut1.minimumInteritemSpacing = 10.0;
        layOut1.sectionInset = UIEdgeInsetsMake(0, 10, 20, 10);
        layOut1.itemSize = CGSizeMake(180, 260);
        
        _goodsCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(500, 120, 400, self.frame.size.height-120-40) collectionViewLayout:layOut1];
        [_goodsCollectionView registerClass:[HomeCellDetailGoodsListCell class] forCellWithReuseIdentifier:@"goodscell"];
        _goodsCollectionView.dataSource = self;
        _goodsCollectionView.delegate = self;
        [self addSubview:_goodsCollectionView];
        [_goodsCollectionView release];
        [layOut1 release];
        _goodsCollectionView.backgroundColor = M_GRAY_COLOR;
    }
    return self;
}

- (void)setCellWithItem:(WaterFlowItems *)item
{
    _indexViewSelectedIndex = 0;
    
    if (item.component.discount == nil && item.component.itemsCount == nil) {
        NSString *urlStr = [NSString stringWithFormat:@"http://api2.hichao.com/sku?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=&id=%@",item.component.action.actionIdentifier];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            _skuBaseClass = [[SkuBaseClass modelObjectWithDictionary:responseObject] retain];
            
            _descriptionLabel.text = _skuBaseClass.data.dataDescription;
            
            [_mainImageView sd_setBackgroundImageWithURL:[NSURL URLWithString:_skuBaseClass.data.normalPicUrl] forState:UIControlStateNormal];
            
            [_indexCollectionView reloadData];
            
            [_indexCollectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
        }];
        
    }else {
        NSString *urlStr = [NSString stringWithFormat:@"http://api2.hichao.com/star?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=5jOo4szM5D_IOP4mRBQO9SPupA9rapUqooMjTfvwzFU&id=%@",item.component.action.actionIdentifier];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            _baseClass = [[HVCDBaseClass modelObjectWithDictionary:responseObject] retain];
            
            [_userHeader sd_setImageWithURL:[NSURL URLWithString:_baseClass.data.userAvatar]];
            
            _userNameLabel.text = _baseClass.data.userName;
            
            _descriptionLabel.text = _baseClass.data.dataDescription;
            
            [_mainImageView sd_setBackgroundImageWithURL:[NSURL URLWithString:_baseClass.data.picUrl] forState:UIControlStateNormal];
            
            [_indexCollectionView reloadData];
            
            [_indexCollectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
            
            NSString *urlStr = [NSString stringWithFormat:@"http://api2.hichao.com/star_clues?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=5jOo4szM5D_IOP4mRBQO9SPupA9rapUqooMjTfvwzFU&id=%@",item.component.action.actionIdentifier];
            
            [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                _goodsListBaseClass = [HDGLBaseClass modelObjectWithDictionary:responseObject];
                
                [_goodsCollectionView reloadData];
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                
            }];
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
        }];

    }
    
    
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView==_indexCollectionView)
    {
        return _baseClass.data.itemPicUrlList.count;
    }
    else
    {
        NSArray *itemArray = _goodsListBaseClass.data.items;
#warning 精品页
        if (itemArray.count>0) {
            NSLog(@"%@",[[itemArray objectAtIndex:0] class]);
            HDGLItems *items = [itemArray objectAtIndex:_indexViewSelectedIndex];
            
            return [items.itemList count];
        }else{
            return 0;
        }
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView==_indexCollectionView)
    {
        HomeCellDetailIndexImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"indexcell" forIndexPath:indexPath];
        
        HVCDItemPicUrlList *list = [_baseClass.data.itemPicUrlList objectAtIndex:indexPath.row];
        
        [cell.indexImageView sd_setImageWithURL:[NSURL URLWithString:list.picUrl]];
        
        return cell;
    }
    else
    {
        HomeCellDetailGoodsListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"goodscell" forIndexPath:indexPath];
#warning 精品页
        HDGLItems *items = [_goodsListBaseClass.data.items objectAtIndex:_indexViewSelectedIndex];
        HDGLItemList *list = [items.itemList objectAtIndex:indexPath.row];
        
        [cell setCellWithList:list];
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView==_indexCollectionView)
    {
        _indexViewSelectedIndex = indexPath.row;
        
        [_goodsCollectionView reloadData];
    }
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
    [_baseClass release];
}

@end
