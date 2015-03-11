//
//  HDGLData.m
//
//  Created by   on 15/3/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "HDGLData.h"
#import "HDGLItems.h"


NSString *const kHDGLDataItems = @"items";
NSString *const kHDGLDataAppApi = @"appApi";


@interface HDGLData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HDGLData

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
    NSObject *receivedHDGLItems = [dict objectForKey:kHDGLDataItems];
    NSMutableArray *parsedHDGLItems = [NSMutableArray array];
    if ([receivedHDGLItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHDGLItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHDGLItems addObject:[HDGLItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHDGLItems isKindOfClass:[NSDictionary class]]) {
       [parsedHDGLItems addObject:[HDGLItems modelObjectWithDictionary:(NSDictionary *)receivedHDGLItems]];
    }

    self.items = [NSArray arrayWithArray:parsedHDGLItems];
            self.appApi = [self objectOrNilForKey:kHDGLDataAppApi fromDictionary:dict];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kHDGLDataItems];
    [mutableDict setValue:self.appApi forKey:kHDGLDataAppApi];

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

    self.items = [aDecoder decodeObjectForKey:kHDGLDataItems];
    self.appApi = [aDecoder decodeObjectForKey:kHDGLDataAppApi];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_items forKey:kHDGLDataItems];
    [aCoder encodeObject:_appApi forKey:kHDGLDataAppApi];
}

- (id)copyWithZone:(NSZone *)zone
{
    HDGLData *copy = [[HDGLData alloc] init];
    
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
