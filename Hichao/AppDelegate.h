//
//  AppDelegate.h
//  Hichao
//
//  Created by sxsdjkk on 15/3/4.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,retain) MLBaseClass *configBaseClass;

@property (nonatomic,retain) iTunesLookupResults *iTunesResult;


- (BOOL)isLogedIn;

@end

