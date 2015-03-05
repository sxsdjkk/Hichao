//
//  BannerAction.m
//
//  Created by zhiyou3g  on 15/3/5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BannerAction.h"


NSString *const kBannerActionUnixtime = @"unixtime";
NSString *const kBannerActionId = @"id";
NSString *const kBannerActionTitle = @"title";
NSString *const kBannerActionActionType = @"actionType";
NSString *const kBannerActionBannerId = @"bannerId";


@interface BannerAction ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BannerAction

@synthesize unixtime = _unixtime;
@synthesize actionIdentifier = _actionIdentifier;
@synthesize title = _title;
@synthesize actionType = _actionType;
@synthesize bannerId = _bannerId;


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
            self.unixtime = [[self objectOrNilForKey:kBannerActionUnixtime fromDictionary:dict] doubleValue];
            self.actionIdentifier = [self objectOrNilForKey:kBannerActionId fromDictionary:dict];
            self.title = [self objectOrNilForKey:kBannerActionTitle fromDictionary:dict];
            self.actionType = [self objectOrNilForKey:kBannerActionActionType fromDictionary:dict];
            self.bannerId = [self objectOrNilForKey:kBannerActionBannerId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unixtime] forKey:kBannerActionUnixtime];
    [mutableDict setValue:self.actionIdentifier forKey:kBannerActionId];
    [mutableDict setValue:self.title forKey:kBannerActionTitle];
    [mutableDict setValue:self.actionType forKey:kBannerActionActionType];
    [mutableDict setValue:self.bannerId forKey:kBannerActionBannerId];

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

    self.unixtime = [aDecoder decodeDoubleForKey:kBannerActionUnixtime];
    self.actionIdentifier = [aDecoder decodeObjectForKey:kBannerActionId];
    self.title = [aDecoder decodeObjectForKey:kBannerActionTitle];
    self.actionType = [aDecoder decodeObjectForKey:kBannerActionActionType];
    self.bannerId = [aDecoder decodeObjectForKey:kBannerActionBannerId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_unixtime forKey:kBannerActionUnixtime];
    [aCoder encodeObject:_actionIdentifier forKey:kBannerActionId];
    [aCoder encodeObject:_title forKey:kBannerActionTitle];
    [aCoder encodeObject:_actionType forKey:kBannerActionActionType];
    [aCoder encodeObject:_bannerId forKey:kBannerActionBannerId];
}

- (id)copyWithZone:(NSZone *)zone
{
    BannerAction *copy = [[BannerAction alloc] init];
    
    if (copy) {

        copy.unixtime = self.unixtime;
        copy.actionIdentifier = [self.actionIdentifier copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.actionType = [self.actionType copyWithZone:zone];
        copy.bannerId = [self.bannerId copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_actionIdentifier release];
    [_title release];
    [_actionType release];
    [_bannerId release];
    [super dealloc];
}

@end
