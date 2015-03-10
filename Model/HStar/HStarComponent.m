//
//  HStarComponent.m
//
//  Created by   on 15/3/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "HStarComponent.h"
#import "HStarAction.h"


NSString *const kHStarComponentId = @"id";
NSString *const kHStarComponentDiscount = @"discount";
NSString *const kHStarComponentDescription = @"description";
NSString *const kHStarComponentTuanId = @"tuanId";
NSString *const kHStarComponentPicUrl = @"picUrl";
NSString *const kHStarComponentExpires = @"expires";
NSString *const kHStarComponentComponentType = @"componentType";
NSString *const kHStarComponentPrice = @"price";
NSString *const kHStarComponentTitle = @"title";
NSString *const kHStarComponentPeopleCount = @"peopleCount";
NSString *const kHStarComponentTag = @"tag";
NSString *const kHStarComponentAction = @"action";
NSString *const kHStarComponentTuanState = @"tuanState";
NSString *const kHStarComponentPriceOrig = @"priceOrig";


@interface HStarComponent ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HStarComponent

@synthesize componentIdentifier = _componentIdentifier;
@synthesize discount = _discount;
@synthesize componentDescription = _componentDescription;
@synthesize tuanId = _tuanId;
@synthesize picUrl = _picUrl;
@synthesize expires = _expires;
@synthesize componentType = _componentType;
@synthesize price = _price;
@synthesize title = _title;
@synthesize peopleCount = _peopleCount;
@synthesize tag = _tag;
@synthesize action = _action;
@synthesize tuanState = _tuanState;
@synthesize priceOrig = _priceOrig;


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
            self.componentIdentifier = [self objectOrNilForKey:kHStarComponentId fromDictionary:dict];
            self.discount = [self objectOrNilForKey:kHStarComponentDiscount fromDictionary:dict];
            self.componentDescription = [self objectOrNilForKey:kHStarComponentDescription fromDictionary:dict];
            self.tuanId = [self objectOrNilForKey:kHStarComponentTuanId fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kHStarComponentPicUrl fromDictionary:dict];
            self.expires = [self objectOrNilForKey:kHStarComponentExpires fromDictionary:dict];
            self.componentType = [self objectOrNilForKey:kHStarComponentComponentType fromDictionary:dict];
            self.price = [self objectOrNilForKey:kHStarComponentPrice fromDictionary:dict];
            self.title = [self objectOrNilForKey:kHStarComponentTitle fromDictionary:dict];
            self.peopleCount = [self objectOrNilForKey:kHStarComponentPeopleCount fromDictionary:dict];
            self.tag = [self objectOrNilForKey:kHStarComponentTag fromDictionary:dict];
            self.action = [HStarAction modelObjectWithDictionary:[dict objectForKey:kHStarComponentAction]];
            self.tuanState = [self objectOrNilForKey:kHStarComponentTuanState fromDictionary:dict];
            self.priceOrig = [self objectOrNilForKey:kHStarComponentPriceOrig fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.componentIdentifier forKey:kHStarComponentId];
    [mutableDict setValue:self.discount forKey:kHStarComponentDiscount];
    [mutableDict setValue:self.componentDescription forKey:kHStarComponentDescription];
    [mutableDict setValue:self.tuanId forKey:kHStarComponentTuanId];
    [mutableDict setValue:self.picUrl forKey:kHStarComponentPicUrl];
    [mutableDict setValue:self.expires forKey:kHStarComponentExpires];
    [mutableDict setValue:self.componentType forKey:kHStarComponentComponentType];
    [mutableDict setValue:self.price forKey:kHStarComponentPrice];
    [mutableDict setValue:self.title forKey:kHStarComponentTitle];
    [mutableDict setValue:self.peopleCount forKey:kHStarComponentPeopleCount];
    [mutableDict setValue:self.tag forKey:kHStarComponentTag];
    [mutableDict setValue:[self.action dictionaryRepresentation] forKey:kHStarComponentAction];
    [mutableDict setValue:self.tuanState forKey:kHStarComponentTuanState];
    [mutableDict setValue:self.priceOrig forKey:kHStarComponentPriceOrig];

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

    self.componentIdentifier = [aDecoder decodeObjectForKey:kHStarComponentId];
    self.discount = [aDecoder decodeObjectForKey:kHStarComponentDiscount];
    self.componentDescription = [aDecoder decodeObjectForKey:kHStarComponentDescription];
    self.tuanId = [aDecoder decodeObjectForKey:kHStarComponentTuanId];
    self.picUrl = [aDecoder decodeObjectForKey:kHStarComponentPicUrl];
    self.expires = [aDecoder decodeObjectForKey:kHStarComponentExpires];
    self.componentType = [aDecoder decodeObjectForKey:kHStarComponentComponentType];
    self.price = [aDecoder decodeObjectForKey:kHStarComponentPrice];
    self.title = [aDecoder decodeObjectForKey:kHStarComponentTitle];
    self.peopleCount = [aDecoder decodeObjectForKey:kHStarComponentPeopleCount];
    self.tag = [aDecoder decodeObjectForKey:kHStarComponentTag];
    self.action = [aDecoder decodeObjectForKey:kHStarComponentAction];
    self.tuanState = [aDecoder decodeObjectForKey:kHStarComponentTuanState];
    self.priceOrig = [aDecoder decodeObjectForKey:kHStarComponentPriceOrig];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_componentIdentifier forKey:kHStarComponentId];
    [aCoder encodeObject:_discount forKey:kHStarComponentDiscount];
    [aCoder encodeObject:_componentDescription forKey:kHStarComponentDescription];
    [aCoder encodeObject:_tuanId forKey:kHStarComponentTuanId];
    [aCoder encodeObject:_picUrl forKey:kHStarComponentPicUrl];
    [aCoder encodeObject:_expires forKey:kHStarComponentExpires];
    [aCoder encodeObject:_componentType forKey:kHStarComponentComponentType];
    [aCoder encodeObject:_price forKey:kHStarComponentPrice];
    [aCoder encodeObject:_title forKey:kHStarComponentTitle];
    [aCoder encodeObject:_peopleCount forKey:kHStarComponentPeopleCount];
    [aCoder encodeObject:_tag forKey:kHStarComponentTag];
    [aCoder encodeObject:_action forKey:kHStarComponentAction];
    [aCoder encodeObject:_tuanState forKey:kHStarComponentTuanState];
    [aCoder encodeObject:_priceOrig forKey:kHStarComponentPriceOrig];
}

- (id)copyWithZone:(NSZone *)zone
{
    HStarComponent *copy = [[HStarComponent alloc] init];
    
    if (copy) {

        copy.componentIdentifier = [self.componentIdentifier copyWithZone:zone];
        copy.discount = [self.discount copyWithZone:zone];
        copy.componentDescription = [self.componentDescription copyWithZone:zone];
        copy.tuanId = [self.tuanId copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.expires = [self.expires copyWithZone:zone];
        copy.componentType = [self.componentType copyWithZone:zone];
        copy.price = [self.price copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.peopleCount = [self.peopleCount copyWithZone:zone];
        copy.tag = [self.tag copyWithZone:zone];
        copy.action = [self.action copyWithZone:zone];
        copy.tuanState = [self.tuanState copyWithZone:zone];
        copy.priceOrig = [self.priceOrig copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_componentIdentifier release];
    [_discount release];
    [_componentDescription release];
    [_tuanId release];
    [_picUrl release];
    [_expires release];
    [_componentType release];
    [_price release];
    [_title release];
    [_peopleCount release];
    [_tag release];
    [_action release];
    [_tuanState release];
    [_priceOrig release];
    [super dealloc];
}

@end
