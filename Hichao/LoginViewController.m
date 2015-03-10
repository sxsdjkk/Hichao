//
//  LoginViewController.m
//  Hichao
//
//  Created by Tz101 on 15/3/9.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = M_GRAY_COLOR;
    self.view.frame = CGRectMake(0, 0, 500, 400);
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, 500, 20)];
    label.text = @"----------  请选择登录方式  ----------";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    UIButton *weiboLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    weiboLogin.frame = CGRectMake(80, 180, 85, 85);
    [weiboLogin setImage:[UIImage imageNamed:@"icon_login_weibo"] forState:UIControlStateNormal];
    [weiboLogin addTarget:self action:@selector(weiboLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:weiboLogin];
}

- (void)weiboLogin{
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, 500, 400)];
    NSURL *url = [NSURL URLWithString:@"http://auth.hichao.com/connect/weibo/authorize"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
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
