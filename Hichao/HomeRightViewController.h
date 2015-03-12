//
//  HomeRightViewController.h
//  Hichao
//
//  Created by Tz101 on 15/3/9.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ContentType)
{
    ContentTypeCarousel  = 0,//旋转木马 和 瀑布流第一项
    ContentTypeNormal,  //瀑布流普通项
    ContentTypeSelected,    //精品页
};


@interface HomeRightViewController : UIViewController <UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,assign)CGRect showFrame;
@property (nonatomic,assign)CGRect hideFrame;

@property (nonatomic,assign)NSMutableArray *waterFlowItemsArray;
@property (nonatomic,assign)WaterFlowItems *currentItem;

@property (nonatomic,assign)UIScrollView *scrollView;

@property (nonatomic,assign)ContentType contentType;



- (instancetype)init;

- (void)createItemView;
- (void)createScrollView;

@end
