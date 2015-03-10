//
//  HomeRightViewController.m
//  Hichao
//
//  Created by Tz101 on 15/3/9.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "HomeRightViewController.h"
#import <UIImageView+WebCache.h>

@interface HomeRightViewController ()

@end

@implementation HomeRightViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _showFrame = CGRectMake(500, 64, 640, 704);
        _hideFrame = CGRectMake([UIScreen mainScreen].bounds.size.width, _showFrame.origin.y, _showFrame.size.width, _showFrame.size.height);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    

}
- (void)createScrollView{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 640, 704)];
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = YES;
    _scrollView.pagingEnabled = YES;
    [self.view addSubview:_scrollView];
    int i = 0;
    for (WaterFlowItems *item in _waterFlowItemsArray) {
        if (item.component.action.normalPicUrl) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(640*i, 0, 640, 704)];
            NSURL *url = [NSURL URLWithString:item.component.action.normalPicUrl];
            [imageView sd_setImageWithURL:url];
            [_scrollView addSubview:imageView];
            imageView.backgroundColor = [UIColor redColor];
            [imageView release];
            if (_currentItem.component.showId == item.component.showId) {
                [_scrollView setContentOffset:CGPointMake(640*i, 0)];
            }
            i++;
        }
    }
    _scrollView.contentSize = CGSizeMake(640*i, 704);
}


@end
