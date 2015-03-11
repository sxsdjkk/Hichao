//
//  PragueViewController.h
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "AFHTTPRequestOperationManager.h"

@interface PragueViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

{
    
    PgBaseClass *       _baseClass;
    
    
    UITableView *       leftView;
    UITableView *       rightView;
    
    
     NSMutableArray *leftIndex;
     NSMutableArray *rightIndex;
    
     float colHeight[2];
    
    
    
}
@property (nonatomic,copy) NSString *subject;
@end
