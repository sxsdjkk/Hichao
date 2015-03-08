//
//  SelectedViewController.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "SelectedViewController.h"

@interface SelectedViewController ()

@end

@implementation SelectedViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        _hasCarousel = NO;
        
        _segmentItemsArray = [[NSArray alloc] initWithObjects:@"推荐", @"值得买", nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
