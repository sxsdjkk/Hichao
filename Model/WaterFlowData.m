//
//  WaterFlowData.m
//
//  Created by zhiyou3g  on 15/3/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "WaterFlowData.h"
#import "WaterFlowItems.h"


NSString *const kWaterFlowDataItems = @"items";
NSString *const kWaterFlowDataFlag = @"flag";
NSString *const kWaterFlowDataAppApi = @"appApi";


@interface WaterFlowData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WaterFlowData

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
    NSObject *receivedWaterFlowItems = [dict objectForKey:kWaterFlowDataItems];
    NSMutableArray *parsedWaterFlowItems = [NSMutableArray array];
    if ([receivedWaterFlowItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedWaterFlowItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedWaterFlowItems addObject:[WaterFlowItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedWaterFlowItems isKindOfClass:[NSDictionary class]]) {
       [parsedWaterFlowItems addObject:[WaterFlowItems modelObjectWithDictionary:(NSDictionary *)receivedWaterFlowItems]];
    }

    self.items = [NSArray arrayWithArray:parsedWaterFlowItems];
            self.flag = [self objectOrNilForKey:kWaterFlowDataFlag fromDictionary:dict];
            self.appApi = [self objectOrNilForKey:kWaterFlowDataAppApi fromDictionary:dict];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kWaterFlowDataItems];
    [mutableDict setValue:self.flag forKey:kWaterFlowDataFlag];
    [mutableDict setValue:self.appApi forKey:kWaterFlowDataAppApi];

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

    self.items = [aDecoder decodeObjectForKey:kWaterFlowDataItems];
    self.flag = [aDecoder decodeObjectForKey:kWaterFlowDataFlag];
    self.appApi = [aDecoder decodeObjectForKey:kWaterFlowDataAppApi];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_items forKey:kWaterFlowDataItems];
    [aCoder encodeObject:_flag forKey:kWaterFlowDataFlag];
    [aCoder encodeObject:_appApi forKey:kWaterFlowDataAppApi];
}

- (id)copyWithZone:(NSZone *)zone
{
    WaterFlowData *copy = [[WaterFlowData alloc] init];
    
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
