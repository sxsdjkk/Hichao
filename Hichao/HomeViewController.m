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
#import "DataModels.h"

@interface HomeViewController ()
{
    BannerBaseClass *_bannerBaseClass;
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestData];
    //创建UI
    [self createUI];
}

- (void)requestData{
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
- (void)createUI{
    _wrap = YES;
    self.view.backgroundColor = [UIColor lightGrayColor];
    //create carousel
    _carousel = [[iCarousel alloc] initWithFrame:CGRectMake(64, 62, 960, 260)];
    _carousel.backgroundColor = [UIColor whiteColor];
    //        _carousel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _carousel.type = iCarouselTypeCoverFlow;
    _carousel.delegate = self;
    _carousel.dataSource = self;
    
    //add carousel to view
    [self.view addSubview:_carousel];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.carousel = nil;
    
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
//- (CATransform3D)carousel:(iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
//{
//    //implement 'flip3D' style carousel
//    transform = CATransform3DRotate(transform, M_PI / 8.0f, 0.0f, 1.0f, 0.0f);
//    return CATransform3DTranslate(transform, 0.0f, 0.0f, offset * carousel.itemWidth);
//}
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
