//
//  TopicItems.m
//
//  Created by zhiyou3g  on 15/3/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "TopicItems.h"
#import "TopicCells.h"


NSString *const kTopicItemsCells = @"cells";
NSString *const kTopicItemsHeight = @"height";


@interface TopicItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TopicItems

@synthesize cells = _cells;
@synthesize height = _height;


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
    NSObject *receivedTopicCells = [dict objectForKey:kTopicItemsCells];
    NSMutableArray *parsedTopicCells = [NSMutableArray array];
    if ([receivedTopicCells isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedTopicCells) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedTopicCells addObject:[TopicCells modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedTopicCells isKindOfClass:[NSDictionary class]]) {
       [parsedTopicCells addObject:[TopicCells modelObjectWithDictionary:(NSDictionary *)receivedTopicCells]];
    }

    self.cells = [NSArray arrayWithArray:parsedTopicCells];
            self.height = [self objectOrNilForKey:kTopicItemsHeight fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForCells = [NSMutableArray array];
    for (NSObject *subArrayObject in self.cells) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCells addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCells addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCells] forKey:kTopicItemsCells];
    [mutableDict setValue:self.height forKey:kTopicItemsHeight];

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

    self.cells = [aDecoder decodeObjectForKey:kTopicItemsCells];
    self.height = [aDecoder decodeObjectForKey:kTopicItemsHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_cells forKey:kTopicItemsCells];
    [aCoder encodeObject:_height forKey:kTopicItemsHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    TopicItems *copy = [[TopicItems alloc] init];
    
    if (copy) {

        copy.cells = [self.cells copyWithZone:zone];
        copy.height = [self.height copyWithZone:zone];
    }
    
    return copy;
}


@end
