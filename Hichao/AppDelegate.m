//
//  AppDelegate.m
//  Hichao
//
//  Created by sxsdjkk on 15/3/4.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTabBarController.h"
#import <TencentOpenAPI/TencentOAuth.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    MyTabBarController *tabBarController = [[MyTabBarController alloc] init];
    
    self.window.rootViewController = tabBarController;
    
    [self performSelectorInBackground:@selector(getConfigOnline) withObject:nil];
    
    [self performSelectorInBackground:@selector(onCheckVersion) withObject:nil];
    
    return YES;
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    return [TencentOAuth HandleOpenURL:url];
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [TencentOAuth HandleOpenURL:url];
}
- (void)getConfigOnline
{
    NSString *urlStr = @"http://api2.hichao.com/config?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=455EE302-DAB0-480E-9718-C2443E900132&gs=768x1024&gos=8.1&access_token=&splash_version=&screen_width=1536&config_version=39&screen_height=2048";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        _configBaseClass = [[MLBaseClass modelObjectWithDictionary:responseObject] retain];
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"configOnline" object:nil];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"网络错误，请检查网络" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        [alert show];
        [alert release];
    }];

}

- (BOOL)isLogedIn
{
    return NO;
}

-(void)onCheckVersion
{
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    
    NSString *currentVersion = [infoDic objectForKey:@"CFBundleVersion"];
    
    NSString *urlStr = [NSString stringWithFormat:@"https://itunes.apple.com/cn/lookup?id=%@",M_APP_ID];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        iTunesLookupBaseClass *iTunesBaseClass = [iTunesLookupBaseClass modelObjectWithDictionary:responseObject];
        
        _iTunesResult = [[iTunesBaseClass.results objectAtIndex:0] retain];
        
        NSString *versionOnAppStore = [_iTunesResult version];
        
        if ([currentVersion isEqualToString:versionOnAppStore])
        {
            return;
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"有新版本更新了" message:_iTunesResult.resultsDescription delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            
            [alert show];
            
            [alert release];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)dealloc
{
    [super dealloc];
    [_configBaseClass release];
    [_iTunesResult release];
}

@end
