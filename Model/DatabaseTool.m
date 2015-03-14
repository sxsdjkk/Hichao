//
//  DatabaseTool.m
//  Hichao
//
//  Created by Tz101 on 15/3/13.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import "DatabaseTool.h"

static FMDatabase *__db;

@implementation DatabaseTool

+ (void)initDatabse{
    NSString *databasePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/database.sqlite"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:databasePath]) {
        [[NSFileManager defaultManager] createFileAtPath:databasePath contents:nil attributes:nil];
    }
    if (!__db) {
        __db = [[FMDatabase alloc] initWithPath:databasePath];
    }
    [__db setShouldCacheStatements:YES];
}

+ (void)createTable{
    if ([__db open]) {
        NSString *sql = @"CREATE TABLE IF NOT EXISTS collection(PRIMART KEY INTERGER id,TEXT actionType,TEXT picUrl)";
        [__db executeUpdate:sql];
        [__db close];
    }
}

+ (void)insertItemWithId:(int)identifer and:(NSString *)actionType and:(NSString *)picUrl{
    if ([__db open]) {
        NSString *sql = [NSString stringWithFormat:@"INSERT INTO collection(%d,'%@','%@')",identifer,actionType,picUrl];
        [__db executeUpdate:sql];
    }
}

+ (People *)selectId:(NSString *)identifer{
    if ([__db open]) {
        NSString *sql = [NSString stringWithFormat:@"SELECT * FROM collection WHERE id=%d",identifer.intValue];
        FMResultSet *set = [__db executeQuery:sql];
        [set next];
        People *p = [[People alloc] initWithId:[set intForColumn:@"id"] withType:[set stringForColumn:@"actionType"] with:[set stringForColumn:@"picUrl"]];
        [set close];
        [__db close];
        return p;
    }else{
        return nil;
    }
}

+ (NSArray *)selectAllIds{
    if ([__db open]) {
        NSString *sql = @"SELECT id FROM collection";
        FMResultSet *set = [__db executeQuery:sql];
        NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
        while ([set next]) {
            People *p = [[People alloc] initWithId:[set intForColumn:@"id"] withType:[set stringForColumn:@"actionType"] with:[set stringForColumn:@"picUrl"]];
            [array addObject:p];
            [p release];
        }
        [set close];
        [__db close];
        return array;
    }else{
        return @[];
    }
}

- (void)dealloc {
    [__db release];
    [super dealloc];
}

@end
