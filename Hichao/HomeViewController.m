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
#define iCarousel_Height 250.0f

#import "HomeViewController.h"
#import <FXImageView.h>
#import "PullViewCell.h"
#import "SelectedViewController.h"


@interface HomeViewController ()

@end

@implementation HomeViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        _hasCarousel = YES;
        _baseUrlString = @"http://api2.hichao.com/stars?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=&category=全部&flag=&lts=&pin=";
        
        _subject = @"全部";
        _categoryArray = [[NSArray alloc] initWithObjects:@"全部", @"热门榜", @"猜你喜欢", nil];
        _segmentItemsArray = [[NSArray alloc] initWithObjects:@"最新", @"最热", @"猜你喜欢", nil];
        
        _waterFlowItemsArray = [[NSMutableArray alloc] initWithCapacity:0];
        
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
    [_categoryArray release];
    
    [_tableView1Index release];
    [_tableView2Index release];
    [_tableView3Index release];
    [_tableView4Index release];
    
    [_segmentControll release];
    self.carousel = nil;
}
#pragma mark - View Life Cycle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (_hasCarousel) {
        if (!_scrollTimer) {
            _scrollTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scrollCarousel) userInfo:nil repeats:YES];
        }
    }
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
//    _scrollTimer = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = M_GRAY_COLOR;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage alloc] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    
    UINavigationBar *nav = [[UINavigationBar alloc] init];
    [nav setBackgroundColor:M_GRAY_COLOR];
    [self.view addSubview:nav];
    [nav release];
    
    UIImageView *line = [[UIImageView alloc] init];
    line.backgroundColor = [UIColor lightGrayColor];
    line.alpha = .5;
    line.frame = CGRectMake(0, 63, self.view.frame.size.width, 1);
    [self.view addSubview:line];
    [line release];

    //创建UI
    [self createTitle];
    [self createSegmentControll];
    [self createScrollView];
    [self createTableView];
    if (_hasCarousel) {
        [self requestBanner];
        [self createCoverFlow];
    }
    [self createCategoryTitlebar];
    //开始第一次下拉刷新
    [self firstFresh];
    
    //右边视图
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    _homeRightVC = [[HomeRightViewController alloc] init];
    _homeRightVC.view.frame = _homeRightVC.hideFrame;
    [window addSubview:_homeRightVC.view];
    
    //右边视图
    _featuresRightVC = [[FeaturesRightViewController alloc] init];
    _featuresRightVC.view.frame = _featuresRightVC.hideFrame;
    [window addSubview:_featuresRightVC.view];
}
- (void)firstFresh{
    [_scrollView.pullToRefreshView startAnimating];
    [self requestWithCategory:_categoryArray[_segmentControll.selectedSegmentIndex]];
}

