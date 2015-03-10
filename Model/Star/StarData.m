//
//  StarData.m
//
//  Created by   on 15/3/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "StarData.h"
#import "StarItems.h"


NSString *const kStarDataFlag = @"flag";
NSString *const kStarDataLts = @"lts";
NSString *const kStarDataHasStarting = @"has_starting";
NSString *const kStarDataItems = @"items";
NSString *const kStarDataAppApi = @"appApi";


@interface StarData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation StarData

@synthesize flag = _flag;
@synthesize lts = _lts;
@synthesize hasStarting = _hasStarting;
@synthesize items = _items;
@synthesize appApi = _appApi;


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
            self.flag = [self objectOrNilForKey:kStarDataFlag fromDictionary:dict];
            self.lts = [self objectOrNilForKey:kStarDataLts fromDictionary:dict];
            self.hasStarting = [self objectOrNilForKey:kStarDataHasStarting fromDictionary:dict];
    NSObject *receivedStarItems = [dict objectForKey:kStarDataItems];
    NSMutableArray *parsedStarItems = [NSMutableArray array];
    if ([receivedStarItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedStarItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedStarItems addObject:[StarItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedStarItems isKindOfClass:[NSDictionary class]]) {
       [parsedStarItems addObject:[StarItems modelObjectWithDictionary:(NSDictionary *)receivedStarItems]];
    }

    self.items = [NSArray arrayWithArray:parsedStarItems];
            self.appApi = [self objectOrNilForKey:kStarDataAppApi fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.flag forKey:kStarDataFlag];
    [mutableDict setValue:self.lts forKey:kStarDataLts];
    [mutableDict setValue:self.hasStarting forKey:kStarDataHasStarting];
    NSMutableArray *tempArrayForItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.items) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kStarDataItems];
    [mutableDict setValue:self.appApi forKey:kStarDataAppApi];

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

    self.flag = [aDecoder decodeObjectForKey:kStarDataFlag];
    self.lts = [aDecoder decodeObjectForKey:kStarDataLts];
    self.hasStarting = [aDecoder decodeObjectForKey:kStarDataHasStarting];
    self.items = [aDecoder decodeObjectForKey:kStarDataItems];
    self.appApi = [aDecoder decodeObjectForKey:kStarDataAppApi];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_flag forKey:kStarDataFlag];
    [aCoder encodeObject:_lts forKey:kStarDataLts];
    [aCoder encodeObject:_hasStarting forKey:kStarDataHasStarting];
    [aCoder encodeObject:_items forKey:kStarDataItems];
    [aCoder encodeObject:_appApi forKey:kStarDataAppApi];
}

- (id)copyWithZone:(NSZone *)zone
{
    StarData *copy = [[StarData alloc] init];
    
    if (copy) {

        copy.flag = [self.flag copyWithZone:zone];
        copy.lts = [self.lts copyWithZone:zone];
        copy.hasStarting = [self.hasStarting copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
        copy.appApi = [self.appApi copyWithZone:zone];
    }
    
    return copy;
}


@end
