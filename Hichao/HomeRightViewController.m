//
//  HomeRightViewController.m
//  Hichao
//
//  Created by Tz101 on 15/3/9.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "HomeRightViewController.h"
#import <UIImageView+WebCache.h>
#import "HomeNormalItemDetailCell.h"

@interface HomeRightViewController ()
{
    UICollectionView *_collectionView;
}
@end

@implementation HomeRightViewController

- (instancetype)init;
{
    self = [super init];
    if (self) {
        
        _showFrame = CGRectMake(1024-640, 64, 640, 704);
        _hideFrame = CGRectMake([UIScreen mainScreen].bounds.size.width, _showFrame.origin.y, _showFrame.size.width, _showFrame.size.height);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = M_GRAY_COLOR;
    
    UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc]init];
    layOut.minimumLineSpacing = 0.0;
    layOut.minimumInteritemSpacing = 0.0;
    layOut.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layOut.itemSize = CGSizeMake(640, 704);

    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 640, 704) collectionViewLayout:layOut];

    [_collectionView registerClass:[HomeNormalItemDetailCell class] forCellWithReuseIdentifier:@"cell"];
    _collectionView.backgroundColor = M_PINK_COLOR;
    [self.view addSubview:_collectionView];
    _collectionView.hidden = YES;
    
}
- (void)createItemView{
//    NSString *urlString = [NSString stringWithFormat:@"http://api2.hichao.com/sku?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=&id=%@",_currentItem.component.action.actionIdentifier];
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@",responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"%@",error);
//    }];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 640, 704)];
    NSURL *url = [NSURL URLWithString:_currentItem.component.picUrl];
    [imageView sd_setImageWithURL:url];
    [self.view addSubview:imageView];
    [imageView release];
//    UIButtonType
}
- (void)createScrollView
{
    _collectionView.frame = CGRectMake(0, 0, 640, 704);
    
//    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 640, 704)];
//    _scrollView.delegate = self;
//    _scrollView.showsHorizontalScrollIndicator = YES;
//    _scrollView.pagingEnabled = YES;
//    [self.view addSubview:_scrollView];
//    int i = 0;
//    for (WaterFlowItems *item in _waterFlowItemsArray)
//    {
//        if (item.component.action.normalPicUrl) {
//            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(640*i, 0, 640, 704)];
//            NSURL *url = [NSURL URLWithString:item.component.action.normalPicUrl];
//            [imageView sd_setImageWithURL:url];
//            [_scrollView addSubview:imageView];
//            [imageView release];
//            if (_currentItem.component.showId == item.component.showId)
//            {
//                [_scrollView setContentOffset:CGPointMake(640*i, 0)];
//            }
//            i++;
//        }
        
        
//    }
//    _scrollView.contentSize = CGSizeMake(640*i, 704);
}


@end
