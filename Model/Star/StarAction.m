//
//  StarAction.m
//
//  Created by   on 15/3/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "StarAction.h"


NSString *const kStarActionActionType = @"actionType";
NSString *const kStarActionPicUrl = @"picUrl";
NSString *const kStarActionId = @"id";
NSString *const kStarActionPeopleCount = @"peopleCount";
NSString *const kStarActionTitle = @"title";
NSString *const kStarActionQuery = @"query";
NSString *const kStarActionDescription = @"description";
NSString *const kStarActionTuanState = @"tuanState";
NSString *const kStarActionExpires = @"expires";


@interface StarAction ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation StarAction

@synthesize actionType = _actionType;
@synthesize picUrl = _picUrl;
@synthesize actionIdentifier = _actionIdentifier;
@synthesize peopleCount = _peopleCount;
@synthesize title = _title;
@synthesize query = _query;
@synthesize actionDescription = _actionDescription;
@synthesize tuanState = _tuanState;
@synthesize expires = _expires;


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
            self.actionType = [self objectOrNilForKey:kStarActionActionType fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kStarActionPicUrl fromDictionary:dict];
            self.actionIdentifier = [self objectOrNilForKey:kStarActionId fromDictionary:dict];
            self.peopleCount = [self objectOrNilForKey:kStarActionPeopleCount fromDictionary:dict];
            self.title = [self objectOrNilForKey:kStarActionTitle fromDictionary:dict];
            self.query = [self objectOrNilForKey:kStarActionQuery fromDictionary:dict];
            self.actionDescription = [self objectOrNilForKey:kStarActionDescription fromDictionary:dict];
            self.tuanState = [self objectOrNilForKey:kStarActionTuanState fromDictionary:dict];
            self.expires = [self objectOrNilForKey:kStarActionExpires fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.actionType forKey:kStarActionActionType];
    [mutableDict setValue:self.picUrl forKey:kStarActionPicUrl];
    [mutableDict setValue:self.actionIdentifier forKey:kStarActionId];
    [mutableDict setValue:self.peopleCount forKey:kStarActionPeopleCount];
    [mutableDict setValue:self.title forKey:kStarActionTitle];
    [mutableDict setValue:self.query forKey:kStarActionQuery];
    [mutableDict setValue:self.actionDescription forKey:kStarActionDescription];
    [mutableDict setValue:self.tuanState forKey:kStarActionTuanState];
    [mutableDict setValue:self.expires forKey:kStarActionExpires];

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

    self.actionType = [aDecoder decodeObjectForKey:kStarActionActionType];
    self.picUrl = [aDecoder decodeObjectForKey:kStarActionPicUrl];
    self.actionIdentifier = [aDecoder decodeObjectForKey:kStarActionId];
    self.peopleCount = [aDecoder decodeObjectForKey:kStarActionPeopleCount];
    self.title = [aDecoder decodeObjectForKey:kStarActionTitle];
    self.query = [aDecoder decodeObjectForKey:kStarActionQuery];
    self.actionDescription = [aDecoder decodeObjectForKey:kStarActionDescription];
    self.tuanState = [aDecoder decodeObjectForKey:kStarActionTuanState];
    self.expires = [aDecoder decodeObjectForKey:kStarActionExpires];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_actionType forKey:kStarActionActionType];
    [aCoder encodeObject:_picUrl forKey:kStarActionPicUrl];
    [aCoder encodeObject:_actionIdentifier forKey:kStarActionId];
    [aCoder encodeObject:_peopleCount forKey:kStarActionPeopleCount];
    [aCoder encodeObject:_title forKey:kStarActionTitle];
    [aCoder encodeObject:_query forKey:kStarActionQuery];
    [aCoder encodeObject:_actionDescription forKey:kStarActionDescription];
    [aCoder encodeObject:_tuanState forKey:kStarActionTuanState];
    [aCoder encodeObject:_expires forKey:kStarActionExpires];
}

- (id)copyWithZone:(NSZone *)zone
{
    StarAction *copy = [[StarAction alloc] init];
    
    if (copy) {

        copy.actionType = [self.actionType copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.actionIdentifier = [self.actionIdentifier copyWithZone:zone];
        copy.peopleCount = [self.peopleCount copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.query = [self.query copyWithZone:zone];
        copy.actionDescription = [self.actionDescription copyWithZone:zone];
        copy.tuanState = [self.tuanState copyWithZone:zone];
        copy.expires = [self.expires copyWithZone:zone];
    }
    
    return copy;
}


@end
