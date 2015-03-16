//
//  FavoritesViewController.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "FavoritesViewController.h"
#import "FavoriteCollectionViewCell.h"
#import <UIImageView+WebCache.h>


@interface FavoritesViewController ()
{
    NSMutableArray *_collectedArray;
    
    UICollectionView *_collectionView;
}

@end

@implementation FavoritesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"收藏夹";
    
//    self.view.backgroundColor = M_GRAY_COLOR;
//    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage alloc] forBarMetrics:UIBarMetricsDefault];
//    
//    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    self.view.bounds = CGRectMake(0, 0, 1024-65, 768);

    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc]init];
    
    layOut.minimumLineSpacing = 20.0;
    
    layOut.minimumInteritemSpacing = 10.0;
    
    layOut.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20);
    
    layOut.itemSize = CGSizeMake(210, 320);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layOut];
    
//    CGRectMake(0, 64, M_SCREEN_WIDTH-65, M_SCREEN_HEIGHT-64)
    
    _collectionView.dataSource = self;
    
    _collectionView.delegate = self;
    
    _collectionView.backgroundColor = M_LIGHT_GRAY_COLOR;
    
    [_collectionView registerClass:[FavoriteCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview:_collectionView];
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _collectedArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FavoriteCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    People *item = [_collectedArray objectAtIndex:indexPath.row];
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:item.picUrl]];
    
    return cell;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _collectedArray = [[NSMutableArray arrayWithArray:[DatabaseTool selectAllIds]] retain];
    
    [_collectionView reloadData];
}


@end
