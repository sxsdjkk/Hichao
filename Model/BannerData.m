//
//  BannerData.m
//
//  Created by zhiyou3g  on 15/3/5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BannerData.h"
#import "BannerItems.h"


NSString *const kBannerDataItems = @"items";
NSString *const kBannerDataAppApi = @"appApi";


@interface BannerData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BannerData

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
    NSObject *receivedBannerItems = [dict objectForKey:kBannerDataItems];
    NSMutableArray *parsedBannerItems = [NSMutableArray array];
    if ([receivedBannerItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedBannerItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedBannerItems addObject:[BannerItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedBannerItems isKindOfClass:[NSDictionary class]]) {
       [parsedBannerItems addObject:[BannerItems modelObjectWithDictionary:(NSDictionary *)receivedBannerItems]];
    }

    self.items = [NSArray arrayWithArray:parsedBannerItems];
            self.appApi = [self objectOrNilForKey:kBannerDataAppApi fromDictionary:dict];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kBannerDataItems];
    [mutableDict setValue:self.appApi forKey:kBannerDataAppApi];

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

    self.items = [aDecoder decodeObjectForKey:kBannerDataItems];
    self.appApi = [aDecoder decodeObjectForKey:kBannerDataAppApi];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_items forKey:kBannerDataItems];
    [aCoder encodeObject:_appApi forKey:kBannerDataAppApi];
}

- (id)copyWithZone:(NSZone *)zone
{
    BannerData *copy = [[BannerData alloc] init];
    
    if (copy) {

        copy.items = [self.items copyWithZone:zone];
        copy.appApi = [self.appApi copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_items release];
    [_appApi release];
    [super dealloc];
}

@end
