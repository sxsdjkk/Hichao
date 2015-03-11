//
//  HVCDItems.m
//
//  Created by   on 15/3/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "HVCDItems.h"
#import "HVCDItemList.h"


NSString *const kHVCDItemsItemList = @"itemList";


@interface HVCDItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HVCDItems

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
    NSObject *receivedHVCDItemList = [dict objectForKey:kHVCDItemsItemList];
    NSMutableArray *parsedHVCDItemList = [NSMutableArray array];
    if ([receivedHVCDItemList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHVCDItemList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHVCDItemList addObject:[HVCDItemList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHVCDItemList isKindOfClass:[NSDictionary class]]) {
       [parsedHVCDItemList addObject:[HVCDItemList modelObjectWithDictionary:(NSDictionary *)receivedHVCDItemList]];
    }

    self.itemList = [NSArray arrayWithArray:parsedHVCDItemList];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemList] forKey:kHVCDItemsItemList];

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

    self.itemList = [aDecoder decodeObjectForKey:kHVCDItemsItemList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_itemList forKey:kHVCDItemsItemList];
}

- (id)copyWithZone:(NSZone *)zone
{
    HVCDItems *copy = [[HVCDItems alloc] init];
    
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
