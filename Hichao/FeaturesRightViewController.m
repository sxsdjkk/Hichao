//
//  FeaturesRightViewController.m
//  Hichao
//
//  Created by Tz101 on 15/3/11.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "FeaturesRightViewController.h"

@interface FeaturesRightViewController ()

@end

@implementation FeaturesRightViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _showFrame = CGRectMake(1024-600, 64, 600, 704);
        _hideFrame = CGRectMake([UIScreen mainScreen].bounds.size.width, _showFrame.origin.y, _showFrame.size.width, _showFrame.size.height);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = M_GRAY_COLOR;
    
}
- (void)requestData{
    NSLog(@"%@",_item.component.componentIdentifier);
    NSString *urlString = [NSString stringWithFormat:@"http://api2.hichao.com/topic?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=&width=482&more_items=1&topic_id=%@&twm=1",_item.component.componentIdentifier];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}


@end
