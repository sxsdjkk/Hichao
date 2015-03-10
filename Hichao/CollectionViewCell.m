//
//  CollectionViewCell.m
//  Hichao
//
//  Created by mac on 15/3/8.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

-(id)initWithFrame:(CGRect)frame{
    
 self = [super initWithFrame:frame];
    
    if (self) {
       
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 14, 224, 222)];
        [self addSubview:self.imageView];
        
        self.upImageView = [[UIImageView alloc] initWithFrame:CGRectMake(27, 8, 33, 22)];
        [self addSubview:self.upImageView];
        
        
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 243, 220, 22)];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.titleLabel];
        
        
       
        self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(41, 268, 69, 25)];
        self.priceLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.priceLabel];
        self.origLabel = [[UILabel alloc] initWithFrame:CGRectMake(118, 270, 70, 21)];
        self.origLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.origLabel];
        
        
        self.disCountImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 302, 70, 30)];
        [self addSubview:self.disCountImage];
        self.disCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 309, 50, 17)];
        self.disCountLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.disCountLabel];
        
        
        self.peopleImage = [[UIImageView alloc] initWithFrame:CGRectMake(90, 306, 20, 20)];
        [self addSubview:self.peopleImage];
        self.peopleLabel = [[UILabel alloc] initWithFrame:CGRectMake(108, 305, 42, 21)];
        self.peopleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.peopleLabel];
        
        self.tuanButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.tuanButton.frame = CGRectMake(149, 297, 82, 30);
        [self addSubview:self.tuanButton];
        
        
        
    }
    
    
    return self;
    
}
    
    
    


@end
