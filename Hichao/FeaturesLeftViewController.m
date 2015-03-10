//
//  FeaturesLeftViewController.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "FeaturesLeftViewController.h"
#import "FeatureLeftCell.h"
#import <UIImageView+WebCache.h>


@interface FeaturesLeftViewController ()
{
    MLBaseClass *_baseClass;
}
@end

@implementation FeaturesLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = M_LIGHT_GRAY_COLOR;
    
    NSString *urlStr = @"http://api2.hichao.com/config?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=&splash_version=19&screen_width=1536&config_version=39&screen_height=2048";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSLog(@"%@",responseObject);
        _baseClass = [MLBaseClass modelObjectWithDictionary:responseObject];
        [self creatCollectionView];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        
        NSLog(@"%@",error);
    }];
}


#pragma mark- collection view 

- (void)creatCollectionView
{
    UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc]init];
    
    layOut.minimumLineSpacing = 0.0;
    
    layOut.minimumInteritemSpacing = 0.0;
    
    layOut.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    layOut.itemSize = CGSizeMake(240, 50);
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 240, M_SCREEN_HEIGHT) collectionViewLayout:layOut];
    
    [collectionView registerClass:[FeatureLeftCell class] forCellWithReuseIdentifier:@"cell"];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    collectionView.backgroundColor = M_LIGHT_GRAY_COLOR;
    
    [self.view addSubview:collectionView];
    
    
    [collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionTop];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _baseClass.data.config.mobileTopicCategories.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FeatureLeftCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    MLMobileTopicCategories *category = [_baseClass.data.config.mobileTopicCategories objectAtIndex:indexPath.row];
    
    [cell.titleImageView sd_setImageWithURL:[NSURL URLWithString:category.picUrl]];
    
    cell.textLabel.text = category.name;
    
    return cell;
}




- (void)dealloc
{
    [super dealloc];
    [_baseClass release];
}

@end
