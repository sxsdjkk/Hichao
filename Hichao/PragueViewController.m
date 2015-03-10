//
//  PragueViewController.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "PragueViewController.h"
#import "pragueTableViewCell.h"
@interface PragueViewController ()

@end

#define COORD (1024-64)/2

@implementation PragueViewController


-(void)viewWillAppear:(BOOL)animated{
    
    
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    NSString * url = @"http://api2.hichao.com/new_forum/threads?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=76C1368B-3957-4F8B-AB72-17981A0654C4&gs=768x1024&gos=8.1&access_token=&flag=";
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        _baseClass = [PgBaseClass modelObjectWithDictionary:responseObject];
        
         NSLog(@"%d---",_baseClass.data.items.count);
       // NSLog(@"%@",responseObject);
        
        [leftView reloadData];
        [rightView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
    
    
    
    
    
    
    float height = self.view.frame.size.height;
    leftView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, COORD, height)];
    leftView.delegate = self;
    leftView.dataSource = self;
    leftView.tag = 100;
    leftView.rowHeight = 250;
    
    [leftView registerClass:[pragueTableViewCell class] forCellReuseIdentifier:@"cell_1"];
    [self.view addSubview:leftView];
    
    rightView = [[UITableView alloc] initWithFrame:CGRectMake(COORD, 0, 480, height)];
    rightView.delegate = self;
    rightView.dataSource = self;
    rightView.tag = 101;
    rightView.rowHeight = 250;
    [rightView registerClass:[pragueTableViewCell class] forCellReuseIdentifier:@"cell_1"];
    
    [self.view addSubview:rightView];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _baseClass.data.items.count;
   
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
     pragueTableViewCell *cell = (pragueTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell_1" forIndexPath:indexPath];

    return cell;
}



#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == leftView) {
        //左边动，就让右边跟着动
        [rightView setContentOffset:scrollView.contentOffset];
    }else{
        //右动，左跟着动
        [leftView setContentOffset:scrollView.contentOffset];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
