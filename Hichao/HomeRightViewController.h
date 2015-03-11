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
    ContentTypeSelected = 0,
    ContentTypeNormal,
};


@interface HomeRightViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic,assign)CGRect showFrame;
@property (nonatomic,assign)CGRect hideFrame;

@property (nonatomic,assign)NSMutableArray *waterFlowItemsArray;
@property (nonatomic,assign)WaterFlowItems *currentItem;

@property (nonatomic,assign)UIScrollView *scrollView;


- (instancetype)initWithContentType:(ContentType)type andCurrentItem:(WaterFlowItems *)item;

- (void)createItemView;
- (void)createScrollView;

@end
