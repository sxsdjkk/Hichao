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
//#import ""

@interface HomeRightViewController ()
{
    UICollectionView *_collectionView;
    BOOL _isFirstPage;
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
    layOut.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layOut.minimumLineSpacing = 0.0;
    layOut.minimumInteritemSpacing = 0.0;
    layOut.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layOut.itemSize = CGSizeMake(1024-64, 768-20);

    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 640, 704) collectionViewLayout:layOut];

    [_collectionView registerClass:[HomeNormalItemDetailCell class] forCellWithReuseIdentifier:@"cell"];
    _collectionView.pagingEnabled = YES;
 
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [self.view addSubview:_collectionView];
    _collectionView.hidden = YES;
    
}
- (void)createItemView
{
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
    
}

- (void)createScrollView
{
    _collectionView.hidden = NO;
    _showFrame = CGRectMake(64, 20, 1024-64, 768-20);
    _hideFrame = CGRectMake([UIScreen mainScreen].bounds.size.width, _showFrame.origin.y, _showFrame.size.width, _showFrame.size.height);
    _collectionView.delegate = self;
    _collectionView.frame = CGRectMake(0, 40, 1024-64, 768-20);
    [_collectionView reloadData];
    NSInteger index = [_waterFlowItemsArray indexOfObject:_currentItem];
    _collectionView.contentOffset = CGPointMake(index*_collectionView.frame.size.width, 0);

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _waterFlowItemsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeNormalItemDetailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell setCellWithItem:[_waterFlowItemsArray objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
//    NSLog(@"---%@",NSStringFromCGPoint(scrollView.contentOffset));
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView==_collectionView)
    {
        if(_collectionView.contentOffset.x <= _collectionView.frame.size.width)
        {
            _collectionView.contentOffset = CGPointMake(_collectionView.frame.size.width, 0);
            
        }
    }
}

@end
