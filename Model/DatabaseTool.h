//
//  DatabaseTool.h
//  Hichao
//
//  Created by Tz101 on 15/3/13.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB.h>
#import "People.h"

@interface DatabaseTool : NSObject

+ (void)initDatabse;
+ (void)createTable;
+ (void)insertItemWithId:(int)identifer and:(NSString *)actionType and:(NSString *)picUrl;
+ (People *)selectId:(NSString *)identifer;
+ (NSArray *)selectAllIds;

@end
