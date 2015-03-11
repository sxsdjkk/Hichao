//
//  MyTabBarController.m
//  CustomTabbarTest
//
//  Created by king on 9/13/14.
//  Copyright (c) 2014 king. All rights reserved.
//

#import "MyTabBarController.h"
#import "HomeViewController.h"
#import "SelectedViewController.h"
#import "FeaturesViewController.h"
#import "TuanViewController.h"
#import "PragueViewController.h"
#import "FavoritesViewController.h"

#import "HomeLeftViewController.h"
#import "SelectedLeftViewController.h"
#import "FeaturesLeftViewController.h"
#import "TuanLeftViewController.h"
#import "PragueLeftViewController.h"
#import "FavoritesLeftViewController.h"

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "DDMenuController.h"

#define M_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define M_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//ipad mini 1024*768

@interface MyTabBarController ()
{
    int maxBtnTag;
    
    NSArray *_itemTitleArray;
    
    NSArray *_itemImgAray;
    
    NSArray *_itemSelectedImgArray;
    
    UISwipeGestureRecognizer *_rightSwipeGestureRecognizer;
    
    UISwipeGestureRecognizer *_leftSwipeGestureRecognizer;
}
@end

@implementation MyTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        self.tabBar.hidden = YES;

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _itemTitleArray = [NSArray arrayWithObjects:@"首页",@"精品",@"专题",@"明星团",@"布拉格",@"",@"", nil];
    
    _itemImgAray = [NSArray arrayWithObjects:[UIImage imageNamed:@"nav_btn_home@2x"],[UIImage imageNamed:@"nav_btn_goods@2x"],[UIImage imageNamed:@"nav_btn_topic@2x"],[UIImage imageNamed:@"nav_btn_tuan@2x"],[UIImage imageNamed:@"nav_btn_bbs_tang@2x"],[UIImage imageNamed:@"nav_btn_collect@2x.png"],[UIImage imageNamed:@"nav_btn_set@2x.png"], nil];
    
    _itemSelectedImgArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"nav_btn_home_on@2x"],[UIImage imageNamed:@"nav_btn_goods_on@2x"],[UIImage imageNamed:@"nav_btn_topic_on@2x"],[UIImage imageNamed:@"nav_btn_tuan_on@2x"],[UIImage imageNamed:@"nav_btn_bbs_on_tang@2x"],[UIImage imageNamed:@"nav_btn_collect_on@2x.png"],[UIImage imageNamed:@"nav_btn_set_on@2x.png"], nil];
    
    [self myTabBar];
    
    _tabBarController = [[UITabBarController alloc]init];
    
    _tabBarController.view.frame = CGRectMake(65, 0, M_SCREEN_WIDTH-65, M_SCREEN_HEIGHT);
    
    _tabBarController.tabBar.hidden = YES;
    
    [self.view addSubview:_tabBarController.view];
    

    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    DDMenuController *homeMenuController = [[DDMenuController alloc]initWithRootViewController:homeNav];
    HomeLeftViewController *homeLeftVC = [[HomeLeftViewController alloc] init];
    homeMenuController.leftViewController = homeLeftVC;
    homeLeftVC.menuController = homeMenuController;
    
    
    SelectedViewController *selectedVC = [[SelectedViewController alloc] init];
    UINavigationController *selectedNav = [[UINavigationController alloc] initWithRootViewController:selectedVC];
    DDMenuController *selectedMenuController = [[DDMenuController alloc]initWithRootViewController:selectedNav];
    SelectedLeftViewController *selectedLeftVC = [[SelectedLeftViewController alloc] init];
    selectedMenuController.leftViewController = selectedLeftVC;
    selectedLeftVC.menuController = selectedMenuController;
    
    
    
    
    FeaturesViewController *featuresVC = [[FeaturesViewController alloc] init];
    UINavigationController *featuresNav = [[UINavigationController alloc]initWithRootViewController:featuresVC];
    DDMenuController *featuresMenuController = [[DDMenuController alloc]initWithRootViewController:featuresNav];
    FeaturesLeftViewController *featuresLeftVC = [[FeaturesLeftViewController alloc] init];
    featuresMenuController.leftViewController = featuresLeftVC;
    featuresLeftVC.menuController = featuresMenuController;
    
    
    TuanViewController *tuanVC = [[TuanViewController alloc] init];
