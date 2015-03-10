//
//  FeaturesViewController.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "FeaturesViewController.h"
#import "FeaturesCell.h"

@interface FeaturesViewController ()

@end

@implementation FeaturesViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];

    self.view.backgroundColor = M_GRAY_COLOR;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage alloc] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithWhite:53/255.0 alpha:1.0];
    
    [self creatCollectionView];
}
- (void)creatCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0.0;
    layout.minimumInteritemSpacing = 0.0;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.itemSize = CGSizeMake(460, 300);
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 240, self.view.frame.size.height) collectionViewLayout:layout];
    collectionView.backgroundColor = M_GRAY_COLOR;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    
    [collectionView registerClass:[FeaturesCell class] forCellWithReuseIdentifier:@"cell"];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FeaturesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}




@end
