//
//  FeaturesViewController.h
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeaturesViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate>
{
    TopicsBaseClass *_topicsBaseClass;
    NSMutableArray *_topicsItemsArray;
    UICollectionView *_collectionView;
}
@property (nonatomic,copy) NSString *subject;

@end
