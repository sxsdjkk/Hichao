//
//  iCarouselViewController.h
//  hichao
//
//  Created by Tz101 on 15/3/5.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import <UIImageView+WebCache.h>
#import <SVPullToRefresh.h>
#import <iCarousel.h>

@interface HomeViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,iCarouselDataSource,iCarouselDelegate>
{
    BOOL _hasCarousel;
    NSString *_baseUrlString;
    
    NSArray *_categoryArray;
    NSArray *_segmentItemsArray;
    
    //顶部选项卡
    UISegmentedControl *_segmentControll;
    
    //用4个tableView实现瀑布流
    UIScrollView *_scrollView;
    UITableView *_tableView1;
    UITableView *_tableView2;
    UITableView *_tableView3;
    UITableView *_tableView4;
    
    //4个Index
    NSMutableArray *_tableView1Index;
    NSMutableArray *_tableView2Index;
    NSMutableArray *_tableView3Index;
    NSMutableArray *_tableView4Index;
    
    //记录列高度
    float colHeight[4];
    
    //解析Banner
    BannerBaseClass *_bannerBaseClass;
    NSArray *_bannerItemsArray;
    
    //自动滑动
    NSTimer *_scrollTimer;
    
    //解析WaterFlow
    WaterFlowBaseClass *_waterFlowBaseClass;
    NSMutableArray *_waterFlowItemsArray;
}
@property (nonatomic, strong) iCarousel *carousel;
@property (nonatomic, strong) UINavigationItem *navItem;
@property (nonatomic, assign) BOOL wrap;
@property (nonatomic, strong) NSMutableArray *items;

- (void)tableViewsReloadData;
- (void)cleanDataSource;

@end
