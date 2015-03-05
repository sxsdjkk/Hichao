//
//  MyTabBarController.m
//  CustomTabbarTest
//
//  Created by king on 9/13/14.
//  Copyright (c) 2014 king. All rights reserved.
//

#import "MyTabBarController.h"
#import "JKRecentViewController.h"
#import "JKQworldViewController.h"
#import "JKBuddyTableViewController.h"


#define M_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define M_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


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
        self.tabBar.hidden = YES;

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    _itemTitleArray = [NSArray arrayWithObjects:@"消息",@"联系人",@"动态", nil];
    
    _itemImgAray = [NSArray arrayWithObjects:[UIImage imageNamed:@"tab_recent_nor@3x"],[UIImage imageNamed:@"tab_buddy_nor@3x"],[UIImage imageNamed:@"tab_qworld_nor@3x"], nil];
    
    _itemSelectedImgArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"tab_recent_press@3x"],[UIImage imageNamed:@"tab_buddy_press@3x"],[UIImage imageNamed:@"tab_qworld_press@3x"], nil];
    
    JKRecentViewController *recentVC = [[JKRecentViewController alloc] init];
    UINavigationController *recentNav = [[UINavigationController alloc] initWithRootViewController:recentVC];

    
//    JKBuddyViewController *buddyVC = [[JKBuddyViewController alloc] init];
//    UINavigationController *buddyNav = [[UINavigationController alloc] initWithRootViewController:buddyVC];
    
    JKBuddyTableViewController *buddyVC = [[JKBuddyTableViewController alloc]init];
    UINavigationController *buddyNav = [[UINavigationController alloc] initWithRootViewController:buddyVC];
    

    JKQworldViewController *qworldVC = [[JKQworldViewController alloc] init];
    UINavigationController *qworldNav = [[UINavigationController alloc] initWithRootViewController:qworldVC];
    
    NSArray *navArray = [NSArray arrayWithObjects:recentNav,buddyNav,qworldNav, nil];

    [self setViewControllers:navArray animated:YES];

    [self myTabBar];
    
    //手势
    
//    UIGestureRecognizer
//    UITapGestureRecognizer* singleRecognizer;
//    
//    singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapFrom)];
//    
//    singleRecognizer.numberOfTapsRequired = 1; // 单击
//    
//    [self.view addGestureRecognizer:singleRecognizer];
//    
//    // 双击的 Recognizer
//    UITapGestureRecognizer* doubleRecognizer;
//    doubleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTapFrom)];
//    doubleRecognizer.numberOfTapsRequired = 2; // 双击
//    [self.view addGestureRecognizer:doubleRecognizer];
    
    // 关键在这一行，如果双击确定偵測失败才會触发单击
//    [singleRecognizer requireGestureRecognizerToFail:doubleRecognizer];
    
    _rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(rightSwipe)];
    
    _rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:_rightSwipeGestureRecognizer];
    
    
    _leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftSwipe)];
    
    _leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
}

- (void)rightSwipe
{
    NSLog(@"rightSwipe");
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.view.transform = CGAffineTransformMakeScale(0.75, 0.75);
        
        self.view.center = CGPointMake(365,M_SCREEN_HEIGHT/2);
        
        [self.view removeGestureRecognizer:_rightSwipeGestureRecognizer];
        
        [self.view addGestureRecognizer:_leftSwipeGestureRecognizer];
    }];
}


- (void)leftSwipe
{
    [UIView animateWithDuration:0.5 animations:^{
        
        self.view.transform = CGAffineTransformIdentity;
        
        self.view.center = CGPointMake(M_SCREEN_WIDTH/2, M_SCREEN_HEIGHT/2);
        
        [self.view removeGestureRecognizer:_leftSwipeGestureRecognizer];
        
        [self.view addGestureRecognizer:_rightSwipeGestureRecognizer];
    }];
}

-(void)handleSingleTapFrom
{
    NSLog(@"handleSingleTapFrom");
}

