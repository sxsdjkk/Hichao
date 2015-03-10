//
//  PragueLaftViewController.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "PragueLeftViewController.h"
#import "PgCollectionViewCell.h"
@interface PragueLeftViewController ()

#define M_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define M_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@end

@implementation PragueLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self creatCollectionView];
    
}


- (void)creatCollectionView
{
    UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc]init];
    
    layOut.minimumLineSpacing = 0.0;
    
    layOut.minimumInteritemSpacing = 0.0;
    
    layOut.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    layOut.itemSize = CGSizeMake(240, 50);
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 240, M_SCREEN_HEIGHT) collectionViewLayout:layOut];
    
    [collectionView registerClass:[PgCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    collectionView.backgroundColor = M_LIGHT_GRAY_COLOR;
    
    [self.view addSubview:collectionView];
    
    
    [collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionTop];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PgCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
//    MLMobileTopicCategories *category = [_baseClass.data.config.mobileTopicCategories objectAtIndex:indexPath.row];
    
//    [cell.titleImageView sd_setImageWithURL:[NSURL URLWithString:category.picUrl]];
//    cell.textLabel.text = category.name;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    //    DDMenuController *menuController = self.menuController;
    //
    //    UINavigationController *featuresNav = menuController.rootViewController;
    //
    //    FeaturesViewController *featuresVC = featuresNav.viewControllers[0];
    //    featuresVC.subject = [_baseClass.data.config.mobileTopicCategories objectAtIndex:indexPath.row];
    
    NSLog(@"您点是%d",indexPath.row);
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(240, 20);
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
