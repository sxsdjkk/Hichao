//
//  PragueViewController.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "PragueViewController.h"
#import "pragueTableViewCell.h"
#import "RightTableViewCell.h"
#import "PragueLeftViewController.h"
#import "UIImageView+WebCache.h"


@interface PragueViewController ()
{
    
    NSDictionary * _dataBase;
    
    
}

@end

#define COORD (1024-64)/2

@implementation PragueViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        leftIndex = [[NSMutableArray array] retain];
        rightIndex = [[NSMutableArray array] retain];
        colHeight[0] = 0.0f;
        colHeight[1] = 0.0f;
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"11111");
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationItem.title = _subject;
//    [self reloadView];
    NSLog(@"2222");
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//    NSLog(@"===========8888888");
//}
-(void)reloadView{

    self.title = _subject;
    
    NSString * url = nil;
    
    if ([_topicId integerValue] <3) {
        
        url =@"http://api2.hichao.com/new_forum/threads?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=76C1368B-3957-4F8B-AB72-17981A0654C4&gs=768x1024&gos=8.1&access_token=&flag=";
        
    }else{
        url = [NSString stringWithFormat:@"http://api2.hichao.com/new_forum/threads?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=76C1368B-3957-4F8B-AB72-17981A0654C4&gs=768x1024&gos=8.1&access_token=&category_id=%@&type=latest&flag=",self.topicId];
    }

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        _baseClass = [PgBaseClass modelObjectWithDictionary:responseObject];

        [self loadPullView];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (_subject == nil) {
        _subject = @"全部";
    }
    NSLog(@"99999");
    
    //[self reloadView];
    self.view.backgroundColor = M_GRAY_COLOR;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage alloc] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithWhite:53/255.0 alpha:1.0];
    
    UINavigationBar *nav = [[UINavigationBar alloc] init];
    [nav setBackgroundColor:M_GRAY_COLOR];
    [self.view addSubview:nav];
    [nav release];
    
    self.title = @"全部";

    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    NSString * url = @"http://api2.hichao.com/new_forum/threads?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=76C1368B-3957-4F8B-AB72-17981A0654C4&gs=768x1024&gos=8.1&access_token=&flag=";
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        _baseClass = [PgBaseClass modelObjectWithDictionary:responseObject];
        
        [self loadPullView];
//        [leftView reloadData];
//        [rightView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
    }];
    
    leftView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, COORD, M_SCREEN_HEIGHT-64)style:UITableViewStylePlain];
    leftView.delegate = self;
    leftView.dataSource = self;
    leftView.tag = 100;
    
    leftView.rowHeight = 250;
    
    [leftView registerClass:[pragueTableViewCell class] forCellReuseIdentifier:@"cell_1"];
    [self.view addSubview:leftView];
    
    rightView = [[UITableView alloc] initWithFrame:CGRectMake(COORD, 64, 480, M_SCREEN_HEIGHT-64)style:UITableViewStylePlain];
    rightView.delegate = self;
    rightView.dataSource = self;
    rightView.tag = 101;
    rightView.rowHeight = 250;
    [rightView registerClass:[pragueTableViewCell class] forCellReuseIdentifier:@"cell_1"];
    
    [self.view addSubview:rightView];
    
    
    _rightView = [[UIView alloc] initWithFrame:CGRectMake(1024, 0, 1024-64/2, 768)];
    _rightView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_rightView];
    
    [self  RightView];
    
}

//右侧弹出View
-(void)RightView{
    
    _tableVIew = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, COORD, 768)];
    
    _tableVIew.delegate = self;
//    _tableVIew.dataSource = self;
//    _tableVIew.tag = 102;
    [_tableVIew registerClass:[RightTableViewCell class] forCellReuseIdentifier:@"cell_2"];
    _tableVIew.rowHeight = 200;
    [_rightView addSubview:_tableVIew];
    
    
    
    
    
}

