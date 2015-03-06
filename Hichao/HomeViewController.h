//
//  iCarouselViewController.h
//  hichao
//
//  Created by Tz101 on 15/3/5.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iCarousel.h>
#import "WaterFlowViewController.h"

@interface HomeViewController : UIViewController <iCarouselDataSource,iCarouselDelegate>
{
    NSArray *_bannerItemsArray;
    WaterFlowViewController *_waterFlow;
}
@property (nonatomic, strong) iCarousel *carousel;
@property (nonatomic, strong) UINavigationItem *navItem;
@property (nonatomic, assign) BOOL wrap;
@property (nonatomic, strong) NSMutableArray *items;

@end
