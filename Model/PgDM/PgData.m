//
//  PgData.m
//
//  Created by   on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "PgData.h"
#import "PgItems.h"


NSString *const kPgDataFlag = @"flag";
NSString *const kPgDataTopThreads = @"topThreads";
NSString *const kPgDataItems = @"items";
NSString *const kPgDataAppApi = @"appApi";


@interface PgData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PgData

@synthesize flag = _flag;
@synthesize topThreads = _topThreads;
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
            self.flag = [self objectOrNilForKey:kPgDataFlag fromDictionary:dict];
            self.topThreads = [self objectOrNilForKey:kPgDataTopThreads fromDictionary:dict];
    NSObject *receivedPgItems = [dict objectForKey:kPgDataItems];
    NSMutableArray *parsedPgItems = [NSMutableArray array];
    if ([receivedPgItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedPgItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPgItems addObject:[PgItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedPgItems isKindOfClass:[NSDictionary class]]) {
       [parsedPgItems addObject:[PgItems modelObjectWithDictionary:(NSDictionary *)receivedPgItems]];
    }

    self.items = [NSArray arrayWithArray:parsedPgItems];
            self.appApi = [self objectOrNilForKey:kPgDataAppApi fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.flag forKey:kPgDataFlag];
    NSMutableArray *tempArrayForTopThreads = [NSMutableArray array];
    for (NSObject *subArrayObject in self.topThreads) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTopThreads addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTopThreads addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTopThreads] forKey:kPgDataTopThreads];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kPgDataItems];
    [mutableDict setValue:self.appApi forKey:kPgDataAppApi];

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

    self.flag = [aDecoder decodeObjectForKey:kPgDataFlag];
    self.topThreads = [aDecoder decodeObjectForKey:kPgDataTopThreads];
    self.items = [aDecoder decodeObjectForKey:kPgDataItems];
    self.appApi = [aDecoder decodeObjectForKey:kPgDataAppApi];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_flag forKey:kPgDataFlag];
    [aCoder encodeObject:_topThreads forKey:kPgDataTopThreads];
    [aCoder encodeObject:_items forKey:kPgDataItems];
    [aCoder encodeObject:_appApi forKey:kPgDataAppApi];
}

- (id)copyWithZone:(NSZone *)zone
{
    PgData *copy = [[PgData alloc] init];
    
    if (copy) {

        copy.flag = [self.flag copyWithZone:zone];
        copy.topThreads = [self.topThreads copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
        copy.appApi = [self.appApi copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_flag release];
    [_topThreads release];
    [_items release];
    [_appApi release];
    [super dealloc];
}

@end
