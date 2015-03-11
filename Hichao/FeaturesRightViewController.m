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
        _showFrame = CGRectMake(1024-VIEW_WIDTH, 64, VIEW_WIDTH, 704);
        _hideFrame = CGRectMake([UIScreen mainScreen].bounds.size.width*2, _showFrame.origin.y, _showFrame.size.width, _showFrame.size.height);
        _topicItemsArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = M_GRAY_COLOR;
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 704)];
    _webView.backgroundColor= [UIColor clearColor];
    _webView.delegate = self;
    [self.view addSubview:_webView];
}
- (void)reloadView{
    NSString *urlString = [NSString stringWithFormat:@"http://www.hichao.com/share/topic?id=%@",_item.component.componentIdentifier];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
}
- (void)requestData{
    NSLog(@"%@",_item.component.componentIdentifier);
    NSString *urlString = [NSString stringWithFormat:@"http://api2.hichao.com/topic?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=&width=482&more_items=1&topic_id=%@&twm=1",_item.component.componentIdentifier];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        TopicBaseClass *topicBaseClass = [[TopicBaseClass alloc] initWithDictionary:responseObject];
        [_topicItemsArray addObjectsFromArray:topicBaseClass.data.items];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}
#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    webView.scrollView.contentOffset = CGPointMake(215, 0);
}

@end