#pragma mark - Create UI
- (void)reloadView{
    NSLog(@"%@",_subject);
    if ([_subject isEqualToString:@"全部"]) {
        if (!_hasCarousel) {
            [self createCoverFlow];
            [_titleLabel removeFromSuperview];
            self.navigationItem.titleView = _segmentControll;
            _hasCarousel = YES;
        }
    }else if (![_subject isEqualToString:@"全部"]) {
        NSString *query = _subject;
        if ([_subject hasPrefix:@"搜索"]) {
            query = [[_subject componentsSeparatedByString:@"搜索"] lastObject];
        }
        if (_hasCarousel) {
            [_carousel removeFromSuperview];
            self.navigationItem.title = query;
            _hasCarousel = NO;
            [self createTitle];
        }
        _titleLabel.text = query;
    }
    [self cleanDataSource];
    [_scrollView.pullToRefreshView startAnimating];
    [self requestWithCategory:_categoryArray[_segmentControll.selectedSegmentIndex]];
}
- (void)createTitle{
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.frame = CGRectMake(0, 0, 300, 35);
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.tintColor = M_PINK_COLOR;
    self.navigationItem.titleView = _titleLabel;
    [_titleLabel release];
}
- (void)createSegmentControll{
    //选项卡 刷新瀑布流
    _segmentControll = [[UISegmentedControl alloc] initWithItems:_segmentItemsArray];
    _segmentControll.frame = CGRectMake(0, 0, 600, 35);
    _segmentControll.tintColor = M_PINK_COLOR;
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

- (void)createScrollView{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)];
    _scrollView.delegate = self;
    //下拉刷新
    [_scrollView addPullToRefreshWithActionHandler:^{
        [self pullToRefreshWithActionHandler];
    }];
    //上拉加载
    [_scrollView addInfiniteScrollingWithActionHandler:^{
        [self infiniteScrollingActionHandler];
    }];
    _scrollView.showsVerticalScrollIndicator = YES;
    [self.view addSubview:_scrollView];
    [_scrollView release];
}
- (void)createTableView{
    for (int i=0; i<4; i++) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(8+238*i, 0, 230, 705) style:UITableViewStyleGrouped];
        tableView.backgroundColor = M_GRAY_COLOR;
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.scrollEnabled = NO;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.tag = i+41;
        
     
        [tableView registerClass:[PullViewCell class] forCellReuseIdentifier:@"cell"];
        [_scrollView addSubview:tableView];
        [tableView release];
    }
}
- (void)createCoverFlow{
    //开启循环
    _wrap = YES;
    //create carousel
    _carousel = [[iCarousel alloc] initWithFrame:CGRectMake(0, -10, 960, iCarousel_Height)];
//    _carousel.backgroundColor = self.view.backgroundColor;
    //        _carousel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _carousel.type = iCarouselTypeCoverFlow;
    _carousel.delegate = self;
    _carousel.dataSource = self;
    
    //add carousel to view
    [_scrollView addSubview:_carousel];
    [_carousel release];
}
- (void)scrollCarousel {
    if (_hasCarousel) {
        NSInteger newIndex=self.carousel.currentItemIndex+1;
        if (newIndex > self.carousel.numberOfItems) {
            newIndex=0;
        }
        
        [self.carousel scrollToItemAtIndex:newIndex duration:0.5];
    }
}
#pragma mark - Request Data
- (void)cleanDataSource{
    [_waterFlowBaseClass release];
    _waterFlowBaseClass = nil;
    [_waterFlowItemsArray removeAllObjects];
    [_tableView1Index removeAllObjects];
    [_tableView2Index removeAllObjects];
    [_tableView3Index removeAllObjects];
    [_tableView4Index removeAllObjects];
    colHeight[0] = 0;
    colHeight[1] = 0;
    colHeight[2] = 0;
    colHeight[3] = 0;
}
- (void)pullToRefreshWithActionHandler{
    [self cleanDataSource];
    [self requestWithCategory:_categoryArray[_segmentControll.selectedSegmentIndex]];
}
- (void)infiniteScrollingActionHandler{
    [self requestWithCategory:_categoryArray[_segmentControll.selectedSegmentIndex]];
}
- (void)segmentValueChanged:(UISegmentedControl *)sender{
    [self cleanDataSource];
    [_scrollView.pullToRefreshView startAnimating];
    [self requestWithCategory:_categoryArray[sender.selectedSegmentIndex]];
}
- (void)requestWithCategory:(NSString *)sender{
    NSString *category;
    if ([_subject isEqualToString:@"全部"]) {
        category = sender;
    }else{
        category = _subject;
    }
    NSString *urlString = [NSString stringWithFormat:@"http://api2.hichao.com/stars?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=&category=%@&flag=%@&lts=&pin=",category,_waterFlowBaseClass.data.flag];
    if (_waterFlowBaseClass.data.flag == nil) {
        urlString = [NSString stringWithFormat:@"http://api2.hichao.com/stars?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=&category=%@&flag=&lts=&pin=",category];
    }
    if ([_subject hasPrefix:@"搜索"]) {
        NSString *query = [[_subject componentsSeparatedByString:@"搜索"] lastObject];
        urlString = [NSString stringWithFormat:@"http://api2.hichao.com/search?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=&crop=1&type=star&query=%@&more_items=1&flag=%@&lts=&pin=",query,_waterFlowBaseClass.data.flag];
        if (_waterFlowBaseClass.data.flag == nil) {
            urlString = [NSString stringWithFormat:@"http://api2.hichao.com/search?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=&crop=1&type=star&query=%@&more_items=1&flag=&lts=&pin=",query];
        }
    }
    NSLog(@"\n\n urlString == %@",urlString);
    //汉字转码
    urlString = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)urlString, NULL, NULL, kCFStringEncodingUTF8);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //瀑布流数据源
        _waterFlowBaseClass = [[WaterFlowBaseClass alloc] initWithDictionary:responseObject];
        [_waterFlowItemsArray addObjectsFromArray:_waterFlowBaseClass.data.items];
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
    
    int imageIndex = 0; //记录当前索引
    
    for (WaterFlowItems *waterFlowItem in _waterFlowItemsArray) {
        if (waterFlowItem.component.picUrl) {
            //固定宽计算高
            float width = waterFlowItem.width.floatValue;
            float height = waterFlowItem.height.floatValue;
            height = waterFlowItem.height.floatValue * height / width + 100;
            
            int minIndex = 0; //存放最低高
            
            //排序算法
            
            /*
            for (int i=0; i<4; i++) {
                if (minHeight>=colHeight[i]) {
                    minHeight = colHeight[i];
                    minIndex = i;
                }
            }
            */
            /*
            minIndex = 0;
            if (colHeight[0] > colHeight[1]) {
                minIndex = 1;
                if (colHeight[1] > colHeight[2]) {
                    minIndex = 2;
                    if (colHeight[2] > colHeight[3]) {
                        minIndex = 3;
                    }
                }
            }
             */
            minIndex = colHeight[0] <= colHeight[1]?0:1;
            minIndex = colHeight[minIndex] <= colHeight[2]?minIndex:2;
            minIndex = colHeight[minIndex] <= colHeight[3]?minIndex:3;
            
            colHeight[minIndex] += height;
            
            //将当前的索引添加到相应的数组中。
            switch (minIndex) {
                case 0:
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
        }
        imageIndex++;
    }
//    NSLog(@"\n%@\n%@\n%@\n%@",_tableView1Index,_tableView2Index,_tableView3Index,_tableView4Index);
    //找到最高的tableView
    float tableViewMaxHeight = 0.0f;
    for (int i = 0; i < 4 ; i++)
    {
        UITableView *tableView = (UITableView *)[_scrollView viewWithTag:i+41];
        [tableView reloadData];
        // 获取表的内容大小 再赋给_ScrollView
        if (tableViewMaxHeight <tableView.contentSize.height) {
            tableViewMaxHeight = tableView.contentSize.height;
        }
    }
    _scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, tableViewMaxHeight+64);
    //停止刷新动画
    [_scrollView.pullToRefreshView stopAnimating];
    [_scrollView.infiniteScrollingView stopAnimating];
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 5;
    return cell;
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    UIControl *control = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    control.alpha = 0.0f;
    control.backgroundColor = [UIColor blackColor];
    [window addSubview:control];
    [control release];
    [control addTarget:self action:@selector(rmBlackView:) forControlEvents:UIControlEventTouchUpInside];

    [window bringSubviewToFront:_homeRightVC.view];
    
    //传值
    _homeRightVC.waterFlowItemsArray = _waterFlowItemsArray;
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
    _homeRightVC.currentItem = item;
    
    if (!_hasCarousel&&(![self isKindOfClass:[SelectedViewController class]]))
    {
        _homeRightVC.contentType = ContentTypeNormal;
        [_homeRightVC createItemView];
        
    }else if (item.component.description)
    {
        _homeRightVC.contentType = ContentTypeNormal;
        [_homeRightVC createScrollView];
    }else{
        //tuanVC
    }

    [UIView animateWithDuration:0.5 animations:^{
        _homeRightVC.view.frame = _homeRightVC.showFrame;
        control.alpha = 0.5f;
    }];
}

