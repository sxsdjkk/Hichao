//
//  TopicData.h
//
//  Created by zhiyou3g  on 15/3/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TopicShareAction;

@interface TopicData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, strong) NSString *prevId;
@property (nonatomic, strong) NSString *nextId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) TopicShareAction *shareAction;
@property (nonatomic, strong) NSString *nextTitle;
@property (nonatomic, strong) NSString *collectionCount;
@property (nonatomic, strong) NSString *commentCount;
@property (nonatomic, strong) NSString *appApi;
@property (nonatomic, strong) NSString *prevTitle;
@property (nonatomic, strong) NSString *dateTime;
@property (nonatomic, strong) NSArray *items;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
