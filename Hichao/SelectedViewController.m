//
//  SelectedViewController.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "SelectedViewController.h"

@interface SelectedViewController ()

@end

@implementation SelectedViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        self.hasCarousel = NO;
        
        _categoryArray = [[NSArray alloc] initWithObjects:@"selection", @"worthy", nil];
        _segmentItemsArray = [[NSArray alloc] initWithObjects:@"推荐", @"值得买", nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = M_GRAY_COLOR;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage alloc] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    

}
- (void)reloadView{
    //重写reloadView方法
    if ([self.subject isEqualToString:@"全部"])
    {
//        if (!self.hasCarousel) {
//            [self createCoverFlow];
            [_titleLabel removeFromSuperview];
            self.navigationItem.titleView = _segmentControll;
//            _hasCarousel = YES;
//        }
    }else if (![self.subject isEqualToString:@"全部"])
    {
//        if (_hasCarousel) {
//            [_carousel removeFromSuperview];
            self.navigationItem.title = self.subject;
//            _hasCarousel = NO;
            [self createTitle];
//        }
        _titleLabel.text = self.subject;
    }
    [self cleanDataSource];
    [_scrollView.pullToRefreshView startAnimating];
    [self requestWithCategory:self.subject];
}
#pragma mark - Request Data
- (void)requestWithCategory:(NSString *)category{
    
    NSString *urlString = [NSString stringWithFormat:@"http://api2.hichao.com/items?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=&type=%@&flag=%@&more_items=1",category,_waterFlowBaseClass.data.flag];
    if (_waterFlowBaseClass.data.flag == nil) {
        
        urlString = [NSString stringWithFormat:@"http://api2.hichao.com/items?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=&type=%@&flag=&more_items=1",category];
    }
    if (![self.subject isEqualToString:@"全部"]) {
        urlString = [NSString stringWithFormat:@"http://api2.hichao.com/search?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=&type=sku&query=%@&flag=&more_items=1",self.subject];
    }
//    NSLog(@"\n\n urlString == %@",urlString);
    //汉字转码
    urlString = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)urlString, NULL, NULL, kCFStringEncodingUTF8);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@",responseObject);
        _waterFlowBaseClass = [[WaterFlowBaseClass alloc] initWithDictionary:responseObject];
        [_waterFlowItemsArray addObjectsFromArray:_waterFlowBaseClass.data.items];
        //刷新4个TableView
        [self tableViewsReloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}



@end
