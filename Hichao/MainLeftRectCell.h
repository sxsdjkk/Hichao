//
//  MainLeftRectCell.h
//  Hichao
//
//  Created by sxsdjkk on 15/3/9.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainLeftRectCell : UICollectionViewCell
{
    UIImageView *_accessoryView;
}

@property (nonatomic,retain)UIImageView *titleImageView;

@property (nonatomic,retain)UILabel *textLabel;

@end
