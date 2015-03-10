//
//  HStarData.m
//
//  Created by   on 15/3/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "HStarData.h"
#import "HStarItems.h"


NSString *const kHStarDataItems = @"items";
NSString *const kHStarDataFlag = @"flag";
NSString *const kHStarDataAppApi = @"appApi";


@interface HStarData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HStarData

@synthesize items = _items;
@synthesize flag = _flag;
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
    NSObject *receivedHStarItems = [dict objectForKey:kHStarDataItems];
    NSMutableArray *parsedHStarItems = [NSMutableArray array];
    if ([receivedHStarItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHStarItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHStarItems addObject:[HStarItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHStarItems isKindOfClass:[NSDictionary class]]) {
       [parsedHStarItems addObject:[HStarItems modelObjectWithDictionary:(NSDictionary *)receivedHStarItems]];
    }

    self.items = [NSArray arrayWithArray:parsedHStarItems];
            self.flag = [self objectOrNilForKey:kHStarDataFlag fromDictionary:dict];
            self.appApi = [self objectOrNilForKey:kHStarDataAppApi fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kHStarDataItems];
    [mutableDict setValue:self.flag forKey:kHStarDataFlag];
    [mutableDict setValue:self.appApi forKey:kHStarDataAppApi];

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

    self.items = [aDecoder decodeObjectForKey:kHStarDataItems];
    self.flag = [aDecoder decodeObjectForKey:kHStarDataFlag];
    self.appApi = [aDecoder decodeObjectForKey:kHStarDataAppApi];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_items forKey:kHStarDataItems];
    [aCoder encodeObject:_flag forKey:kHStarDataFlag];
    [aCoder encodeObject:_appApi forKey:kHStarDataAppApi];
}

- (id)copyWithZone:(NSZone *)zone
{
    HStarData *copy = [[HStarData alloc] init];
    
    if (copy) {

        copy.items = [self.items copyWithZone:zone];
        copy.flag = [self.flag copyWithZone:zone];
        copy.appApi = [self.appApi copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_items release];
    [_flag release];
    [_appApi release];
    [super dealloc];
}

@end
