//
//  WaterFlowComponent.m
//
//  Created by zhiyou3g  on 15/3/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "WaterFlowComponent.h"
#import "WaterFlowAction.h"


NSString *const kWaterFlowComponentAction = @"action";
NSString *const kWaterFlowComponentItemsCount = @"itemsCount";
NSString *const kWaterFlowComponentComponentType = @"componentType";
NSString *const kWaterFlowComponentHasVideo = @"hasVideo";
NSString *const kWaterFlowComponentId = @"id";
NSString *const kWaterFlowComponentPicUrl = @"picUrl";
NSString *const kWaterFlowComponentTrackValue = @"trackValue";
NSString *const kWaterFlowComponentDescription = @"description";
NSString *const kWaterFlowComponentCollectionCount = @"collectionCount";
NSString *const kWaterFlowComponentCommentCount = @"commentCount";


@interface WaterFlowComponent ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WaterFlowComponent

@synthesize action = _action;
@synthesize itemsCount = _itemsCount;
@synthesize componentType = _componentType;
@synthesize hasVideo = _hasVideo;
@synthesize componentIdentifier = _componentIdentifier;
@synthesize picUrl = _picUrl;
@synthesize trackValue = _trackValue;
@synthesize componentDescription = _componentDescription;
@synthesize collectionCount = _collectionCount;
@synthesize commentCount = _commentCount;


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
            self.action = [WaterFlowAction modelObjectWithDictionary:[dict objectForKey:kWaterFlowComponentAction]];
            self.itemsCount = [self objectOrNilForKey:kWaterFlowComponentItemsCount fromDictionary:dict];
            self.componentType = [self objectOrNilForKey:kWaterFlowComponentComponentType fromDictionary:dict];
            self.hasVideo = [self objectOrNilForKey:kWaterFlowComponentHasVideo fromDictionary:dict];
            self.componentIdentifier = [self objectOrNilForKey:kWaterFlowComponentId fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kWaterFlowComponentPicUrl fromDictionary:dict];
            self.trackValue = [self objectOrNilForKey:kWaterFlowComponentTrackValue fromDictionary:dict];
            self.componentDescription = [self objectOrNilForKey:kWaterFlowComponentDescription fromDictionary:dict];
            self.collectionCount = [self objectOrNilForKey:kWaterFlowComponentCollectionCount fromDictionary:dict];
            self.commentCount = [self objectOrNilForKey:kWaterFlowComponentCommentCount fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.action dictionaryRepresentation] forKey:kWaterFlowComponentAction];
    [mutableDict setValue:self.itemsCount forKey:kWaterFlowComponentItemsCount];
    [mutableDict setValue:self.componentType forKey:kWaterFlowComponentComponentType];
    [mutableDict setValue:self.hasVideo forKey:kWaterFlowComponentHasVideo];
    [mutableDict setValue:self.componentIdentifier forKey:kWaterFlowComponentId];
    [mutableDict setValue:self.picUrl forKey:kWaterFlowComponentPicUrl];
    [mutableDict setValue:self.trackValue forKey:kWaterFlowComponentTrackValue];
    [mutableDict setValue:self.componentDescription forKey:kWaterFlowComponentDescription];
    [mutableDict setValue:self.collectionCount forKey:kWaterFlowComponentCollectionCount];
    [mutableDict setValue:self.commentCount forKey:kWaterFlowComponentCommentCount];

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

    self.action = [aDecoder decodeObjectForKey:kWaterFlowComponentAction];
    self.itemsCount = [aDecoder decodeObjectForKey:kWaterFlowComponentItemsCount];
    self.componentType = [aDecoder decodeObjectForKey:kWaterFlowComponentComponentType];
    self.hasVideo = [aDecoder decodeObjectForKey:kWaterFlowComponentHasVideo];
    self.componentIdentifier = [aDecoder decodeObjectForKey:kWaterFlowComponentId];
    self.picUrl = [aDecoder decodeObjectForKey:kWaterFlowComponentPicUrl];
    self.trackValue = [aDecoder decodeObjectForKey:kWaterFlowComponentTrackValue];
    self.componentDescription = [aDecoder decodeObjectForKey:kWaterFlowComponentDescription];
    self.collectionCount = [aDecoder decodeObjectForKey:kWaterFlowComponentCollectionCount];
    self.commentCount = [aDecoder decodeObjectForKey:kWaterFlowComponentCommentCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_action forKey:kWaterFlowComponentAction];
    [aCoder encodeObject:_itemsCount forKey:kWaterFlowComponentItemsCount];
    [aCoder encodeObject:_componentType forKey:kWaterFlowComponentComponentType];
    [aCoder encodeObject:_hasVideo forKey:kWaterFlowComponentHasVideo];
    [aCoder encodeObject:_componentIdentifier forKey:kWaterFlowComponentId];
    [aCoder encodeObject:_picUrl forKey:kWaterFlowComponentPicUrl];
    [aCoder encodeObject:_trackValue forKey:kWaterFlowComponentTrackValue];
    [aCoder encodeObject:_componentDescription forKey:kWaterFlowComponentDescription];
    [aCoder encodeObject:_collectionCount forKey:kWaterFlowComponentCollectionCount];
    [aCoder encodeObject:_commentCount forKey:kWaterFlowComponentCommentCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    WaterFlowComponent *copy = [[WaterFlowComponent alloc] init];
    
    if (copy) {

        copy.action = [self.action copyWithZone:zone];
        copy.itemsCount = [self.itemsCount copyWithZone:zone];
        copy.componentType = [self.componentType copyWithZone:zone];
        copy.hasVideo = [self.hasVideo copyWithZone:zone];
        copy.componentIdentifier = [self.componentIdentifier copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.trackValue = [self.trackValue copyWithZone:zone];
        copy.componentDescription = [self.componentDescription copyWithZone:zone];
        copy.collectionCount = [self.collectionCount copyWithZone:zone];
        copy.commentCount = [self.commentCount copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_action release];
    [_itemsCount release];
    [_componentType release];
    [_hasVideo release];
    [_componentIdentifier release];
    [_picUrl release];
    [_trackValue release];
    [_componentDescription release];
    [_collectionCount release];
    [_commentCount release];
    [super dealloc];
}

@end