//    DDMenuController *tuanMenuController = [[DDMenuController alloc]initWithRootViewController:tuanVC];
    
    
    PragueViewController *pragueVC = [[PragueViewController alloc] init];
    UINavigationController *pragueNav = [[UINavigationController alloc]initWithRootViewController:pragueVC];
    DDMenuController *pragueMenuController = [[DDMenuController alloc]initWithRootViewController:pragueNav];
    PragueLeftViewController *pragueLeftVC = [[PragueLeftViewController alloc] init];
    pragueMenuController.leftViewController = pragueLeftVC;
    pragueLeftVC.menuController = pragueMenuController;
    
    
    FavoritesViewController *favoritesVC = [[FavoritesViewController alloc] init];
    DDMenuController *favoritesMenuController = [[DDMenuController alloc]initWithRootViewController:favoritesVC];
    FavoritesLeftViewController *favoritesLeftVC = [[FavoritesLeftViewController alloc]init];
    favoritesMenuController.leftViewController = favoritesLeftVC;
    
    
    NSArray *menuVCArray = [NSArray arrayWithObjects:homeMenuController,selectedMenuController,featuresMenuController,tuanVC,pragueMenuController,favoritesMenuController, nil];
    
    [_tabBarController setViewControllers:menuVCArray animated:YES];

    _settingsVC = [[SettingsViewController alloc] init];
    _settingNav = [[UINavigationController alloc]initWithRootViewController:_settingsVC];
    _settingNav.view.frame = _settingsVC.hideFrame;
    [self.view addSubview:_settingNav.view];
}


- (void)myTabBar
{
//    创建背景图片
    _tabBarBackgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 65, M_SCREEN_HEIGHT)];
    
//    指定自定义图片
    _tabBarBackgroundImageView.backgroundColor = [UIColor colorWithWhite:0.92 alpha:0.92];
    _tabBarBackgroundImageView.userInteractionEnabled = YES;
    
    [self.view addSubview:_tabBarBackgroundImageView];
    
    for (int i = 0; i < 7; i++)
    {
        UIImageView *titleImage = [[UIImageView alloc] init];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 75+65*i, 65, 20)];
        
        titleLabel.text = _itemTitleArray[i];
        
//        titleLabel.font = [UIFont systemFontOfSize:30];

        // titleLabel的tag为 21，22，23。。。
        titleLabel.tag = i+21;
        
        titleLabel.textAlignment = NSTextAlignmentCenter;
        
        titleLabel.font = [UIFont systemFontOfSize:15];

        [_tabBarBackgroundImageView addSubview:titleLabel];
        
        titleImage.frame = CGRectMake(10, 35+65*i, 45, 45);
        
        
        // titleImage的tag为 11，12，13。。。

        titleImage.tag = i+11;
        
        if (i==0)
        {
            titleImage.image = _itemSelectedImgArray[i];
            
            titleLabel.textColor = [UIColor colorWithRed:239/255.0 green:46/255.0 blue:130/255.0 alpha:1.0];
        }
        else
        {
            titleImage.image = _itemImgAray[i];
            
            titleLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
        }

        [_tabBarBackgroundImageView addSubview:titleImage];
        
        
        if (i>=5)
        {
            titleImage.frame = CGRectMake(15, 5+(M_SCREEN_HEIGHT-150)+45*(i-5), 35, 35);
            titleLabel.hidden = YES;
        }
    }

    
    for (int i = 0; i < 7; i++)
    {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 35+65*i, 65, 65);
        //btn的tag为 1，2，3。。。
        btn.tag = i+1;
        
