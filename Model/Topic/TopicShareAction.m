//
//  TopicShareAction.m
//
//  Created by zhiyou3g  on 15/3/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "TopicShareAction.h"
#import "TopicShare.h"


NSString *const kTopicShareActionTrackValue = @"trackValue";
NSString *const kTopicShareActionTypeId = @"typeId";
NSString *const kTopicShareActionActionType = @"actionType";
NSString *const kTopicShareActionType = @"type";
NSString *const kTopicShareActionShare = @"share";


@interface TopicShareAction ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TopicShareAction

@synthesize trackValue = _trackValue;
@synthesize typeId = _typeId;
@synthesize actionType = _actionType;
@synthesize type = _type;
@synthesize share = _share;


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
            self.trackValue = [self objectOrNilForKey:kTopicShareActionTrackValue fromDictionary:dict];
            self.typeId = [self objectOrNilForKey:kTopicShareActionTypeId fromDictionary:dict];
            self.actionType = [self objectOrNilForKey:kTopicShareActionActionType fromDictionary:dict];
            self.type = [self objectOrNilForKey:kTopicShareActionType fromDictionary:dict];
            self.share = [TopicShare modelObjectWithDictionary:[dict objectForKey:kTopicShareActionShare]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.trackValue forKey:kTopicShareActionTrackValue];
    [mutableDict setValue:self.typeId forKey:kTopicShareActionTypeId];
    [mutableDict setValue:self.actionType forKey:kTopicShareActionActionType];
    [mutableDict setValue:self.type forKey:kTopicShareActionType];
    [mutableDict setValue:[self.share dictionaryRepresentation] forKey:kTopicShareActionShare];

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

    self.trackValue = [aDecoder decodeObjectForKey:kTopicShareActionTrackValue];
    self.typeId = [aDecoder decodeObjectForKey:kTopicShareActionTypeId];
    self.actionType = [aDecoder decodeObjectForKey:kTopicShareActionActionType];
    self.type = [aDecoder decodeObjectForKey:kTopicShareActionType];
    self.share = [aDecoder decodeObjectForKey:kTopicShareActionShare];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_trackValue forKey:kTopicShareActionTrackValue];
    [aCoder encodeObject:_typeId forKey:kTopicShareActionTypeId];
    [aCoder encodeObject:_actionType forKey:kTopicShareActionActionType];
    [aCoder encodeObject:_type forKey:kTopicShareActionType];
    [aCoder encodeObject:_share forKey:kTopicShareActionShare];
}

- (id)copyWithZone:(NSZone *)zone
{
    TopicShareAction *copy = [[TopicShareAction alloc] init];
    
    if (copy) {

        copy.trackValue = [self.trackValue copyWithZone:zone];
        copy.typeId = [self.typeId copyWithZone:zone];
        copy.actionType = [self.actionType copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.share = [self.share copyWithZone:zone];
    }
    
    return copy;
}


@end