- (void)rmBlackView:(UIControl *)control{
    [UIView animateWithDuration:0.5 animations:^{
        _homeRightVC.view.frame = _homeRightVC.hideFrame;
        control.alpha = 0.5f;
    } completion:^(BOOL finished) {
        [control removeFromSuperview];
        [_homeRightVC.scrollView removeFromSuperview];
    }];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    //必须返回一个不为0的高度，否则默认高度
    return _hasCarousel?iCarousel_Height:8.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int imageIndex = 0;
    
    float newHeight = 100.0f;
    
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
    
    height = tableView.bounds.size.width * height / width;
    
    return height+newHeight;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    float y = scrollView.contentOffset.y;
    
    if (y< 0) {
        return;
    }
    for (UIView * view in scrollView.subviews)
    {
        
        if ([view isKindOfClass:[UITableView class]])
        {
            UITableView * tview =(UITableView *)view;
            //判断最多拉到下边的高度
            float maxHeight =tview.contentSize.height-tview.frame.size.height;
            if (y>= (maxHeight))
            {
                continue;// 一个break语句只向外跳一层。
                // continue语句的作用是跳过循环本中剩余的语句而强行执行下一次循环。continue语句只用在for、while、do-while等循环体中,常与if条件语句一起使用,用来加速循环
            }
            //            NSLog(@"tableoffset---->%@",NSStringFromCGPoint(tview.contentOffset));
            
            tview.contentOffset= scrollView.contentOffset;
            // 对表的 y 值进行修改 让其始终保持一致
            tview.frame = CGRectMake(tview.frame.origin.x,y, tview.frame.size.width, tview.frame.size.height);
        }
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
#pragma mark - iCarouselDelegate
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    UIControl *control = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    control.alpha = 0.0f;
    control.backgroundColor = [UIColor blackColor];
    [window addSubview:control];
    [control release];
    [control addTarget:self action:@selector(rmBannerView:) forControlEvents:UIControlEventTouchUpInside];
    
    [window bringSubviewToFront:_featuresRightVC.view];
    
    BannerItems *item = _bannerItemsArray[index];
    _featuresRightVC.topicId = item.component.action.bannerId.intValue;
    [_featuresRightVC reloadView];
    [UIView animateWithDuration:0.5 animations:^{
        control.alpha = 0.5f;
        _featuresRightVC.view.frame = _featuresRightVC.showFrame;
    }];
}
- (void)rmBannerView:(UIControl *)control{
    [UIView animateWithDuration:0.5 animations:^{
        _featuresRightVC.view.frame = _featuresRightVC.hideFrame;
        control.alpha = 0.5f;
    } completion:^(BOOL finished) {
        [control removeFromSuperview];
    }];
}

@end
