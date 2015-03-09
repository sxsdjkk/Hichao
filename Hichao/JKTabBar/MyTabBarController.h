//
//  MyTabBarController.h
//  CustomTabbarTest
//
//  Created by king on 9/13/14.
//  Copyright (c) 2014 king. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewController.h"

@interface MyTabBarController : UIViewController
{
    UIImageView *_tabBarBackgroundImageView;
    
    UITabBarController *_tabBarController;
    
    UIImageView *_indicatorView;
    
    SettingsViewController *_settingsVC;
    
    UINavigationController *_settingNav;
}

- (void)showTabBar;

- (void)hiddenTabBar;

@end
