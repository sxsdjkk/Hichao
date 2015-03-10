//
//  HomeLeftViewController.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "HomeLeftViewController.h"
#import "MainLeftRoundCell.h"
#import "MainLeftRectCell.h"
#import "DDMenuController.h"
#import "HomeViewController.h"


@interface HomeLeftViewController ()
{
    UICollectionView *_collectionView;
//    NSIndexPath *_selectedIndexPath;
    
    NSArray *_categoryArray;
    NSArray *_hotWordsArray;
}
@end

@implementation HomeLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//热词 http://api2.hichao.com/hotwords?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=&type=hot&version=
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *urlStr = @"http://api2.hichao.com/hotwords?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=&type=hot&version=";
    
    _categoryArray = [@[@"全部",@"欧美",@"日韩",@"本土",@"潮男",@"热播",@"明星"] retain];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        MLHWBaseClass *baseClass = [MLHWBaseClass modelObjectWithDictionary:responseObject];
        
        _hotWordsArray = [baseClass.data.querys retain];
        
        [_collectionView reloadSections:[NSIndexSet indexSetWithIndex:1]];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
    }];
    
    
    self.view.backgroundColor = M_LIGHT_GRAY_COLOR;
    
    UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc]init];
    
    layOut.minimumLineSpacing = 0.0;
    
    layOut.minimumInteritemSpacing = 0.0;
    
    layOut.sectionInset = UIEdgeInsetsMake(10, 0, 10, 0);
    
    layOut.itemSize = CGSizeMake(60, 60);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 240, M_SCREEN_HEIGHT) collectionViewLayout:layOut];
    
    [_collectionView registerClass:[MainLeftRoundCell class] forCellWithReuseIdentifier:@"RoundCell"];
    
    [_collectionView registerClass:[MainLeftRectCell class] forCellWithReuseIdentifier:@"RectCell"];
    
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
    
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer"];
    
    _collectionView.dataSource = self;
    
    _collectionView.delegate = self;
    
    _collectionView.allowsMultipleSelection = NO;
    
    _collectionView.backgroundColor = M_LIGHT_GRAY_COLOR;
    
    [_collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
    
    [self.view addSubview:_collectionView];
    
    [_collectionView release];
    
    
}


#pragma mark- collection view

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return section==0?_categoryArray.count:_hotWordsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    static int i = 0;
    if (indexPath.section==0)
    {
        MainLeftRoundCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RoundCell" forIndexPath:indexPath];
        
        cell.textLabel.text = [_categoryArray objectAtIndex:indexPath.row];
        
        return cell;
    }
    else
    {
        MainLeftRectCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RectCell" forIndexPath:indexPath];
        
        MLHWQuerys *data = [_hotWordsArray objectAtIndex:indexPath.row];
        
        cell.textLabel.text = data.title;
        
        [cell.titleImageView sd_setImageWithURL:[NSURL URLWithString:data.picUrl]];
        
        return cell;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind==UICollectionElementKindSectionHeader)
    {
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
        
        NSArray *subViews = [view subviews];
        
        for (UIView *view in subViews)
        {
            [view removeFromSuperview];
        }
        
        UILabel *label = [[UILabel alloc] init];
                          
        label.font = [UIFont systemFontOfSize:24];
        
        if (indexPath.section==0)
        {
            label.text = @"搭配类别";
            
        }
        else
        {
            label.text = @"最近热门搜索";
        }
        
        CGRect rect = [label.text boundingRectWithSize:CGSizeMake(0, 0) options:
                       NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label.font} context:nil];
        
        label.bounds = rect;
        
        label.center = CGPointMake(view.frame.size.width/2, view.frame.size.height-20);
        
        label.backgroundColor = M_LIGHT_GRAY_COLOR;
        
        label.textAlignment = NSTextAlignmentCenter;
        
        UIView *lineView = [[UIView alloc]init];
        
        lineView.backgroundColor = [UIColor colorWithWhite:0.4 alpha:1.0];
        
        lineView.bounds = CGRectMake(0, 0, 200, 2);
        
        lineView.center = label.center;
        
        [view addSubview:lineView];
        
        [view addSubview:label];
        
        [label release];
        
        return view;
    }
    else
    {
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer" forIndexPath:indexPath];
        
        NSArray *subViews = [view subviews];
        
        for (UIView *view in subViews)
        {
            [view removeFromSuperview];
        }

        UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:view.bounds];
        
        searchBar.autoresizingMask = YES;
        
//        searchBar setImage:<#(UIImage *)#> forSearchBarIcon:<#(UISearchBarIcon)#> state:<#(UIControlState)#>
        
        searchBar.tintColor = [UIColor whiteColor];
        
        searchBar.searchBarStyle = UISearchBarStyleMinimal;
        
        searchBar.placeholder = @"搜索明星，达人，搭配图  ";
        
//        searchBar.barTintColor = [UIColor blueColor];
        
        searchBar.delegate = self;
        
        [view addSubview:searchBar];
        
        [searchBar release];
        
        return view;
    }
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
    
    UINavigationController *homeNav = (UINavigationController *)self.menuController.rootViewController;
    
    HomeViewController *homeVC = homeNav.viewControllers[0];
    homeVC.subject = [_categoryArray objectAtIndex:indexPath.row];
    

    [homeVC reloadView];
    
    [self.menuController showRootController:YES];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return section==0?UIEdgeInsetsMake(10, 10, 10, 10):UIEdgeInsetsMake(10, 0, 10, 0);
}

#pragma mark- search bar delegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    return YES;
}


- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
    
    // 修改UISearchBar右侧的取消按钮文字颜色及背景图片
    for (UIView * searchbuttons in searchBar.subviews)
    {
        for (id view in [searchbuttons subviews] )
        {
            if ( [view isKindOfClass: [UIButton class]] )
            {
                UIButton * cancelButton = (UIButton*)view;
                cancelButton.enabled = YES;
                
                [cancelButton setTitleColor: [UIColor colorWithWhite:0.4 alpha:1.0] forState:UIControlStateNormal];
                
//                cancelButton.layer.borderWidth = 1.0;
                
                cancelButton.layer.borderColor = [[UIColor colorWithWhite:0.4 alpha:1.0] CGColor];
                
                [cancelButton setTitle:@"取消" forState:UIControlStateNormal];//文字
  
                break; 
            } 
        } 
    }
}


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = NO;
    [searchBar resignFirstResponder];
}



- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"%s",__func__);
}

- (void)dealloc
{
    [super dealloc];
    
    [_categoryArray release];
    
//    [_selectedIndexPath release];
}

@end
