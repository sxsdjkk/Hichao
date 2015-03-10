//
//  TopicsAction.m
//
//  Created by zhiyou3g  on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "TopicsAction.h"


NSString *const kTopicsActionCommentCount = @"commentCount";
NSString *const kTopicsActionId = @"id";
NSString *const kTopicsActionTitle = @"title";
NSString *const kTopicsActionActionType = @"actionType";
NSString *const kTopicsActionCollectionCount = @"collectionCount";


@interface TopicsAction ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TopicsAction

@synthesize commentCount = _commentCount;
@synthesize actionIdentifier = _actionIdentifier;
@synthesize title = _title;
@synthesize actionType = _actionType;
@synthesize collectionCount = _collectionCount;


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
            self.commentCount = [self objectOrNilForKey:kTopicsActionCommentCount fromDictionary:dict];
            self.actionIdentifier = [self objectOrNilForKey:kTopicsActionId fromDictionary:dict];
            self.title = [self objectOrNilForKey:kTopicsActionTitle fromDictionary:dict];
            self.actionType = [self objectOrNilForKey:kTopicsActionActionType fromDictionary:dict];
            self.collectionCount = [self objectOrNilForKey:kTopicsActionCollectionCount fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.commentCount forKey:kTopicsActionCommentCount];
    [mutableDict setValue:self.actionIdentifier forKey:kTopicsActionId];
    [mutableDict setValue:self.title forKey:kTopicsActionTitle];
    [mutableDict setValue:self.actionType forKey:kTopicsActionActionType];
    [mutableDict setValue:self.collectionCount forKey:kTopicsActionCollectionCount];

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

    self.commentCount = [aDecoder decodeObjectForKey:kTopicsActionCommentCount];
    self.actionIdentifier = [aDecoder decodeObjectForKey:kTopicsActionId];
    self.title = [aDecoder decodeObjectForKey:kTopicsActionTitle];
    self.actionType = [aDecoder decodeObjectForKey:kTopicsActionActionType];
    self.collectionCount = [aDecoder decodeObjectForKey:kTopicsActionCollectionCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_commentCount forKey:kTopicsActionCommentCount];
    [aCoder encodeObject:_actionIdentifier forKey:kTopicsActionId];
    [aCoder encodeObject:_title forKey:kTopicsActionTitle];
    [aCoder encodeObject:_actionType forKey:kTopicsActionActionType];
    [aCoder encodeObject:_collectionCount forKey:kTopicsActionCollectionCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    TopicsAction *copy = [[TopicsAction alloc] init];
    
    if (copy) {

        copy.commentCount = [self.commentCount copyWithZone:zone];
        copy.actionIdentifier = [self.actionIdentifier copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.actionType = [self.actionType copyWithZone:zone];
        copy.collectionCount = [self.collectionCount copyWithZone:zone];
    }
    
    return copy;
}


@end
