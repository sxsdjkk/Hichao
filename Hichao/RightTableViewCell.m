//
//  RightTableViewCell.m
//  Hichao
//
//  Created by mac on 15/3/15.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "RightTableViewCell.h"

@implementation RightTableViewCell

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
      
        self.userImage = [[UIImageView alloc] initWithFrame:CGRectMake(17, 8, 45, 37)];
        self.userLable = [[UILabel alloc] initWithFrame:CGRectMake(82, 8, 42, 21)];
        self.markLable = [[UIImageView alloc] initWithFrame:CGRectMake(158, 9, 39, 26)];
        self.markLable2 = [[UIImageView alloc] initWithFrame:CGRectMake(210, 9, 39, 26)];
        
        self.dateImage = [[UIImageView alloc] initWithFrame:CGRectMake(70, 27, 20, 18)];
        self.dateLable = [[UILabel alloc] initWithFrame:CGRectMake(98, 27, 42, 21)];
        self.floorLable = [[UILabel alloc] initWithFrame:CGRectMake(414, 8, 42, 21)];
        self.contentLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 61, 436, 21)];
        
        self.replyBut = [UIButton buttonWithType:UIButtonTypeSystem];
        _replyBut.frame = CGRectMake(380, 177, 35, 19);
        self.reportLable = [[UILabel alloc] initWithFrame:CGRectMake(433, 176, 35, 19)];
        
        
        
    }
    
    
    return self;
    
}














- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


    
    
}

@end
