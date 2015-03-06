//
//  WaterFlowViewController.h
//  Hichao
//
//  Created by Tz101 on 15/3/6.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaterFlowViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    //用4个tableView实现瀑布流
    UITableView *_tableView1;
    UITableView *_tableView2;
    UITableView *_tableView3;
    UITableView *_tableView4;
}
@end
