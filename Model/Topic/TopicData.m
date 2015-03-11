//
//  TopicData.m
//
//  Created by zhiyou3g  on 15/3/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "TopicData.h"
#import "TopicShareAction.h"
#import "TopicItems.h"


NSString *const kTopicDataId = @"id";
NSString *const kTopicDataPrevId = @"prevId";
NSString *const kTopicDataNextId = @"nextId";
NSString *const kTopicDataTitle = @"title";
NSString *const kTopicDataShareAction = @"shareAction";
NSString *const kTopicDataNextTitle = @"nextTitle";
NSString *const kTopicDataCollectionCount = @"collectionCount";
NSString *const kTopicDataCommentCount = @"commentCount";
NSString *const kTopicDataAppApi = @"appApi";
NSString *const kTopicDataPrevTitle = @"prevTitle";
NSString *const kTopicDataDateTime = @"dateTime";
NSString *const kTopicDataItems = @"items";


@interface TopicData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TopicData

@synthesize dataIdentifier = _dataIdentifier;
@synthesize prevId = _prevId;
@synthesize nextId = _nextId;
@synthesize title = _title;
@synthesize shareAction = _shareAction;
@synthesize nextTitle = _nextTitle;
@synthesize collectionCount = _collectionCount;
@synthesize commentCount = _commentCount;
@synthesize appApi = _appApi;
@synthesize prevTitle = _prevTitle;
@synthesize dateTime = _dateTime;
@synthesize items = _items;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.dataIdentifier = [self objectOrNilForKey:kTopicDataId fromDictionary:dict];
            self.prevId = [self objectOrNilForKey:kTopicDataPrevId fromDictionary:dict];
            self.nextId = [self objectOrNilForKey:kTopicDataNextId fromDictionary:dict];
            self.title = [self objectOrNilForKey:kTopicDataTitle fromDictionary:dict];
            self.shareAction = [TopicShareAction modelObjectWithDictionary:[dict objectForKey:kTopicDataShareAction]];
            self.nextTitle = [self objectOrNilForKey:kTopicDataNextTitle fromDictionary:dict];
            self.collectionCount = [self objectOrNilForKey:kTopicDataCollectionCount fromDictionary:dict];
            self.commentCount = [self objectOrNilForKey:kTopicDataCommentCount fromDictionary:dict];
            self.appApi = [self objectOrNilForKey:kTopicDataAppApi fromDictionary:dict];
            self.prevTitle = [self objectOrNilForKey:kTopicDataPrevTitle fromDictionary:dict];
            self.dateTime = [self objectOrNilForKey:kTopicDataDateTime fromDictionary:dict];
    NSObject *receivedTopicItems = [dict objectForKey:kTopicDataItems];
    NSMutableArray *parsedTopicItems = [NSMutableArray array];
    if ([receivedTopicItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedTopicItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedTopicItems addObject:[TopicItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedTopicItems isKindOfClass:[NSDictionary class]]) {
       [parsedTopicItems addObject:[TopicItems modelObjectWithDictionary:(NSDictionary *)receivedTopicItems]];
    }

    self.items = [NSArray arrayWithArray:parsedTopicItems];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataIdentifier forKey:kTopicDataId];
    [mutableDict setValue:self.prevId forKey:kTopicDataPrevId];
    [mutableDict setValue:self.nextId forKey:kTopicDataNextId];
    [mutableDict setValue:self.title forKey:kTopicDataTitle];
    [mutableDict setValue:[self.shareAction dictionaryRepresentation] forKey:kTopicDataShareAction];
    [mutableDict setValue:self.nextTitle forKey:kTopicDataNextTitle];
    [mutableDict setValue:self.collectionCount forKey:kTopicDataCollectionCount];
    [mutableDict setValue:self.commentCount forKey:kTopicDataCommentCount];
    [mutableDict setValue:self.appApi forKey:kTopicDataAppApi];
    [mutableDict setValue:self.prevTitle forKey:kTopicDataPrevTitle];
    [mutableDict setValue:self.dateTime forKey:kTopicDataDateTime];
    NSMutableArray *tempArrayForItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.items) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kTopicDataItems];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.dataIdentifier = [aDecoder decodeObjectForKey:kTopicDataId];
    self.prevId = [aDecoder decodeObjectForKey:kTopicDataPrevId];
    self.nextId = [aDecoder decodeObjectForKey:kTopicDataNextId];
    self.title = [aDecoder decodeObjectForKey:kTopicDataTitle];
    self.shareAction = [aDecoder decodeObjectForKey:kTopicDataShareAction];
    self.nextTitle = [aDecoder decodeObjectForKey:kTopicDataNextTitle];
    self.collectionCount = [aDecoder decodeObjectForKey:kTopicDataCollectionCount];
    self.commentCount = [aDecoder decodeObjectForKey:kTopicDataCommentCount];
    self.appApi = [aDecoder decodeObjectForKey:kTopicDataAppApi];
    self.prevTitle = [aDecoder decodeObjectForKey:kTopicDataPrevTitle];
    self.dateTime = [aDecoder decodeObjectForKey:kTopicDataDateTime];
    self.items = [aDecoder decodeObjectForKey:kTopicDataItems];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataIdentifier forKey:kTopicDataId];
    [aCoder encodeObject:_prevId forKey:kTopicDataPrevId];
    [aCoder encodeObject:_nextId forKey:kTopicDataNextId];
    [aCoder encodeObject:_title forKey:kTopicDataTitle];
    [aCoder encodeObject:_shareAction forKey:kTopicDataShareAction];
    [aCoder encodeObject:_nextTitle forKey:kTopicDataNextTitle];
    [aCoder encodeObject:_collectionCount forKey:kTopicDataCollectionCount];
    [aCoder encodeObject:_commentCount forKey:kTopicDataCommentCount];
    [aCoder encodeObject:_appApi forKey:kTopicDataAppApi];
    [aCoder encodeObject:_prevTitle forKey:kTopicDataPrevTitle];
    [aCoder encodeObject:_dateTime forKey:kTopicDataDateTime];
    [aCoder encodeObject:_items forKey:kTopicDataItems];
}

- (id)copyWithZone:(NSZone *)zone
{
    TopicData *copy = [[TopicData alloc] init];
    
    if (copy) {

        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.prevId = [self.prevId copyWithZone:zone];
        copy.nextId = [self.nextId copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.shareAction = [self.shareAction copyWithZone:zone];
        copy.nextTitle = [self.nextTitle copyWithZone:zone];
        copy.collectionCount = [self.collectionCount copyWithZone:zone];
        copy.commentCount = [self.commentCount copyWithZone:zone];
        copy.appApi = [self.appApi copyWithZone:zone];
        copy.prevTitle = [self.prevTitle copyWithZone:zone];
        copy.dateTime = [self.dateTime copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
    }
    
    return copy;
}


@end
