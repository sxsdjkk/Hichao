//
//  FeaturesRightViewController.h
//  Hichao
//
//  Created by Tz101 on 15/3/11.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeaturesRightViewController : UIViewController <UIWebViewDelegate>
{
    NSMutableArray *_topicItemsArray;
    UIWebView *_webView;
}
@property (nonatomic,assign)CGRect showFrame;
@property (nonatomic,assign)CGRect hideFrame;

@property (nonatomic,assign)int topicId;

- (void)reloadView;

@end
