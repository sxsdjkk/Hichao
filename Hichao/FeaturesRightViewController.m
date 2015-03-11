//
//  FeaturesRightViewController.m
//  Hichao
//
//  Created by Tz101 on 15/3/11.
//  Copyright (c) 2015年 JK. All rights reserved.
//
#define VIEW_WIDTH 340
#import "FeaturesRightViewController.h"

@interface FeaturesRightViewController ()

@end

@implementation FeaturesRightViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _showFrame = CGRectMake(1024-VIEW_WIDTH, 20, VIEW_WIDTH, 748);
        _hideFrame = CGRectMake([UIScreen mainScreen].bounds.size.width*2, _showFrame.origin.y, _showFrame.size.width, _showFrame.size.height);
        _topicItemsArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = M_GRAY_COLOR;
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 748)];
    _webView.delegate = self;
    _webView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_webView];
}
- (void)reloadView{
    NSString *urlString = [NSString stringWithFormat:@"http://www.hichao.com/share/topic?id=%d",_topicId];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
}
- (void)requestData{
    NSString *urlString = [NSString stringWithFormat:@"http://api2.hichao.com/topic?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=&width=482&more_items=1&topic_id=%d&twm=1",_topicId];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
        TopicBaseClass *topicBaseClass = [[TopicBaseClass alloc] initWithDictionary:responseObject];
        [_topicItemsArray addObjectsFromArray:topicBaseClass.data.items];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}
#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    webView.scrollView.contentOffset = CGPointMake(215, 0);
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    webView.scrollView.contentOffset = CGPointMake(215, 0);
}

@end
