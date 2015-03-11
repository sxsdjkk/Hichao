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
#import "DDMenuController.h"
#import "SelectedViewController.h"

@interface SelectedLeftViewController ()
{
    SLIDMBaseClass *_baseClass;
    UICollectionView *_collectionView;
    NSMutableArray *_openedArray;
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
        
        _openedArray = [[NSMutableArray alloc] init];
        
        for (int i=0; i<_baseClass.data.querys.count+1; i++)
        {
            [_openedArray addObject:[NSNumber numberWithBool:NO]];
        }
       
        UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc]init];
        
        layOut.minimumLineSpacing = 10.0;
        
        layOut.minimumInteritemSpacing = 0.0;
        
        layOut.sectionInset = UIEdgeInsetsMake(10, 0, 10, 0);
        
        layOut.itemSize = CGSizeMake(48, 70);

        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, 240, M_SCREEN_HEIGHT-64) collectionViewLayout:layOut];
        
        _collectionView.dataSource = self;
        
        _collectionView.delegate = self;
        
        _collectionView.backgroundColor = M_LIGHT_GRAY_COLOR;
        
        [_collectionView registerClass:[SelectedLeftCell class] forCellWithReuseIdentifier:@"cell"];
        
        [_collectionView registerClass:[SelectedLeftHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        
        [self.view addSubview:_collectionView];
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        
        NSLog(@"%@",error);
    }];
}

#pragma mark- collection view

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _baseClass.data.querys.count+1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    if (section==0)
//    {
//        return 0;
//    }
    if([[_openedArray objectAtIndex:section] boolValue]){
        return [[_baseClass.data.querys objectAtIndex:section-1] items].count;
    }
    else
    {
        return 0;
    }    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    SLIDMItems *item = [[[_baseClass.data.querys objectAtIndex:indexPath.section-1] items] objectAtIndex:indexPath.row];
    
    SelectedLeftCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:item.component.picUrl]];
    
    cell.textLabel.text = item.component.action.title;
    
    return cell;

}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    SelectedLeftHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    
    if (indexPath.section==0)
    {
        view.textLabel.text = @"全部";
        
        [view.titleImageView sd_setImageWithURL:[NSURL URLWithString:@"http://m5.pimg.cn/images/images/20140310/8130523b-ecaf-4a46-8436-9f34f5e5cde9.png"]];
        
        view.accessoryView.hidden = YES;

    }
    else
    {
        SLIDMQuerys *query = [_baseClass.data.querys objectAtIndex:indexPath.section-1];
        
        [view.titleImageView sd_setImageWithURL:[NSURL URLWithString:query.cateimg]];
        
        view.textLabel.text = query.title;
        
        view.accessoryView.hidden = NO;
    }
    
    [view setOpened:[[_openedArray objectAtIndex:indexPath.section] boolValue]];
    
    view.tag = indexPath.section+500;
    
    view.backgroundBtn.tag = indexPath.section+100;
    
    [view.backgroundBtn addTarget:self action:@selector(headerBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return view;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return  CGSizeMake(50, 65);
//}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    return CGSizeMake(240, 50);
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
//{
//    return section==0?CGSizeMake(240, 30):CGSizeMake(0, 0);
//}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    SLIDMItems *item = [[[_baseClass.data.querys objectAtIndex:indexPath.section-1] items] objectAtIndex:indexPath.row];
    
    UINavigationController *selectedNav = (UINavigationController *)self.menuController.rootViewController;
    
    SelectedViewController *selectedVC = selectedNav.viewControllers[0];
    
    selectedVC.subject = item.component.action.query;//[NSString stringWithFormat:@"%@%2c%@",,item.component.action.title];
    
    NSLog(@"-----%@",selectedVC.subject);
    
    [selectedVC reloadView];
    
    [self.menuController showRootController:YES];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if ([[_openedArray objectAtIndex:section] boolValue])
    {
        return UIEdgeInsetsMake(10, 10, 10, 10);
    }
    else
    {
        return UIEdgeInsetsZero;
    }
}

#pragma mark-

- (void)headerBtnClicked:(UIButton *)button
{
    
    
    if (button.tag==100)
    {
        SelectedLeftHeaderView *firstHeader = (SelectedLeftHeaderView *)[_collectionView viewWithTag:500];
        
        [firstHeader setOpened:YES];
        
        UINavigationController *selectedNav = (UINavigationController *)self.menuController.rootViewController;
        
        SelectedViewController *selectedVC = selectedNav.viewControllers[0];
        
        selectedVC.subject = @"全部";
        
        [selectedVC reloadView];
        
        [self.menuController showRootController:YES];
    }
    else
    {
        SelectedLeftHeaderView *firstHeader = (SelectedLeftHeaderView *)[_collectionView viewWithTag:500];
        
        [firstHeader setOpened:NO];
        
        NSNumber *newIsOpen = [NSNumber numberWithBool:![[_openedArray objectAtIndex:button.tag-100] boolValue]];
        
        [_openedArray removeObjectAtIndex:button.tag-100];
        
        [_openedArray insertObject:newIsOpen atIndex:button.tag-100];
        
        SelectedLeftHeaderView *headerViewNew = (SelectedLeftHeaderView *)[_collectionView viewWithTag:button.tag+400];
        
        [headerViewNew setOpened:newIsOpen.boolValue];

        [_collectionView reloadSections:[NSIndexSet indexSetWithIndex:button.tag-100]];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
