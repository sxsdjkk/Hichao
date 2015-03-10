//
//  TuanViewController.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "TuanViewController.h"

#import "TuanTableCell.h"
#import "CollectionViewCell.h"

#import "SVPullToRefresh.h"
#import "AFHTTPRequestOperationManager.h"
#import "UIImageView+WebCache.h"


//
//#define fDeviceWidth ([UIScreen mainScreen].bounds.size.width)
//#define fDeviceHeight ([UIScreen mainScreen].bounds.size.height-StatusBarHeight)

#define COORD 1024-64/2


@interface TuanViewController ()


@end

@implementation TuanViewController

-(void)viewWillAppear:(BOOL)animated{
    
    AFHTTPRequestOperationManager * manager=[AFHTTPRequestOperationManager manager];
    
    
    NSString * url=@"http://api2.hichao.com/tuanlist?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=32DED6FD-9960-43D0-BCB4-BD1E0B7FB5BA&gs=768x1024&gos=8.1&access_token=&flag=";
    
    
    NSString * encodedString = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)url, NULL, NULL,  kCFStringEncodingUTF8 );

    
    [manager GET:encodedString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        
        _baseClass = [StarBaseClass modelObjectWithDictionary:responseObject];
        

        
        // NSLog(@"%d",_baseClass.data.items.count);
        
        [_laftView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
    }];
    
    
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _laftView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, (1024-64)/2, M_SCREEN_HEIGHT)];
    _laftView.delegate = self;
    _laftView.dataSource = self;
    
    [_laftView registerClass:[TuanTableCell class] forCellReuseIdentifier:@"Cell_1"];
    
    _laftView.tag = 100;
    _laftView.rowHeight=350;
    [self.view addSubview:_laftView];
    [_laftView release];
    
    [self collectionUI];
    
   
    

    [_laftView addPullToRefreshWithActionHandler:^{
        
        
        AFHTTPRequestOperationManager * manager=[AFHTTPRequestOperationManager manager];
        
        
        NSString * url=@"http://api2.hichao.com/tuanlist?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=32DED6FD-9960-43D0-BCB4-BD1E0B7FB5BA&gs=768x1024&gos=8.1&access_token=&flag=";
        
        
        NSString * encodedString = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)url, NULL, NULL,  kCFStringEncodingUTF8 );
        
        
        [manager GET:encodedString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            _baseClass = [StarBaseClass modelObjectWithDictionary:responseObject];
           
            
            
           // NSLog(@"%d",_baseClass.data.items.count);
            
            [_laftView reloadData];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            
        }];
        
        [_laftView.pullToRefreshView stopAnimating];
        
    }];
    
    [_laftView addInfiniteScrollingWithActionHandler:^{
        NSLog(@"下拉加载");
        
    }];
 
}


-(void)collectionUI{
    

    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
     flowLayout.headerReferenceSize = CGSizeMake(10, 10);//头部
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(1024-64-480, 0,480 ,768) collectionViewLayout:flowLayout];
    
    
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
    
    UIView * viewH = [[UIView alloc]initWithFrame:CGRectMake(COORD, 0, 480, 568)];
    viewH.backgroundColor = [UIColor cyanColor];
    [_collectionView addSubview:viewH];
}

#pragma mak - UITableViewDeletgate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

        return _baseClass.data.items.count;
  
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    TuanTableCell * cell = (TuanTableCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell_1"];
    
    StarItems*item=_baseClass.data.items[indexPath.row];
    
    cell.items=item;
    
    return cell;
}

//点击cell发请求
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
       // StarItems   *items = _baseClass.data.items[indexPath.row];
    
     StarItems  *items = _baseClass.data.items[indexPath.row];
    
        StarAction *startAction = items.component.action;
        
        AFHTTPRequestOperationManager * managerH = [AFHTTPRequestOperationManager manager];
        
        NSString *urlStr = [NSString stringWithFormat:@"http://api2.hichao.com/tuan?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=76C1368B-3957-4F8B-AB72-17981A0654C4&gs=768x1024&gos=8.1&access_token=&tuan_id=%@&flag=",startAction.actionIdentifier];
        
        NSLog(@"%@",startAction.actionIdentifier);
        
        [managerH GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            _baseClassH = [HStarBaseClass modelObjectWithDictionary:responseObject];
            
            NSLog(@"title---%@--%@",_baseClassH,_items.component.title);
            [_collectionView reloadData];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            
        }];


}


#pragma mak - CollectionViewDelegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _baseClassH.data.items.count;
   
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identify = @"cell";
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
      [cell sizeToFit];
    if (!cell) {
        NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
    }
    
    HStarItems *data = [_baseClassH.data.items objectAtIndex:indexPath.row];
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:data.component.picUrl]];//[NSURL URLWithString:_items.component.picUrl]];
    
    NSLog(@"%@",_items.component.picUrl);
    
    [cell.tuanButton setTitle:@"参加抢购" forState:UIControlStateNormal];
    [cell.tuanButton setBackgroundImage:[UIImage imageNamed:@"button_tuangou_buy_detail.png"] forState:UIControlStateNormal];
    

    cell.titleLabel.text = data.component.title;
    cell.titleLabel.font = [UIFont systemFontOfSize:13];
    cell.upImageView.image = [UIImage imageNamed:@"icon_tuan_remai_clothes@2x.png"];
    
    cell.priceLabel.text = data.component.price;
    cell.priceLabel.font = [UIFont systemFontOfSize:20];
    cell.priceLabel.textColor = [UIColor colorWithRed:239/255.0 green:46/255.0 blue:130/255.0 alpha:1.0];
    
   
    cell.origLabel.text = [NSString  stringWithFormat:@"原价 %@",data.component.priceOrig];
    cell.origLabel.font = [UIFont systemFontOfSize:13];
   
    
    cell.disCountImage.image = [UIImage imageNamed:@"bg_tuangou_zhekou_detail@2x.png"];
    
    cell.disCountLabel.text = data.component.discount;
    cell.disCountLabel.textColor = [UIColor whiteColor];
    
    cell.peopleImage.image = [UIImage imageNamed:@"icon_zhidemai_list_user@2x"];
    cell.peopleLabel.text = data.component.peopleCount;
    
   
    
    
    return cell;

}



#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    return CGSizeMake(230, 340);
}
//定义每个UICollectionView 的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 5, 5, 5);
}

//定义每个UICollectionView 纵向的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    NSLog(@"选择%ld",(long)indexPath.row);
    
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//-(CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    if(section == 0)
//    {
//        CGSize size = {320, 100};
//        
//        return size;
//    }
//    else
//    {
//        CGSize size = {320, 50};
//        return size;
//    }
//}


@end
