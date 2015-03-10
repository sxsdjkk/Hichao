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
    self.view.backgroundColor = M_GRAY_COLOR;
    self.title = @"设置";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 500, 400)];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.rowHeight = 54;
    [self.view addSubview:tableView];
    [tableView release];

    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    
    UINavigationBar *navBar = [[UINavigationBar alloc] init];
    [navBar setBackgroundColor:M_GRAY_COLOR];
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
    if (indexPath.row == 0) {
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        loginVC.title = @"用户登录";
        [self.navigationController pushViewController:loginVC animated:YES];
        [loginVC release];
    }else if (indexPath.row == 1) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"您没有安装微信" message:@"请安装微信" delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    

}


@end
