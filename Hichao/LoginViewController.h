//
//  LoginViewController.h
//  Hichao
//
//  Created by Tz101 on 15/3/9.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TencentOpenAPI/TencentOAuth.h>

@interface LoginViewController : UIViewController <TencentSessionDelegate,TencentLoginDelegate>
{
    TencentOAuth *_tencentOAuth;
}
@end
