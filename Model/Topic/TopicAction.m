//
//  TopicAction.m
//
//  Created by zhiyou3g  on 15/3/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "TopicAction.h"


NSString *const kTopicActionActionType = @"actionType";
NSString *const kTopicActionSource = @"source";
NSString *const kTopicActionHeight = @"height";
NSString *const kTopicActionNoSaveButton = @"noSaveButton";
NSString *const kTopicActionId = @"id";
NSString *const kTopicActionWidth = @"width";
NSString *const kTopicActionPicUrl = @"picUrl";
NSString *const kTopicActionSourceId = @"sourceId";
NSString *const kTopicActionType = @"type";
NSString *const kTopicActionCollectionCount = @"collectionCount";


@interface TopicAction ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TopicAction

@synthesize actionType = _actionType;
@synthesize source = _source;
@synthesize height = _height;
@synthesize noSaveButton = _noSaveButton;
@synthesize actionIdentifier = _actionIdentifier;
@synthesize width = _width;
@synthesize picUrl = _picUrl;
@synthesize sourceId = _sourceId;
@synthesize type = _type;
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
            self.actionType = [self objectOrNilForKey:kTopicActionActionType fromDictionary:dict];
            self.source = [self objectOrNilForKey:kTopicActionSource fromDictionary:dict];
            self.height = [self objectOrNilForKey:kTopicActionHeight fromDictionary:dict];
            self.noSaveButton = [self objectOrNilForKey:kTopicActionNoSaveButton fromDictionary:dict];
            self.actionIdentifier = [self objectOrNilForKey:kTopicActionId fromDictionary:dict];
            self.width = [self objectOrNilForKey:kTopicActionWidth fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kTopicActionPicUrl fromDictionary:dict];
            self.sourceId = [self objectOrNilForKey:kTopicActionSourceId fromDictionary:dict];
            self.type = [self objectOrNilForKey:kTopicActionType fromDictionary:dict];
            self.collectionCount = [self objectOrNilForKey:kTopicActionCollectionCount fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.actionType forKey:kTopicActionActionType];
    [mutableDict setValue:self.source forKey:kTopicActionSource];
    [mutableDict setValue:self.height forKey:kTopicActionHeight];
    [mutableDict setValue:self.noSaveButton forKey:kTopicActionNoSaveButton];
    [mutableDict setValue:self.actionIdentifier forKey:kTopicActionId];
    [mutableDict setValue:self.width forKey:kTopicActionWidth];
    [mutableDict setValue:self.picUrl forKey:kTopicActionPicUrl];
    [mutableDict setValue:self.sourceId forKey:kTopicActionSourceId];
    [mutableDict setValue:self.type forKey:kTopicActionType];
    [mutableDict setValue:self.collectionCount forKey:kTopicActionCollectionCount];

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

    self.actionType = [aDecoder decodeObjectForKey:kTopicActionActionType];
    self.source = [aDecoder decodeObjectForKey:kTopicActionSource];
    self.height = [aDecoder decodeObjectForKey:kTopicActionHeight];
    self.noSaveButton = [aDecoder decodeObjectForKey:kTopicActionNoSaveButton];
    self.actionIdentifier = [aDecoder decodeObjectForKey:kTopicActionId];
    self.width = [aDecoder decodeObjectForKey:kTopicActionWidth];
    self.picUrl = [aDecoder decodeObjectForKey:kTopicActionPicUrl];
    self.sourceId = [aDecoder decodeObjectForKey:kTopicActionSourceId];
    self.type = [aDecoder decodeObjectForKey:kTopicActionType];
    self.collectionCount = [aDecoder decodeObjectForKey:kTopicActionCollectionCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_actionType forKey:kTopicActionActionType];
    [aCoder encodeObject:_source forKey:kTopicActionSource];
    [aCoder encodeObject:_height forKey:kTopicActionHeight];
    [aCoder encodeObject:_noSaveButton forKey:kTopicActionNoSaveButton];
    [aCoder encodeObject:_actionIdentifier forKey:kTopicActionId];
    [aCoder encodeObject:_width forKey:kTopicActionWidth];
    [aCoder encodeObject:_picUrl forKey:kTopicActionPicUrl];
    [aCoder encodeObject:_sourceId forKey:kTopicActionSourceId];
    [aCoder encodeObject:_type forKey:kTopicActionType];
    [aCoder encodeObject:_collectionCount forKey:kTopicActionCollectionCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    TopicAction *copy = [[TopicAction alloc] init];
    
    if (copy) {

        copy.actionType = [self.actionType copyWithZone:zone];
        copy.source = [self.source copyWithZone:zone];
        copy.height = [self.height copyWithZone:zone];
        copy.noSaveButton = [self.noSaveButton copyWithZone:zone];
        copy.actionIdentifier = [self.actionIdentifier copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.sourceId = [self.sourceId copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.collectionCount = [self.collectionCount copyWithZone:zone];
    }
    
    return copy;
}


@end
