//
//  TopicsComponent.m
//
//  Created by zhiyou3g  on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "TopicsComponent.h"
#import "TopicsAction.h"


NSString *const kTopicsComponentId = @"id";
NSString *const kTopicsComponentCategory = @"category";
NSString *const kTopicsComponentDescription = @"description";
NSString *const kTopicsComponentTopPicUrl = @"topPicUrl";
NSString *const kTopicsComponentPicUrl = @"picUrl";
NSString *const kTopicsComponentWeekDay = @"weekDay";
NSString *const kTopicsComponentDay = @"day";
NSString *const kTopicsComponentComponentType = @"componentType";
NSString *const kTopicsComponentTitle = @"title";
NSString *const kTopicsComponentAction = @"action";
NSString *const kTopicsComponentCollectionCount = @"collectionCount";
NSString *const kTopicsComponentCommentCount = @"commentCount";
NSString *const kTopicsComponentYear = @"year";
NSString *const kTopicsComponentMonth = @"month";
NSString *const kTopicsComponentV = @"v";


@interface TopicsComponent ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TopicsComponent

@synthesize componentIdentifier = _componentIdentifier;
@synthesize category = _category;
@synthesize componentDescription = _componentDescription;
@synthesize topPicUrl = _topPicUrl;
@synthesize picUrl = _picUrl;
@synthesize weekDay = _weekDay;
@synthesize day = _day;
@synthesize componentType = _componentType;
@synthesize title = _title;
@synthesize action = _action;
@synthesize collectionCount = _collectionCount;
@synthesize commentCount = _commentCount;
@synthesize year = _year;
@synthesize month = _month;
@synthesize v = _v;


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
            self.componentIdentifier = [self objectOrNilForKey:kTopicsComponentId fromDictionary:dict];
            self.category = [self objectOrNilForKey:kTopicsComponentCategory fromDictionary:dict];
            self.componentDescription = [self objectOrNilForKey:kTopicsComponentDescription fromDictionary:dict];
            self.topPicUrl = [self objectOrNilForKey:kTopicsComponentTopPicUrl fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kTopicsComponentPicUrl fromDictionary:dict];
            self.weekDay = [self objectOrNilForKey:kTopicsComponentWeekDay fromDictionary:dict];
            self.day = [self objectOrNilForKey:kTopicsComponentDay fromDictionary:dict];
            self.componentType = [self objectOrNilForKey:kTopicsComponentComponentType fromDictionary:dict];
            self.title = [self objectOrNilForKey:kTopicsComponentTitle fromDictionary:dict];
            self.action = [TopicsAction modelObjectWithDictionary:[dict objectForKey:kTopicsComponentAction]];
            self.collectionCount = [self objectOrNilForKey:kTopicsComponentCollectionCount fromDictionary:dict];
            self.commentCount = [self objectOrNilForKey:kTopicsComponentCommentCount fromDictionary:dict];
            self.year = [self objectOrNilForKey:kTopicsComponentYear fromDictionary:dict];
            self.month = [self objectOrNilForKey:kTopicsComponentMonth fromDictionary:dict];
            self.v = [self objectOrNilForKey:kTopicsComponentV fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.componentIdentifier forKey:kTopicsComponentId];
    [mutableDict setValue:self.category forKey:kTopicsComponentCategory];
    [mutableDict setValue:self.componentDescription forKey:kTopicsComponentDescription];
    [mutableDict setValue:self.topPicUrl forKey:kTopicsComponentTopPicUrl];
    [mutableDict setValue:self.picUrl forKey:kTopicsComponentPicUrl];
    [mutableDict setValue:self.weekDay forKey:kTopicsComponentWeekDay];
    [mutableDict setValue:self.day forKey:kTopicsComponentDay];
    [mutableDict setValue:self.componentType forKey:kTopicsComponentComponentType];
    [mutableDict setValue:self.title forKey:kTopicsComponentTitle];
    [mutableDict setValue:[self.action dictionaryRepresentation] forKey:kTopicsComponentAction];
    [mutableDict setValue:self.collectionCount forKey:kTopicsComponentCollectionCount];
    [mutableDict setValue:self.commentCount forKey:kTopicsComponentCommentCount];
    [mutableDict setValue:self.year forKey:kTopicsComponentYear];
    [mutableDict setValue:self.month forKey:kTopicsComponentMonth];
    [mutableDict setValue:self.v forKey:kTopicsComponentV];

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

    self.componentIdentifier = [aDecoder decodeObjectForKey:kTopicsComponentId];
    self.category = [aDecoder decodeObjectForKey:kTopicsComponentCategory];
    self.componentDescription = [aDecoder decodeObjectForKey:kTopicsComponentDescription];
    self.topPicUrl = [aDecoder decodeObjectForKey:kTopicsComponentTopPicUrl];
    self.picUrl = [aDecoder decodeObjectForKey:kTopicsComponentPicUrl];
    self.weekDay = [aDecoder decodeObjectForKey:kTopicsComponentWeekDay];
    self.day = [aDecoder decodeObjectForKey:kTopicsComponentDay];
    self.componentType = [aDecoder decodeObjectForKey:kTopicsComponentComponentType];
    self.title = [aDecoder decodeObjectForKey:kTopicsComponentTitle];
    self.action = [aDecoder decodeObjectForKey:kTopicsComponentAction];
    self.collectionCount = [aDecoder decodeObjectForKey:kTopicsComponentCollectionCount];
    self.commentCount = [aDecoder decodeObjectForKey:kTopicsComponentCommentCount];
    self.year = [aDecoder decodeObjectForKey:kTopicsComponentYear];
    self.month = [aDecoder decodeObjectForKey:kTopicsComponentMonth];
    self.v = [aDecoder decodeObjectForKey:kTopicsComponentV];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_componentIdentifier forKey:kTopicsComponentId];
    [aCoder encodeObject:_category forKey:kTopicsComponentCategory];
    [aCoder encodeObject:_componentDescription forKey:kTopicsComponentDescription];
    [aCoder encodeObject:_topPicUrl forKey:kTopicsComponentTopPicUrl];
    [aCoder encodeObject:_picUrl forKey:kTopicsComponentPicUrl];
    [aCoder encodeObject:_weekDay forKey:kTopicsComponentWeekDay];
    [aCoder encodeObject:_day forKey:kTopicsComponentDay];
    [aCoder encodeObject:_componentType forKey:kTopicsComponentComponentType];
    [aCoder encodeObject:_title forKey:kTopicsComponentTitle];
    [aCoder encodeObject:_action forKey:kTopicsComponentAction];
    [aCoder encodeObject:_collectionCount forKey:kTopicsComponentCollectionCount];
    [aCoder encodeObject:_commentCount forKey:kTopicsComponentCommentCount];
    [aCoder encodeObject:_year forKey:kTopicsComponentYear];
    [aCoder encodeObject:_month forKey:kTopicsComponentMonth];
    [aCoder encodeObject:_v forKey:kTopicsComponentV];
}

- (id)copyWithZone:(NSZone *)zone
{
    TopicsComponent *copy = [[TopicsComponent alloc] init];
    
    if (copy) {

        copy.componentIdentifier = [self.componentIdentifier copyWithZone:zone];
        copy.category = [self.category copyWithZone:zone];
        copy.componentDescription = [self.componentDescription copyWithZone:zone];
        copy.topPicUrl = [self.topPicUrl copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.weekDay = [self.weekDay copyWithZone:zone];
        copy.day = [self.day copyWithZone:zone];
        copy.componentType = [self.componentType copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.action = [self.action copyWithZone:zone];
        copy.collectionCount = [self.collectionCount copyWithZone:zone];
        copy.commentCount = [self.commentCount copyWithZone:zone];
        copy.year = [self.year copyWithZone:zone];
        copy.month = [self.month copyWithZone:zone];
        copy.v = [self.v copyWithZone:zone];
    }
    
    return copy;
}


@end
