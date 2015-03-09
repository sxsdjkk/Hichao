//
//  HomeRightViewController.m
//  Hichao
//
//  Created by Tz101 on 15/3/9.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "HomeRightViewController.h"

@interface HomeRightViewController ()

@end

@implementation HomeRightViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _showFrame = CGRectMake(500, 64, 500, 750);
        _hideFrame = CGRectMake([UIScreen mainScreen].bounds.size.width, _showFrame.origin.y, _showFrame.size.width, _showFrame.size.height);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
}


@end
