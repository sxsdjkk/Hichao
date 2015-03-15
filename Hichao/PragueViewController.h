//
//  PragueViewController.h
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FeaturesRightViewController.h"

//#import "AFHTTPRequestOperationManager.h"

@interface PragueViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

{
    
    PgBaseClass *       _baseClass;
    
    
    UITableView *       leftView;
    UITableView *       rightView;
    
    
    //右侧弹出
    UITableView *       _tableVIew;
    
    
    

     NSMutableArray *leftIndex;
     NSMutableArray *rightIndex;
    
     float colHeight[2];
    
    
    
     FeaturesRightViewController *_featuresRightVC;
    UIView *        _rightView;
    
}

@property (nonatomic,copy) NSString *subject;

@property (nonatomic,copy) NSString *topicId;

-(void)reloadView;

@end
