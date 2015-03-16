//
//  People.m
//  Hichao
//
//  Created by Tz101 on 15/3/13.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "People.h"

@implementation People

- (instancetype)initWithId:(int)actionIdentifier withType:(NSString *)actionType with:(NSString *)picUrl{
    self = [super init];
    if (self) {
        self.actionIdentifier = actionIdentifier;
        self.actionType = actionType;
        self.picUrl = picUrl;
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];

    [_actionType release];
    [_picUrl release];
}

@end
