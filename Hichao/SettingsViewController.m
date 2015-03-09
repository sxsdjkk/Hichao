//
//  SettingsViewController.m
//  Hichao
//
//  Created by Tz101 on 15/3/9.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "SettingsViewController.h"
#import "LoginViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _showFrame = CGRectMake(260, 170, 500, 400);
        _hideFrame = CGRectMake([UIScreen mainScreen].bounds.size.width, _showFrame.origin.y, _showFrame.size.width, _showFrame.size.height);
        _titleArray = [[NSArray alloc] initWithObjects:@"登录", @"推荐给微信好友", @"喜欢，就给个评价呗~~~", @"反馈意见，帮我们改进...", @"常见问题", @"清除缓存，可以更快哦！", @"声明", @"升级最新版本", nil];
    }
    return self;
}
- (void)dealloc{
    [super dealloc];
    [_titleArray release];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];

    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, 500, 384)];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    [tableView release];

    CGRect navBarFrame = CGRectMake(0, 0, tableView.frame.size.width, 44.0);
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:navBarFrame];
    UINavigationItem *navItem = [UINavigationItem alloc];
    navItem.title = @"设置";
    [navBar pushNavigationItem:navItem animated:false];
    [navItem release];
    [self.view addSubview:navBar];
    [navBar release];
    
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _titleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"选中了 %d",indexPath.row);
    
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    loginVC.title = @"登录";
    //[self pushViewController:loginVC animated:YES];
    [self.navigationController pushViewController:loginVC animated:YES];
}


@end
