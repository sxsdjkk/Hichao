//
//  People.h
//  Hichao
//
//  Created by Tz101 on 15/3/13.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject

@property (nonatomic, assign) int actionIdentifier;
@property (nonatomic, assign) NSString *actionType;
@property (nonatomic, assign) NSString *picUrl;

- (instancetype)initWithId:(int)actionIdentifier withType:(NSString *)actionType with:(NSString *)picUr;

@end
