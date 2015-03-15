//
//  PragueLaftViewController.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "PragueLeftViewController.h"
#import "PragueViewController.h"
//#import "PgCollectionViewCell.h"
#import "AppDelegate.h"
#import "FeatureLeftCell.h"
#import <UIImageView+WebCache.h>

#import "PragueLeftViewController.h"
#import "DDMenuController.h"


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
    
    
   // [_collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionTop];
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
    
    DDMenuController *menuController = self.menuController;

    UINavigationController *pragueNav = (UINavigationController *)menuController.rootViewController;

    PragueViewController *pragueViewContreoller = pragueNav.viewControllers[0];
     MLMobileSubjectCategories *category = [_subjetCategoriesArray objectAtIndex:indexPath.row];
    self.categories = category;
    
    pragueViewContreoller.topicId = category.mobileSubjectCategoriesIdentifier;
    
    pragueViewContreoller.subject = category.name;
    
    [pragueViewContreoller reloadView];
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

//http://api2.hichao.com/new_forum/threads?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=76C1368B-3957-4F8B-AB72-17981A0654C4&gs=768x1024&gos=8.1&access_token=&flag=

//http://api2.hichao.com/new_forum/threads?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=76C1368B-3957-4F8B-AB72-17981A0654C4&gs=768x1024&gos=8.1&access_token=&category_id=3&type=latest&flag=

//http://api2.hichao.com/new_forum/threads?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=76C1368B-3957-4F8B-AB72-17981A0654C4&gs=768x1024&gos=8.1&access_token=&category_id=110&type=latest&flag=


//http://api2.hichao.com/new_forum/threads?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=76C1368B-3957-4F8B-AB72-17981A0654C4&gs=768x1024&gos=8.1&access_token=&category_id=104&type=latest&flag=

//http://api2.hichao.com/new_forum/threads?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=76C1368B-3957-4F8B-AB72-17981A0654C4&gs=768x1024&gos=8.1&access_token=&category_id=106&type=latest&flag=

//http://api2.hichao.com/new_forum/threads?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=76C1368B-3957-4F8B-AB72-17981A0654C4&gs=768x1024&gos=8.1&access_token=&category_id=113&type=latest&flag=

//http://api2.hichao.com/new_forum/threads?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=76C1368B-3957-4F8B-AB72-17981A0654C4&gs=768x1024&gos=8.1&access_token=&category_id=108&type=latest&flag=
@end
