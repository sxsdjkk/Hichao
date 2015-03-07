//
//  WaterFlowActions.m
//
//  Created by zhiyou3g  on 15/3/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "WaterFlowActions.h"


NSString *const kWaterFlowActionsUnixtime = @"unixtime";
NSString *const kWaterFlowActionsId = @"id";
NSString *const kWaterFlowActionsTitle = @"title";
NSString *const kWaterFlowActionsActionType = @"actionType";


@interface WaterFlowActions ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WaterFlowActions

@synthesize unixtime = _unixtime;
@synthesize actionsIdentifier = _actionsIdentifier;
@synthesize title = _title;
@synthesize actionType = _actionType;


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
            self.unixtime = [[self objectOrNilForKey:kWaterFlowActionsUnixtime fromDictionary:dict] doubleValue];
            self.actionsIdentifier = [self objectOrNilForKey:kWaterFlowActionsId fromDictionary:dict];
            self.title = [self objectOrNilForKey:kWaterFlowActionsTitle fromDictionary:dict];
            self.actionType = [self objectOrNilForKey:kWaterFlowActionsActionType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unixtime] forKey:kWaterFlowActionsUnixtime];
    [mutableDict setValue:self.actionsIdentifier forKey:kWaterFlowActionsId];
    [mutableDict setValue:self.title forKey:kWaterFlowActionsTitle];
    [mutableDict setValue:self.actionType forKey:kWaterFlowActionsActionType];

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

    self.unixtime = [aDecoder decodeDoubleForKey:kWaterFlowActionsUnixtime];
    self.actionsIdentifier = [aDecoder decodeObjectForKey:kWaterFlowActionsId];
    self.title = [aDecoder decodeObjectForKey:kWaterFlowActionsTitle];
    self.actionType = [aDecoder decodeObjectForKey:kWaterFlowActionsActionType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_unixtime forKey:kWaterFlowActionsUnixtime];
    [aCoder encodeObject:_actionsIdentifier forKey:kWaterFlowActionsId];
    [aCoder encodeObject:_title forKey:kWaterFlowActionsTitle];
    [aCoder encodeObject:_actionType forKey:kWaterFlowActionsActionType];
}

- (id)copyWithZone:(NSZone *)zone
{
    WaterFlowActions *copy = [[WaterFlowActions alloc] init];
    
    if (copy) {

        copy.unixtime = self.unixtime;
        copy.actionsIdentifier = [self.actionsIdentifier copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.actionType = [self.actionType copyWithZone:zone];
    }
    
    return copy;
}


@end
