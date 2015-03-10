//
//  FeaturesLeftViewController.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "FeaturesLeftViewController.h"

@interface FeaturesLeftViewController ()
{
    MLBaseClass *_baseClass;
}
@end

@implementation FeaturesLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //http://api2.hichao.com/config?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=&splash_version=19&screen_width=1536&config_version=39&screen_height=2048
    
    NSString *urlStr = @"http://api2.hichao.com/config?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=&splash_version=19&screen_width=1536&config_version=39&screen_height=2048";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSLog(@"%@",responseObject);
        _baseClass = [MLBaseClass modelObjectWithDictionary:responseObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        
        NSLog(@"%@",error);
    }];
    
}

- (void)creatCollectionView
{
//    uicollec
}


@end
