//
//  StarComponent.m
//
//  Created by   on 15/3/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "StarComponent.h"
#import "StarAction.h"


NSString *const kStarComponentAction = @"action";
NSString *const kStarComponentComponentType = @"componentType";
NSString *const kStarComponentPicUrl = @"picUrl";
NSString *const kStarComponentId = @"id";
NSString *const kStarComponentTitle = @"title";
NSString *const kStarComponentPeopleCount = @"peopleCount";
NSString *const kStarComponentDiscount = @"discount";
NSString *const kStarComponentSlide = @"slide";
NSString *const kStarComponentExpires = @"expires";
NSString *const kStarComponentTuanState = @"tuanState";



@interface StarComponent ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation StarComponent

@synthesize action = _action;
@synthesize componentType = _componentType;
@synthesize picUrl = _picUrl;
@synthesize componentIdentifier = _componentIdentifier;
@synthesize title = _title;
@synthesize peopleCount = _peopleCount;
@synthesize discount = _discount;
@synthesize slide = _slide;
@synthesize expires = _expires;
@synthesize tuanState = _tuanState;

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
            self.action = [StarAction modelObjectWithDictionary:[dict objectForKey:kStarComponentAction]];
            self.componentType = [self objectOrNilForKey:kStarComponentComponentType fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kStarComponentPicUrl fromDictionary:dict];
            self.componentIdentifier = [self objectOrNilForKey:kStarComponentId fromDictionary:dict];
            self.title = [self objectOrNilForKey:kStarComponentTitle fromDictionary:dict];
            self.peopleCount = [self objectOrNilForKey:kStarComponentPeopleCount fromDictionary:dict];
            self.discount = [self objectOrNilForKey:kStarComponentDiscount fromDictionary:dict];
            self.slide = [self objectOrNilForKey:kStarComponentSlide fromDictionary:dict];
            self.expires = [self objectOrNilForKey:kStarComponentExpires fromDictionary:dict];
            self.tuanState = [self objectOrNilForKey:kStarComponentTuanState fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.action dictionaryRepresentation] forKey:kStarComponentAction];
    [mutableDict setValue:self.componentType forKey:kStarComponentComponentType];
    [mutableDict setValue:self.picUrl forKey:kStarComponentPicUrl];
    [mutableDict setValue:self.componentIdentifier forKey:kStarComponentId];
    [mutableDict setValue:self.title forKey:kStarComponentTitle];
    [mutableDict setValue:self.peopleCount forKey:kStarComponentPeopleCount];
    [mutableDict setValue:self.discount forKey:kStarComponentDiscount];
    [mutableDict setValue:self.slide forKey:kStarComponentSlide];
    [mutableDict setValue:self.expires forKey:kStarComponentExpires];
    [mutableDict setValue:self.tuanState forKey:kStarComponentTuanState];

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

    self.action = [aDecoder decodeObjectForKey:kStarComponentAction];
    self.componentType = [aDecoder decodeObjectForKey:kStarComponentComponentType];
    self.picUrl = [aDecoder decodeObjectForKey:kStarComponentPicUrl];
    self.componentIdentifier = [aDecoder decodeObjectForKey:kStarComponentId];
    self.title = [aDecoder decodeObjectForKey:kStarComponentTitle];
    self.peopleCount = [aDecoder decodeObjectForKey:kStarComponentPeopleCount];
    self.discount = [aDecoder decodeObjectForKey:kStarComponentDiscount];
    self.slide = [aDecoder decodeObjectForKey:kStarComponentSlide];
    self.expires = [aDecoder decodeObjectForKey:kStarComponentExpires];
    self.tuanState = [aDecoder decodeObjectForKey:kStarComponentTuanState];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_action forKey:kStarComponentAction];
    [aCoder encodeObject:_componentType forKey:kStarComponentComponentType];
    [aCoder encodeObject:_picUrl forKey:kStarComponentPicUrl];
    [aCoder encodeObject:_componentIdentifier forKey:kStarComponentId];
    [aCoder encodeObject:_title forKey:kStarComponentTitle];
    [aCoder encodeObject:_peopleCount forKey:kStarComponentPeopleCount];
    [aCoder encodeObject:_discount forKey:kStarComponentDiscount];
    [aCoder encodeObject:_slide forKey:kStarComponentSlide];
    [aCoder encodeObject:_expires forKey:kStarComponentExpires];
    [aCoder encodeObject:_tuanState forKey:kStarComponentTuanState];
}

- (id)copyWithZone:(NSZone *)zone
{
    StarComponent *copy = [[StarComponent alloc] init];
    
    if (copy) {

        copy.action = [self.action copyWithZone:zone];
        copy.componentType = [self.componentType copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.componentIdentifier = [self.componentIdentifier copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.peopleCount = [self.peopleCount copyWithZone:zone];
        copy.discount = [self.discount copyWithZone:zone];
        copy.slide = [self.slide copyWithZone:zone];
        copy.expires = [self.expires copyWithZone:zone];
        copy.tuanState = [self.tuanState copyWithZone:zone];
    }
    
    return copy;
}


@end