- (void)handleDoubleTapFrom
{
    NSLog(@"handleDoubleTapFrom");
}

- (void)myTabBar
{
//    创建背景图片
    _tabBarBackgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-49, 320, 49)];
    
//    指定自定义图片
    _tabBarBackgroundImageView.backgroundColor = [UIColor colorWithWhite:0.92 alpha:0.92];
    _tabBarBackgroundImageView.userInteractionEnabled = YES;
    
    [self.view addSubview:_tabBarBackgroundImageView];
    
    int intervalX = 320/3;
    
    for (int i = 0; i < 3; i++)
    {
        UIImageView *titleImage = [[UIImageView alloc] init];
        
        UILabel *_lab = [[UILabel alloc] initWithFrame:CGRectMake((intervalX-64)/2+intervalX*i, 30, 64, 19)];
        
//        NSLog(@"%d",_itemTitleArray.count);
        
        _lab.text = _itemTitleArray[i];
        
        _lab.tag = i+21;
        
        _lab.textAlignment = NSTextAlignmentCenter;
        
        _lab.font = [UIFont systemFontOfSize:10];

        [_tabBarBackgroundImageView addSubview:_lab];
        
        titleImage.frame = CGRectMake((intervalX-30)/2+intervalX*i, 5, 30, 30);
        
        titleImage.tag = i+11;
        
        if (i==0)
        {
            titleImage.image = _itemSelectedImgArray[i];
            
            _lab.textColor = [UIColor colorWithRed:36/255.0 green:163/255.0 blue:232/255.0 alpha:1.0];
        }
        else
        {
            titleImage.image = _itemImgAray[i];
            
            _lab.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
        }

        [_tabBarBackgroundImageView addSubview:titleImage];
        
    }

    for (int i = 0; i < 4; i++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(intervalX*i, 0, intervalX , 49);
        btn.tag = i+1;
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_tabBarBackgroundImageView addSubview:btn];
    }
}
static NSInteger selectBtn = 1;

- (void)btnClick:(UIButton *)button
{
    self.selectedIndex = button.tag-1;
    
    //如果选中和当前的相同的话返回
    if (selectBtn == button.tag) {
        return;
    }
    
    
    
    UIImageView *btn1 = (UIImageView *)[_tabBarBackgroundImageView viewWithTag:button.tag + 10];

    [btn1 setImage:_itemSelectedImgArray[button.tag-1]];
    
    UILabel *titleLabel1 = (UILabel *)[_tabBarBackgroundImageView viewWithTag:button.tag+20];
    
    titleLabel1.textColor = [UIColor colorWithRed:36/255.0 green:163/255.0 blue:232/255.0 alpha:1.0];

    //找到上一个按钮 并且让按钮的高亮状态变成非高亮
    UIImageView *btn = (UIImageView *)[self.view viewWithTag:selectBtn + 10];
    
    btn.image = _itemImgAray[selectBtn-1];
    
    UILabel *titleLabel = (UILabel *)[self.view viewWithTag:selectBtn+20];

    titleLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    
    //记录上一个按钮的值
    selectBtn = button.tag;

}

- (void)showTabBar
{   
    _tabBarBackgroundImageView.hidden = NO;
}

- (void)hiddenTabBar
{
    _tabBarBackgroundImageView.hidden = YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchBegan------------------+++++++");
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchsMoved------------------+++++++");
}

//- (void)closeSideBarWithAnimate:(BOOL)bAnimate complete:(void(^)(BOOL finished))complete
//{
//    CGAffineTransform oriT = CGAffineTransformIdentity;
//    if (bAnimate)
//    {
//        [UIView animateWithDuration:_0.5 animations:^{
//                             _mainContentView.transform = oriT;
//                         }
//                         completion:^(BOOL finished) {
//                             _tapGestureRec.enabled = NO;
//                            
//                             showingLeft=NO;
//                             _MainVC.view.userInteractionEnabled=YES;
//                             complete(finished);
//                         }];
//    }
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
