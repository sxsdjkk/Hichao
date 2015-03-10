//
//  SelectedLeftViewController.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "SelectedLeftViewController.h"

@interface SelectedLeftViewController ()
{
    SLIDMBaseClass *_baseClass;
}
@end

@implementation SelectedLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = M_LIGHT_GRAY_COLOR;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSString *urlStr = @"http://api2.hichao.com/hotwords?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=&type=item&version=";
    
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        _baseClass = [SLIDMBaseClass modelObjectWithDictionary:responseObject];
        
        
        
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, 240, M_SCREEN_HEIGHT-64)];
        collectionView.backgroundColor = M_LIGHT_GRAY_COLOR;
        
        [self.view addSubview:collectionView];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