//        btn.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.4];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_tabBarBackgroundImageView addSubview:btn];
        
        //11*44
        if (i==0)
        {
            _indicatorView = [[UIImageView alloc] initWithFrame:CGRectMake(54, 11+35, 11, 44)];
            _indicatorView.image = [UIImage imageNamed:@"nav_pic_slider_pannel@2x"];
            
            [_tabBarBackgroundImageView addSubview:_indicatorView];

        }
        
        if (i>=5)
        {
            btn.frame = CGRectMake(0, (M_SCREEN_HEIGHT-150)+45*(i-5), 65, 45);
        }
    }
}

- (void)removeSettingsVC:(UIButton *)sender{
    //移除
    [UIView animateWithDuration:0.5 animations:^{
        _settingNav.view.frame = _settingsVC.hideFrame;
        sender.alpha = 0.0f;
    } completion:^(BOOL finished)
    {
        [sender removeFromSuperview];
    }];
}

static NSInteger selectBtn = 1;

- (void)btnClick:(UIButton *)button
{
    
    if (button.tag == 7)
    {
        //展示
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = self.view.frame;
        button.backgroundColor = [UIColor blackColor];
        button.alpha = 0.0f;
        [button addTarget:self action:@selector(removeSettingsVC:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        [self.view bringSubviewToFront:_settingNav.view];
        [UIView animateWithDuration:0.5 animations:^
        {
            _settingNav.view.frame = _settingsVC.showFrame;
            button.alpha = 0.5f;
        }];
        return;
    }

    
    //如果选中和当前的相同的话返回
    if (selectBtn == button.tag)
    {
        return;
    }
    if(button.tag==6)
    {
        AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
        
        if (![delegate isLogedIn])
        {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            button.frame = self.view.frame;
            button.backgroundColor = [UIColor blackColor];
            button.alpha = 0.0f;
            [button addTarget:self action:@selector(removeSettingsVC:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:button];
            [self.view bringSubviewToFront:_settingNav.view];
            
            [UIView animateWithDuration:0.5 animations:^
             {
                 _settingNav.view.frame = _settingsVC.showFrame;
                 button.alpha = 0.5f;
                 LoginViewController *loginVC = [[LoginViewController alloc]init];
                 [_settingNav pushViewController:loginVC animated:YES];
             }];
            return;
        }
    }
    _tabBarController.selectedIndex = button.tag-1;
    
    UIImageView *btn1 = (UIImageView *)[_tabBarBackgroundImageView viewWithTag:button.tag + 10];

    [btn1 setImage:_itemSelectedImgArray[button.tag-1]];
    
    UILabel *titleLabel1 = (UILabel *)[_tabBarBackgroundImageView viewWithTag:button.tag+20];
    
    titleLabel1.textColor = [UIColor colorWithRed:239/255.0 green:46/255.0 blue:130/255.0 alpha:1.0];

    //找到上一个按钮 并且让按钮的高亮状态变成非高亮
    UIImageView *btn = (UIImageView *)[self.view viewWithTag:selectBtn + 10];
    
    btn.image = _itemImgAray[selectBtn-1];
    
    UILabel *titleLabel = (UILabel *)[self.view viewWithTag:selectBtn+20];

    titleLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    
    //记录上一个按钮的值
    selectBtn = button.tag;
    
    [UIView animateWithDuration:0.5 animations:^{
        
        _indicatorView.center = CGPointMake(button.frame.size.width-_indicatorView.frame.size.width/2, button.center.y);
    }];
    
    
    DDMenuController *menuController = [_tabBarController.viewControllers objectAtIndex:button.tag-1];
    
    if ([menuController isKindOfClass:[DDMenuController class]])
    {        
        [menuController showLeftController:YES];
    }
    [self performSelector:@selector(menuControllerShowRootController:) withObject:menuController afterDelay:1.0];
}

- (void)menuControllerShowRootController:(DDMenuController *)menuController
{
    if ([menuController isKindOfClass:[DDMenuController class]])
    {
        [menuController showRootController:YES];
    }
}

- (void)showTabBar
{
    _tabBarBackgroundImageView.hidden = NO;
}

- (void)hiddenTabBar
{
    _tabBarBackgroundImageView.hidden = YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
