//
//  MyTabBarController.h
//  CustomTabbarTest
//
//  Created by king on 9/13/14.
//  Copyright (c) 2014 king. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTabBarController : UITabBarController
{
    UIImageView *_tabBarBackgroundImageView;
}

- (void)showTabBar;

- (void)hiddenTabBar;

@end
