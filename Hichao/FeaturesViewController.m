//
//  FeaturesViewController.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "FeaturesViewController.h"
#import "FeaturesCell.h"
#import <UIImageView+WebCache.h>

@interface FeaturesViewController ()

@end

@implementation FeaturesViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        _topicsItemsArray = [[NSMutableArray alloc] initWithCapacity:0];
        
    }
    return self;
}
- (void)dealloc{
    [super dealloc];
    [_topicsItemsArray release];
    [_topicsBaseClass release];
    [_collectionView release];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationItem.title = _subject;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if (_subject == nil) {
        _subject = @"全部";
    }

    self.view.backgroundColor = M_GRAY_COLOR;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage alloc] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithWhite:53/255.0 alpha:1.0];
    
    [self creatCollectionView];
    [self reloadView];
    
    //右边视图
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    _featuresRightVC = [[FeaturesRightViewController alloc] init];
    _featuresRightVC.view.frame = _featuresRightVC.hideFrame;
    [window addSubview:_featuresRightVC.view];
}
- (void)reloadView{
    [self requestData];
    [_topicsItemsArray removeAllObjects];
    self.navigationItem.title = _subject;
}
- (void)requestData{
    NSString *topicsString = [NSString stringWithFormat:@"http://api2.hichao.com/topics?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=&category=%@&flag=",_subject];
    //汉字转码
    topicsString = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)topicsString, NULL, NULL, kCFStringEncodingUTF8);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:topicsString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        _topicsBaseClass = [[TopicsBaseClass alloc] initWithDictionary:responseObject];
        [_topicsItemsArray addObjectsFromArray:_topicsBaseClass.data.items];
        [_collectionView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}
- (void)creatCollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 15.0;
    flowLayout.minimumInteritemSpacing = 15.0;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 0, 10, 0);
    flowLayout.itemSize = CGSizeMake(self.view.frame.size.width/2-50,300);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(16, 16, self.view.frame.size.width-84, self.view.frame.size.height-16) collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = M_GRAY_COLOR;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[FeaturesCell class] forCellWithReuseIdentifier:@"cell"];
    
}
#pragma mark - UICollectionViewDataSource
//每个分区上的元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _topicsItemsArray.count;
}
//设置元素内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FeaturesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    TopicsItems *item = _topicsItemsArray[indexPath.row];
    cell.items = item;
    return cell;
}
#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    UIControl *control = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    control.alpha = 0.0f;
    control.backgroundColor = [UIColor blackColor];
    [window addSubview:control];
    [control release];
    [control addTarget:self action:@selector(rmBlackView:) forControlEvents:UIControlEventTouchUpInside];
    
    [window bringSubviewToFront:_featuresRightVC.view];
    
    _featuresRightVC.item = _topicsItemsArray[indexPath.row];
    [_featuresRightVC requestData];
    [UIView animateWithDuration:0.5 animations:^{
        control.alpha = 0.5f;
        _featuresRightVC.view.frame = _featuresRightVC.showFrame;
    }];
}

- (void)rmBlackView:(UIControl *)control{
    [UIView animateWithDuration:0.5 animations:^{
        _featuresRightVC.view.frame = _featuresRightVC.hideFrame;
        control.alpha = 0.5f;
    } completion:^(BOOL finished) {
        [control removeFromSuperview];
    }];
}


@end
