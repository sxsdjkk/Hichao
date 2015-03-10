//
//  SelectedLeftViewController.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "SelectedLeftViewController.h"
#import "SelectedLeftCell.h"
#import "SelectedLeftHeaderView.h"
#import <UIImageView+WebCache.h>

@interface SelectedLeftViewController ()
{
    SLIDMBaseClass *_baseClass;
}
@end

@implementation SelectedLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = M_LIGHT_GRAY_COLOR;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSString *urlStr = @"http://api2.hichao.com/hotwords?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=&type=item&version=";
    
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        _baseClass = [SLIDMBaseClass modelObjectWithDictionary:responseObject];
       
        UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc]init];
        
        layOut.minimumLineSpacing = 0.0;
        
        layOut.minimumInteritemSpacing = 0.0;
        
        layOut.sectionInset = UIEdgeInsetsMake(10, 0, 10, 0);
        
        layOut.itemSize = CGSizeMake(60, 60);

        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, 240, M_SCREEN_HEIGHT-64) collectionViewLayout:layOut];
        
        collectionView.dataSource = self;
        
        collectionView.delegate = self;
        
        collectionView.backgroundColor = M_LIGHT_GRAY_COLOR;
        
        [collectionView registerClass:[SelectedLeftCell class] forCellWithReuseIdentifier:@"cell"];
        
        [collectionView registerClass:[SelectedLeftHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        
        [self.view addSubview:collectionView];
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        
        NSLog(@"%@",error);
    }];
}

#pragma mark- collection view

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _baseClass.data.querys.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[_baseClass.data.querys objectAtIndex:section] items].count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    SLIDMItems *item = [[[_baseClass.data.querys objectAtIndex:indexPath.section] items] objectAtIndex:indexPath.row];
    
    SelectedLeftCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:item.component.picUrl]];
    
    return cell;

}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    SelectedLeftHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    
    return view;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  indexPath.section==0?CGSizeMake(53, 53):CGSizeMake(240, 60);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    return section==0?CGSizeMake(240, 80):CGSizeMake(240, 50);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return section==0?CGSizeMake(240, 30):CGSizeMake(0, 0);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    //    if(indexPath != _selectedIndexPath)
    //    {
    //        if (_selectedIndexPath)
    //        {
    //            [_selectedIndexPath release];
    //        }
    //
    //        _selectedIndexPath = [indexPath retain];
    //
    //        [collectionView reloadData];
    //    }
    //    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
//    UINavigationController *homeNav = (UINavigationController *)self.menuController.rootViewController;
//    
//    HomeViewController *homeVC = homeNav.viewControllers[0];
//    homeVC.subject = [_categoryArray objectAtIndex:indexPath.row];
//    
//    [homeVC reloadView];
//    
//    [self.menuController showRootController:YES];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return section==0?UIEdgeInsetsMake(10, 10, 10, 10):UIEdgeInsetsMake(10, 0, 10, 0);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
