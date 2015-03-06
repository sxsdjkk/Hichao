//
//  WaterFlowViewController.m
//  Hichao
//
//  Created by Tz101 on 15/3/6.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "WaterFlowViewController.h"

@interface WaterFlowViewController ()

@end

@implementation WaterFlowViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(8+238*0, 340, 230, 420)];
    _tableView1.dataSource = self;
    _tableView1.delegate = self;
    [self.view addSubview:_tableView1];
    
    _tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(8+238*1, 340, 230, 420)];
    _tableView2.dataSource = self;
    _tableView2.delegate = self;
    [self.view addSubview:_tableView2];
    
    _tableView3 = [[UITableView alloc] initWithFrame:CGRectMake(8+238*2, 340, 230, 420)];
    _tableView3.dataSource = self;
    _tableView3.delegate = self;
    [self.view addSubview:_tableView3];
    
    _tableView4 = [[UITableView alloc] initWithFrame:CGRectMake(8+238*3, 340, 230, 420)];
    _tableView4.dataSource = self;
    _tableView4.delegate = self;
    [self.view addSubview:_tableView4];
    
    
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}
#pragma mark - UITableViewDelegate

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //同步滚动
    _tableView1.contentOffset = scrollView.contentOffset;
    _tableView2.contentOffset = scrollView.contentOffset;
    _tableView3.contentOffset = scrollView.contentOffset;
    _tableView4.contentOffset = scrollView.contentOffset;
    
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
