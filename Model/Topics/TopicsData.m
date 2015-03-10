//
//  TopicsData.m
//
//  Created by zhiyou3g  on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "TopicsData.h"
#import "TopicsItems.h"


NSString *const kTopicsDataItems = @"items";
NSString *const kTopicsDataFlag = @"flag";
NSString *const kTopicsDataAppApi = @"appApi";


@interface TopicsData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TopicsData

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
    NSObject *receivedTopicsItems = [dict objectForKey:kTopicsDataItems];
    NSMutableArray *parsedTopicsItems = [NSMutableArray array];
    if ([receivedTopicsItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedTopicsItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedTopicsItems addObject:[TopicsItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedTopicsItems isKindOfClass:[NSDictionary class]]) {
       [parsedTopicsItems addObject:[TopicsItems modelObjectWithDictionary:(NSDictionary *)receivedTopicsItems]];
    }

    self.items = [NSArray arrayWithArray:parsedTopicsItems];
            self.flag = [self objectOrNilForKey:kTopicsDataFlag fromDictionary:dict];
            self.appApi = [self objectOrNilForKey:kTopicsDataAppApi fromDictionary:dict];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kTopicsDataItems];
    [mutableDict setValue:self.flag forKey:kTopicsDataFlag];
    [mutableDict setValue:self.appApi forKey:kTopicsDataAppApi];

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

    self.items = [aDecoder decodeObjectForKey:kTopicsDataItems];
    self.flag = [aDecoder decodeObjectForKey:kTopicsDataFlag];
    self.appApi = [aDecoder decodeObjectForKey:kTopicsDataAppApi];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_items forKey:kTopicsDataItems];
    [aCoder encodeObject:_flag forKey:kTopicsDataFlag];
    [aCoder encodeObject:_appApi forKey:kTopicsDataAppApi];
}

- (id)copyWithZone:(NSZone *)zone
{
    TopicsData *copy = [[TopicsData alloc] init];
    
    if (copy) {

        copy.items = [self.items copyWithZone:zone];
        copy.flag = [self.flag copyWithZone:zone];
        copy.appApi = [self.appApi copyWithZone:zone];
    }
    
    return copy;
}


@end
