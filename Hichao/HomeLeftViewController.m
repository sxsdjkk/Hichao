//
//  HomeLeftViewController.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "HomeLeftViewController.h"
#import "MainLeftRoundCell.h"


@interface HomeLeftViewController ()
{
    UICollectionView *_collectionView;
}
@end

@implementation HomeLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];;
    
    UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc]init];
    
    layOut.minimumLineSpacing = 12.0;
    
    layOut.minimumInteritemSpacing = 0.0;
    
    layOut.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    layOut.itemSize = CGSizeMake(60, 60);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 240, M_SCREEN_HEIGHT) collectionViewLayout:layOut];
    
    [_collectionView registerClass:[MainLeftRoundCell class] forCellWithReuseIdentifier:@"RoundCell"];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
    
    _collectionView.dataSource = self;
    
    _collectionView.delegate = self;
    
    _collectionView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    
    [self.view addSubview:_collectionView];
}


#pragma mark- collection view

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 7;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MainLeftRoundCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RoundCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d-%d",indexPath.section,indexPath.row];
    
    cell.backgroundImage.image = [UIImage imageNamed:@"home_left_btn_type@2x.png"];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
    
    NSArray *subViews = [view subviews];
    
    for (UIView *view in subViews)
    {
        [view removeFromSuperview];
    }
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 240, 80)];
    label.backgroundColor = [UIColor orangeColor];
    
    [view addSubview:label];
    
    [label release];
    
    return view;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  indexPath.section==0?CGSizeMake(53, 53):CGSizeMake(240, 50);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(240, 80);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",indexPath);
}

@end
