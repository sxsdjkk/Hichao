//
//  iCarouselViewController.h
//  hichao
//
//  Created by Tz101 on 15/3/5.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iCarousel.h>

@interface HomeViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,iCarouselDataSource,iCarouselDelegate>
{
    //顶部选项卡
    UISegmentedControl *_segmentControll;
    
    //用4个tableView实现瀑布流
    UITableView *_tableView1;
    UITableView *_tableView2;
    UITableView *_tableView3;
    UITableView *_tableView4;
    
    //解析Banner
    BannerBaseClass *_bannerBaseClass;
    NSArray *_bannerItemsArray;
    
    //自动滑动
    NSTimer *_scrollTimer;
    
    //解析WaterFlow
    WaterFlowBaseClass *_waterFlowBaseClass;
    NSArray *_waterFlowItemsArray;
}
@property (nonatomic, strong) iCarousel *carousel;
@property (nonatomic, strong) UINavigationItem *navItem;
@property (nonatomic, assign) BOOL wrap;
@property (nonatomic, strong) NSMutableArray *items;

@end
