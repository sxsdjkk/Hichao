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
#import <SVPullToRefresh.h>
#import "PullViewCell.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        _tableView1Index = [[NSMutableArray alloc] init];
        _tableView2Index = [[NSMutableArray alloc] init];
        _tableView3Index = [[NSMutableArray alloc] init];
        _tableView4Index = [[NSMutableArray alloc] init];

        colHeight[0] = 0.0f;
        colHeight[1] = 0.0f;
        colHeight[2] = 0.0f;
        colHeight[3] = 0.0f;
    }
    return self;
}
- (void)dealloc{
    [super dealloc];
    [_tableView1Index release];
    [_tableView2Index release];
    [_tableView3Index release];
    [_tableView4Index release];
    
    [_tableView1 release];

    [_segmentControll release];
}
#pragma mark - View Life Cycle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (!_scrollTimer) {
        _scrollTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scrollCarousel) userInfo:nil repeats:YES];
    }
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
//    _scrollTimer = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //239 240 233
    self.view.backgroundColor = [UIColor colorWithRed:239/255.0 green:240/255.0 blue:233/255.0 alpha:1.0];

    UINavigationBar *nav = [[UINavigationBar alloc] init];
    [nav setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:nav];
    [nav release];
    //请求数据
    [self requestBanner];

    //创建UI
    [self createSegmentControll];
    [self createTableView];
    [self createCoverFlow];
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
    self.navigationController.navigationBar.tintColor = [UIColor colorWithWhite:53/255.0 alpha:1.0];
    //[UIColor colorWithRed:239/255.0 green:46/255.0 blue:130/255.0 alpha:1.0];
}

- (void)showLeftView
{
    
}

