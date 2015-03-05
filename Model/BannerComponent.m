//
//  BannerComponent.m
//
//  Created by zhiyou3g  on 15/3/5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BannerComponent.h"
#import "BannerAction.h"


NSString *const kBannerComponentPicUrl = @"picUrl";
NSString *const kBannerComponentAction = @"action";
NSString *const kBannerComponentComponentType = @"componentType";


@interface BannerComponent ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BannerComponent

@synthesize picUrl = _picUrl;
@synthesize action = _action;
@synthesize componentType = _componentType;


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
            self.picUrl = [self objectOrNilForKey:kBannerComponentPicUrl fromDictionary:dict];
            self.action = [BannerAction modelObjectWithDictionary:[dict objectForKey:kBannerComponentAction]];
            self.componentType = [self objectOrNilForKey:kBannerComponentComponentType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.picUrl forKey:kBannerComponentPicUrl];
    [mutableDict setValue:[self.action dictionaryRepresentation] forKey:kBannerComponentAction];
    [mutableDict setValue:self.componentType forKey:kBannerComponentComponentType];

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

    self.picUrl = [aDecoder decodeObjectForKey:kBannerComponentPicUrl];
    self.action = [aDecoder decodeObjectForKey:kBannerComponentAction];
    self.componentType = [aDecoder decodeObjectForKey:kBannerComponentComponentType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_picUrl forKey:kBannerComponentPicUrl];
    [aCoder encodeObject:_action forKey:kBannerComponentAction];
    [aCoder encodeObject:_componentType forKey:kBannerComponentComponentType];
}

- (id)copyWithZone:(NSZone *)zone
{
    BannerComponent *copy = [[BannerComponent alloc] init];
    
    if (copy) {

        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.action = [self.action copyWithZone:zone];
        copy.componentType = [self.componentType copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_picUrl release];
    [_action release];
    [_componentType release];
    [super dealloc];
}

@end
