//
//  TuanViewController.h
//  Hichao
//
//  Created by sxsdjkk on 15/3/5.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TuanViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>

{
    
    StarBaseClass *      _baseClass;
    
    HStarBaseClass  *    _baseClassH;
    
    
    UITableView *       _laftView;
    UITableView *       _rightView;
    
    StarBaseClass *     _itemsStr;
    
    HStarItems *        _items;
    

    NSString *  _str;

}

@property (nonatomic,strong)UICollectionView *collectionView;

@end
