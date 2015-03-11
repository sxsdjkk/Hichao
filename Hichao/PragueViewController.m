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

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        leftIndex = [[NSMutableArray array] retain];
        rightIndex = [[NSMutableArray array] retain];
        colHeight[0] = 0.0f;
        colHeight[1] = 0.0f;
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = M_GRAY_COLOR;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage alloc] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithWhite:53/255.0 alpha:1.0];
    
    UINavigationBar *nav = [[UINavigationBar alloc] init];
    [nav setBackgroundColor:M_GRAY_COLOR];
    [self.view addSubview:nav];
    [nav release];
    
    self.title = @"全部";

    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    NSString * url = @"http://api2.hichao.com/new_forum/threads?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=76C1368B-3957-4F8B-AB72-17981A0654C4&gs=768x1024&gos=8.1&access_token=&flag=";
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        _baseClass = [PgBaseClass modelObjectWithDictionary:responseObject];
        
        [self loadPullView];
        
        [leftView reloadData];
        [rightView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
    }];
    
    leftView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, COORD, M_SCREEN_HEIGHT-64)style:UITableViewStylePlain];
    leftView.delegate = self;
    leftView.dataSource = self;
    leftView.tag = 100;

    leftView.rowHeight = 250;
    
    [leftView registerClass:[pragueTableViewCell class] forCellReuseIdentifier:@"cell_1"];
    [self.view addSubview:leftView];
    
    rightView = [[UITableView alloc] initWithFrame:CGRectMake(COORD, 64, 480, M_SCREEN_HEIGHT-64)style:UITableViewStylePlain];
    rightView.delegate = self;
    rightView.dataSource = self;
    rightView.tag = 101;
    rightView.rowHeight = 250;
    [rightView registerClass:[pragueTableViewCell class] forCellReuseIdentifier:@"cell_1"];
    
    [self.view addSubview:rightView];
    
}

bool isOk;
-(void)loadPullView{
    for (PgItems *itmes in _baseClass.data.items) {
        if (itmes.component.pics == nil) {
            [leftIndex addObject:itmes];
            colHeight[0] += 125;
        }else{
            int index = colHeight[0] <= colHeight[1]?0:1;
            colHeight[index] += 250;
            
            if (index == 0) {
            [leftIndex addObject:itmes];
            }else{
                [rightIndex addObject: itmes];
            }
        }
    }
    
    [leftView reloadData];
    [rightView reloadData];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag == 100) {
        return leftIndex.count;
    }
    return rightIndex.count;
   
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    pragueTableViewCell *cell = (pragueTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    if (!cell) {
        cell = [[pragueTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell_1"];
    }
    
    if (tableView.tag == 100) {
        cell.items = leftIndex[indexPath.row];
    }else{
        cell.items = rightIndex[indexPath.row];
    }

    return cell;
}



#pragma mark - UIScrollViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    
    PgItems *item = [[PgItems alloc] init];
    
    if (tableView.tag == 100) {
        
        item = leftIndex[indexPath.row];
        if (item.component.pics == nil) {
            return 125;
        }else{
            return 250;
        }
    }else{
        item = rightIndex[indexPath.row];
        if (item.component.pics == nil) {
            return 125;
        }else{
            return 250;
        }
    }
    

}
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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    PgItems * item = _baseClass.data.items[indexPath.row];
    
    NSString * pgAction = item.component.componentIdentifier;
    
    
    AFHTTPRequestOperationManager * managerH = [AFHTTPRequestOperationManager manager];
    
    NSString *urlStr = [NSString stringWithFormat:@"http://api2.hichao.com/new_forum/thread?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=76C1368B-3957-4F8B-AB72-17981A0654C4&gs=768x1024&gos=8.1&access_token=&thread_id=%@&flag=&state=0",pgAction];
    
    
    [managerH GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
       
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
    }];

    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//http://api2.hichao.com/new_forum/threads?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=76C1368B-3957-4F8B-AB72-17981A0654C4&gs=768x1024&gos=8.1&access_token=&category_id=&type=latest&flag=


//http://api2.hichao.com/new_forum/thread?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=76C1368B-3957-4F8B-AB72-17981A0654C4&gs=768x1024&gos=8.1&access_token=&thread_id=125478&flag=&state=0

//http://api2.hichao.com/new_forum/thread?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=76C1368B-3957-4F8B-AB72-17981A0654C4&gs=768x1024&gos=8.1&access_token=&thread_id=124797&flag=&state=0



@end
