//
//  FeaturesViewController.h
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeaturesRightViewController.h"

@interface FeaturesViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegate>
{
    TopicsBaseClass *_topicsBaseClass;
    NSMutableArray *_topicsItemsArray;
    UICollectionView *_collectionView;
    
    //右边划过来的View
    FeaturesRightViewController *_featuresRightVC;
}
@property (nonatomic,copy) NSString *subject;

- (void)reloadView;

@end
