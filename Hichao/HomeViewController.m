//
//  iCarouselViewController.m
//  hichao
//
//  Created by Tz101 on 15/3/5.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

//CoverFlow 64,62,960,270
//正图 460*200
//原图 640*260

#import "HomeViewController.h"
#import <AFNetworking.h>
#import <UIImageView+WebCache.h>
#import <FXImageView.h>

@interface HomeViewController ()

@end

@implementation HomeViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    //239 240 233
    self.view.backgroundColor = [UIColor colorWithRed:239/255.0 green:240/255.0 blue:233/255.0 alpha:1.0];
    
    UINavigationBar *nav = [[UINavigationBar alloc] init];
    [nav setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:nav];
    
    //请求数据
    [self requestBanner];

    //创建UI
    [self createTableView];
    [self createCoverFlow];
    //最后创建选项卡，使选项卡不被其它控件挡住
    [self createSegmentControll];
    [self createCategoryTitlebar];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.carousel = nil;
}

#pragma mark - Create UI
- (void)createSegmentControll{
    //选项卡 刷新瀑布流
    _segmentControll = [[UISegmentedControl alloc] initWithItems:@[@"最新",@"最热",@"猜你喜欢"]];
    _segmentControll.frame = CGRectMake(0, 0, 600, 35);
    _segmentControll.tintColor = [UIColor colorWithRed:239/255.0 green:46/255.0 blue:130/255.0 alpha:1.0];
    //绑定方法，值改变发送请求
    [_segmentControll addTarget:self action:@selector(segmentValueChanged:) forControlEvents:UIControlEventValueChanged];
    _segmentControll.selectedSegmentIndex = 0;
    //icon_category_titlebar_hover@2x
//    [self.navigationController.navigationBar addSubview:_segmentControll];
    self.navigationItem.titleView = _segmentControll;
}
- (void)createCategoryTitlebar
{
//    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_category_titlebar_hover"] style:UIBarButtonItemStylePlain target:self action:@selector(showLeftView)];
//
//    self.navigationController.navigationItem.leftBarButtonItem = leftItem;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"hhaha" style:UIBarButtonItemStylePlain target:self action:@selector(showLeftView)];
}
- (void)showLeftView{
    NSLog(@"123");
}
- (void)createTableView{
    _tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(8+238*0, 64, 230, 600)];
    _tableView1.dataSource = self;
    _tableView1.delegate = self;
    [self.view addSubview:_tableView1];
    
    _tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(8+238*1, 64, 230, 600)];
    _tableView2.dataSource = self;
    _tableView2.delegate = self;
    [self.view addSubview:_tableView2];
    
    _tableView3 = [[UITableView alloc] initWithFrame:CGRectMake(8+238*2, 64, 230, 600)];
    _tableView3.dataSource = self;
    _tableView3.delegate = self;
    [self.view addSubview:_tableView3];
    
    _tableView4 = [[UITableView alloc] initWithFrame:CGRectMake(8+238*3, 64, 230, 600)];
    _tableView4.dataSource = self;
    _tableView4.delegate = self;
    [self.view addSubview:_tableView4];
    
    _tableView1.sectionHeaderHeight = 260;
    _tableView2.sectionHeaderHeight = 260;
    _tableView3.sectionHeaderHeight = 260;
    _tableView4.sectionHeaderHeight = 260;
}
- (void)createCoverFlow{
    //开启循环
    _wrap = YES;
    //create carousel
    _carousel = [[iCarousel alloc] initWithFrame:CGRectMake(0, 62, 960, 260)];
    _carousel.backgroundColor = [UIColor whiteColor];
    //        _carousel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _carousel.type = iCarouselTypeCoverFlow;
    _carousel.delegate = self;
    _carousel.dataSource = self;
    
    //add carousel to view
    [self.view addSubview:_carousel];
}

#pragma mark - Request Data
- (void)segmentValueChanged:(UISegmentedControl *)sender{
    NSArray *categoryArray = @[@"全部",@"热门榜",@"猜你喜欢"];
    [self requestWithCategory:categoryArray[sender.selectedSegmentIndex]];
}
- (void)requestWithCategory:(NSString *)category{
    NSString *urlString = [NSString stringWithFormat:@"http://api2.hichao.com/stars?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=&category=%@&flag=&lts=1425470373&pin=124371",category];
    //汉字转码
    urlString = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)urlString, NULL, NULL, kCFStringEncodingUTF8);
    NSLog(@"%@",urlString);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}
- (void)requestBanner{
    NSString *banner = @"http://api2.hichao.com/banner?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:banner parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //准备数据源
        _bannerBaseClass = [[BannerBaseClass alloc] initWithDictionary:responseObject];
        _bannerItemsArray = _bannerBaseClass.data.items;
        //刷新旋转木马
        [_carousel reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}


#pragma mark - UITableViewDataSource
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"123";
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}
#pragma mark - UITableViewDelegate

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //同步滚动
    _tableView1.contentOffset = scrollView.contentOffset;
    _tableView2.contentOffset = scrollView.contentOffset;
    _tableView3.contentOffset = scrollView.contentOffset;
    _tableView4.contentOffset = scrollView.contentOffset;
    NSLog(@"%f",scrollView.contentOffset.y);
    _carousel.frame = CGRectMake(0, 62-scrollView.contentOffset.y, 960, 260);
    if (scrollView.contentOffset.y>=0) {
        //上拉加载
    }else{
        //下拉刷新
    }
    
}


#pragma mark - iCarouselDataSource
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return _bannerItemsArray.count;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        FXImageView *imageView = [[FXImageView alloc] initWithFrame:CGRectMake(0, 0, 460.0f, 200.0f)];
        BannerItems *bannerItem = [_bannerBaseClass.data.items objectAtIndex:index];
        
        NSURL *imgUrl = [NSURL URLWithString:bannerItem.component.picUrl];
        [imageView sd_setImageWithURL:imgUrl];
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.asynchronous = YES;
        imageView.reflectionScale = 0.5f;
        imageView.reflectionAlpha = 0.25f;
        imageView.reflectionGap = 10.0f;
        imageView.shadowOffset = CGSizeMake(0.0f, 2.0f);
        imageView.shadowBlur = 5.0f;
        
        view = imageView;
        view.layer.masksToBounds = YES;
        //圆角
        view.layer.cornerRadius = 8;
        view.backgroundColor = [UIColor whiteColor];
        
        //适应大小
        view.contentMode = UIViewContentModeScaleToFill;
    }
    
    return view;
    
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    //customize carousel display
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            //normally you would hard-code this to YES or NO
            return _wrap;
        }
        case iCarouselOptionSpacing:
        {
            //add a bit of spacing between the item views
            return value * 2.40f;
        }
        case iCarouselOptionTilt:
        {
            //view 的倾斜度   值越大看着越窄
            return 0.8f;
        }
        case iCarouselOptionFadeMax:
        {
            if (carousel.type == iCarouselTypeCustom)
            {
                //set opacity based on distance from camera
                return 0.0f;
            }
            return value;
        }
        case iCarouselOptionArc:
        {
            return 2 * M_PI;
        }
        case iCarouselOptionRadius:
        {
            return value;
        }
        default:
        {
            return value;
        }
    }
}


@end
