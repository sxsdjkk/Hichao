//
//  SelectedLeftViewController.h
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDMenuController;

@interface SelectedLeftViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,assign) DDMenuController *menuController;

@end
