//
//  PragueLaftViewController.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "PragueLeftViewController.h"
//#import "PgCollectionViewCell.h"
#import "AppDelegate.h"
#import "FeatureLeftCell.h"
#import <UIImageView+WebCache.h>

@interface PragueLeftViewController ()
{
    UICollectionView *_collectionView;
}

@end

@implementation PragueLeftViewController

- (id)init
{
    self = [super init];
    
    if (self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reLoadCollectionView) name:@"configOnline" object:nil];
    }
    return self;
}

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
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 240, M_SCREEN_HEIGHT) collectionViewLayout:layOut];
    
    [_collectionView registerClass:[FeatureLeftCell class] forCellWithReuseIdentifier:@"cell"];
    
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    _collectionView.backgroundColor = M_LIGHT_GRAY_COLOR;
    
    [self.view addSubview:_collectionView];
    
    
    [_collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionTop];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _subjetCategoriesArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FeatureLeftCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    MLMobileSubjectCategories *category = [_subjetCategoriesArray objectAtIndex:indexPath.row];
    
    [cell.titleImageView sd_setImageWithURL:[NSURL URLWithString:category.picUrl]];

    cell.textLabel.text = category.name;
    
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




#pragma mark- notify called selector
- (void)reLoadCollectionView
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    _subjetCategoriesArray = delegate.configBaseClass.data.config.mobileSubjectCategories;
    
    [_collectionView reloadData];
}


- (void)dealloc
{
    [super dealloc];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"configOnline" object:nil];
}

@end