- (void)createTableView{
    _tableView1 = [[[UITableView alloc] initWithFrame:CGRectMake(8+238*0, 64, 230, 705) style:UITableViewStyleGrouped] autorelease];
    _tableView1.dataSource = self;
    _tableView1.delegate = self;
    [self.view addSubview:_tableView1];
    
    _tableView2 = [[[UITableView alloc] initWithFrame:CGRectMake(8+238*1, 64, 230, 705) style:UITableViewStyleGrouped] autorelease];
    _tableView2.dataSource = self;
    _tableView2.delegate = self;
    [self.view addSubview:_tableView2];
    
    _tableView3 = [[[UITableView alloc] initWithFrame:CGRectMake(8+238*2, 64, 230, 705) style:UITableViewStyleGrouped] autorelease];
    _tableView3.dataSource = self;
    _tableView3.delegate = self;
    [self.view addSubview:_tableView3];
    
    _tableView4 = [[[UITableView alloc] initWithFrame:CGRectMake(8+238*3, 64, 230, 705) style:UITableViewStyleGrouped] autorelease];
    _tableView4.dataSource = self;
    _tableView4.delegate = self;
    [self.view addSubview:_tableView4];
    
    
//    _tableView1.sectionHeaderHeight = 260;
//    _tableView2.sectionHeaderHeight = 260;
//    _tableView3.sectionHeaderHeight = 260;
//    _tableView4.sectionHeaderHeight = 260;
    
    _tableView1.showsVerticalScrollIndicator = NO;
    _tableView2.showsVerticalScrollIndicator = NO;
    _tableView3.showsVerticalScrollIndicator = NO;
    _tableView4.showsVerticalScrollIndicator = NO;
    
    _tableView1.tag = 41;
    _tableView2.tag = 42;
    _tableView3.tag = 43;
    _tableView4.tag = 44;
    
    [_tableView1 registerClass:[PullViewCell class] forCellReuseIdentifier:@"cell"];
    [_tableView2 registerClass:[PullViewCell class] forCellReuseIdentifier:@"cell"];
    [_tableView3 registerClass:[PullViewCell class] forCellReuseIdentifier:@"cell"];
    [_tableView4 registerClass:[PullViewCell class] forCellReuseIdentifier:@"cell"];
    
}
- (void)createCoverFlow{
    //开启循环
    _wrap = YES;
    //create carousel
    _carousel = [[iCarousel alloc] initWithFrame:CGRectMake(0, 62, 960, 260)];
//    _carousel.backgroundColor = self.view.backgroundColor;
    //        _carousel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _carousel.type = iCarouselTypeCoverFlow;
    _carousel.delegate = self;
    _carousel.dataSource = self;
    
    //add carousel to view
    [self.view addSubview:_carousel];
    [_carousel release];
}
-(void) scrollCarousel {
    NSInteger newIndex=self.carousel.currentItemIndex+1;
    if (newIndex > self.carousel.numberOfItems) {
        newIndex=0;
    }
    
    [self.carousel scrollToItemAtIndex:newIndex duration:0.5];
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
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //瀑布流数据源
        _waterFlowBaseClass = [[WaterFlowBaseClass alloc] initWithDictionary:responseObject];
        _waterFlowItemsArray = _waterFlowBaseClass.data.items;
        //刷新4个TableView
        [self tableViewsReloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}
- (void)requestBanner{
    NSString *banner = @"http://api2.hichao.com/banner?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:banner parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //banner数据源
        _bannerBaseClass = [[BannerBaseClass alloc] initWithDictionary:responseObject];
        _bannerItemsArray = _bannerBaseClass.data.items;
        //刷新旋转木马
        [_carousel reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}
- (void)tableViewsReloadData{
    [_tableView1Index removeAllObjects];
    [_tableView2Index removeAllObjects];
    [_tableView3Index removeAllObjects];
    [_tableView4Index removeAllObjects];
    
    int imageIndex = 0; //记录当前索引
    
    for (WaterFlowItems *waterFlowItem in _waterFlowItemsArray) {
        if (!waterFlowItem.component.picUrl) {
            continue;
        }
        float width;
        float height = waterFlowItem.height.floatValue;
        //固定宽计算高
        width = _tableView1.bounds.size.width;
        height = width * height / width;
        
        int minIndex = 0; //存放最低高
        
        float col1=MIN(colHeight[0], colHeight[1]);
        float col2=MIN(colHeight[2], colHeight[3]);
        
        float minHeight=MIN(col1, col2);
        
//        float minHeight = colHeight[0];
        for (int i=0; i<4; i++) {
            if (colHeight[i]==minHeight) {
                minHeight = colHeight[i];
                minIndex = i; //记录这个最低高在一维数组中的索引
            }
        }
        colHeight[minIndex] += height;
        
        //将当前的索引添加到相应的数组中。
        switch (minIndex) {
            case 0:
                NSLog(@"%d",imageIndex);
                [_tableView1Index addObject:[NSNumber numberWithInt:imageIndex]];
                break;
            case 1:
                [_tableView2Index addObject:[NSNumber numberWithInt:imageIndex]];
                break;
            case 2:
                [_tableView3Index addObject:[NSNumber numberWithInt:imageIndex]];
                break;
            case 3:
                [_tableView4Index addObject:[NSNumber numberWithInt:imageIndex]];
                break;
            default:
                break;
        }
        imageIndex++;
    }
    
    [_tableView1 reloadData];
    [_tableView2 reloadData];
    [_tableView3 reloadData];
    [_tableView4 reloadData];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (tableView.tag) {
        case 41:
            return _tableView1Index.count;
            break;
        case 42:
            return _tableView2Index.count;
            break;
        case 43:
            return _tableView3Index.count;
            break;
        case 44:
            return _tableView4Index.count;
            break;
        default:
            return 0;
            break;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PullViewCell *cell = (PullViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    int index;
    switch (tableView.tag) {
        case 41:
            index = [_tableView1Index[indexPath.row] intValue];
            break;
        case 42:
            index = [_tableView2Index[indexPath.row] intValue];
            break;
        case 43:
            index = [_tableView3Index[indexPath.row] intValue];
            break;
        case 44:
            index = [_tableView4Index[indexPath.row] intValue];
            break;
        default:
            index = 0;
            break;
    }
    WaterFlowItems *item = _waterFlowItemsArray[index];
    cell.items = item;
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 275;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int imageIndex = 0;
    
    float newHeight = 44.0f;
    
    switch (tableView.tag) {
        case 41:
            imageIndex = [_tableView1Index[indexPath.row] intValue];
            break;
        case 42:
            imageIndex = [_tableView2Index[indexPath.row] intValue];
            break;
        case 43:
            imageIndex = [_tableView3Index[indexPath.row] intValue];
            break;
        case 44:
            imageIndex = [_tableView4Index[indexPath.row] intValue];
            break;
        default:
            break;
    }
    WaterFlowItems *waterFlowItem = _waterFlowItemsArray[imageIndex];
    float width = waterFlowItem.width.floatValue;
    float height = waterFlowItem.height.floatValue;
    
    height = _tableView1.bounds.size.width * height / width;
    
    return height+newHeight;
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //同步滚动
    _tableView1.contentOffset = scrollView.contentOffset;
    _tableView2.contentOffset = scrollView.contentOffset;
    _tableView3.contentOffset = scrollView.contentOffset;
    _tableView4.contentOffset = scrollView.contentOffset;
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
        FXImageView *imageView = [[[FXImageView alloc] initWithFrame:CGRectMake(0, 0, 460.0f, 200.0f)] autorelease];
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
