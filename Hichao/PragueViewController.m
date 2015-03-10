//
//  PragueViewController.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "PragueViewController.h"

@interface PragueViewController ()

@end

@implementation PragueViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
    
    self.navigationController.navigationBar.frame = CGRectMake(0, 0, self.navigationController.navigationBar.frame.size.width, 104);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
