//
//  HDGLItems.m
//
//  Created by   on 15/3/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "HDGLItems.h"
#import "HDGLItemList.h"


NSString *const kHDGLItemsItemList = @"itemList";


@interface HDGLItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HDGLItems

@synthesize itemList = _itemList;


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
    NSObject *receivedHDGLItemList = [dict objectForKey:kHDGLItemsItemList];
    NSMutableArray *parsedHDGLItemList = [NSMutableArray array];
    if ([receivedHDGLItemList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHDGLItemList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHDGLItemList addObject:[HDGLItemList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHDGLItemList isKindOfClass:[NSDictionary class]]) {
       [parsedHDGLItemList addObject:[HDGLItemList modelObjectWithDictionary:(NSDictionary *)receivedHDGLItemList]];
    }

    self.itemList = [NSArray arrayWithArray:parsedHDGLItemList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForItemList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.itemList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItemList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItemList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemList] forKey:kHDGLItemsItemList];

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

    self.itemList = [aDecoder decodeObjectForKey:kHDGLItemsItemList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_itemList forKey:kHDGLItemsItemList];
}

- (id)copyWithZone:(NSZone *)zone
{
    HDGLItems *copy = [[HDGLItems alloc] init];
    
    if (copy) {

        copy.itemList = [self.itemList copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_itemList release];
    [super dealloc];
}

@end
