//
//  SettingsViewController.h
//  Hichao
//
//  Created by Tz101 on 15/3/9.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UINavigationController <UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_titleArray;
    NSArray *_imageNameArray;
}
@property (nonatomic,assign)CGRect showFrame;
@property (nonatomic,assign)CGRect hideFrame;

@end