//bool isOk;
-(void)loadPullView{
    [leftIndex removeAllObjects];
    [rightIndex removeAllObjects];
    for (PgItems *itmes in _baseClass.data.items) {
        if (itmes.component.pics == nil) {
            [leftIndex addObject:itmes];
            colHeight[0] += 125;
        }else{
            int index = colHeight[0] <= colHeight[1]?0:1;
            colHeight[index] += 250;
            
            if (index == 0) {
            [leftIndex addObject:itmes];
            }else{
                [rightIndex addObject: itmes];
            }
        }
    }
    
    [leftView reloadData];
    
    [rightView reloadData];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag == 100) {
        return leftIndex.count;
    }
    else if (tableView.tag == 101)
    {
        return rightIndex.count;
    }
    else
    {
        return 100;
    }
   
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  //    if (!cell) {
//        cell = [[pragueTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell_1"];
//    }
    
    if (tableView.tag == 100)
    {
        pragueTableViewCell *cell = (pragueTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell_1" forIndexPath:indexPath];
        cell.items = leftIndex[indexPath.row];
        return cell;
    }else if(tableView.tag == 101)
    {
        pragueTableViewCell *cell = (pragueTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell_1" forIndexPath:indexPath];
        cell.items = rightIndex[indexPath.row];
        return cell;
    }
    else
    {
        RightTableViewCell *cell = (RightTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell_2" forIndexPath:indexPath];
        
//        if (!cell) {
//            cell = [[RightTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell_2"];
        
        return cell;
        

        //遍历大的
//        for (NSMutableArray * items in [_dataBase objectForKey:@"items"] ) {
//            NSLog(@"====123123213===%d",items.count);
//            
//            //遍历里面的数组
//            for (NSDictionary * dict in items[indexPath.row]) {
//                
//                //数组中字典的内容
//                for (NSDictionary * componentDict  in [dict objectForKey:@"component"]){
//                    
//                    cell.userLable.text = [componentDict objectForKey:@"userName"];
//                    [cell.userImage sd_setImageWithURL:[dict objectForKey:@"userAvatar"]];
//                    
//                    
//                    
//                }
//                
//            }
//            
//            
//        }
        
    
    }
    
}



#pragma mark - UIScrollViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    PgItems *item = [[PgItems alloc] init];
    
    if (tableView.tag == 100) {
        
        item = leftIndex[indexPath.row];
        if (item.component.pics == nil) {
            return 125;
        }else{
            return 250;
        }
    }else{
        item = rightIndex[indexPath.row];
        if (item.component.pics == nil) {
            return 125;
        }else{
            return 250;
        }
    }
    

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if (scrollView ==_tableVIew) {
        
        return;
        //         [_tableVIew setContentOffset:scrollView.contentOffset];
    }
    
    if (scrollView == leftView) {
        //左边动，就让右边跟着动
        [rightView setContentOffset:scrollView.contentOffset];
    }else{
        //右动，左跟着动
        [leftView setContentOffset:scrollView.contentOffset];
    }
    
    
    
    
    
    
    
    
   

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
    if (tableView.tag==100||tableView.tag==101)
    {
        PgItems * item = _baseClass.data.items[indexPath.row];
        
        NSString * pgAction = item.component.componentIdentifier;
        NSLog(@"-------%@",pgAction);
        
        AFHTTPRequestOperationManager * managerH = [AFHTTPRequestOperationManager manager];
        
        NSString *urlStr = [NSString stringWithFormat:@"http://api2.hichao.com/new_forum/thread?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=76C1368B-3957-4F8B-AB72-17981A0654C4&gs=768x1024&gos=8.1&access_token=&thread_id=%@&flag=&state=0",pgAction];
        
        
        [managerH GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            _dataBase = [responseObject objectForKey:@"data"];
            
            
            
            [_tableVIew reloadData];
            // NSLog(@"%@",responseObject);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            
        }];
        
        
        
        
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        //    UIControl *control = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        UIControl *control = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, COORD+64, 768)];
        control.alpha = 0.0f;
        control.backgroundColor = [UIColor blackColor];
        [window addSubview:control];
        [control release];
        [control addTarget:self action:@selector(rmBannerView:) forControlEvents:UIControlEventTouchUpInside];
        [window bringSubviewToFront:_rightView];
        
        [UIView animateWithDuration:0.5 animations:^{
            control.alpha = 0.5f;
            _rightView.frame =CGRectMake(COORD, 0, COORD, 768);
        }];

    }
    
    
}
- (void)rmBannerView:(UIControl *)control{
    [UIView animateWithDuration:0.5 animations:^{
        _rightView.frame =CGRectMake(1024, 0, COORD, 768);
        control.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [control removeFromSuperview];
    }];
}


     
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//http://api2.hichao.com/new_forum/threads?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=76C1368B-3957-4F8B-AB72-17981A0654C4&gs=768x1024&gos=8.1&access_token=&category_id=&type=latest&flag=


//http://api2.hichao.com/new_forum/thread?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=76C1368B-3957-4F8B-AB72-17981A0654C4&gs=768x1024&gos=8.1&access_token=&thread_id=125478&flag=&state=0

//http://api2.hichao.com/new_forum/thread?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=76C1368B-3957-4F8B-AB72-17981A0654C4&gs=768x1024&gos=8.1&access_token=&thread_id=124797&flag=&state=0



@end
