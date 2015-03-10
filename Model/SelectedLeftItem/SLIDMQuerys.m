//
//  SLIDMQuerys.m
//
//  Created by   on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SLIDMQuerys.h"
#import "SLIDMItems.h"


NSString *const kSLIDMQuerysCateimg = @"cateimg";
NSString *const kSLIDMQuerysItems = @"items";
NSString *const kSLIDMQuerysTitle = @"title";


@interface SLIDMQuerys ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SLIDMQuerys

@synthesize cateimg = _cateimg;
@synthesize items = _items;
@synthesize title = _title;


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
            self.cateimg = [self objectOrNilForKey:kSLIDMQuerysCateimg fromDictionary:dict];
    NSObject *receivedSLIDMItems = [dict objectForKey:kSLIDMQuerysItems];
    NSMutableArray *parsedSLIDMItems = [NSMutableArray array];
    if ([receivedSLIDMItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSLIDMItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSLIDMItems addObject:[SLIDMItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSLIDMItems isKindOfClass:[NSDictionary class]]) {
       [parsedSLIDMItems addObject:[SLIDMItems modelObjectWithDictionary:(NSDictionary *)receivedSLIDMItems]];
    }

    self.items = [NSArray arrayWithArray:parsedSLIDMItems];
            self.title = [self objectOrNilForKey:kSLIDMQuerysTitle fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.cateimg forKey:kSLIDMQuerysCateimg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kSLIDMQuerysItems];
    [mutableDict setValue:self.title forKey:kSLIDMQuerysTitle];

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

    self.cateimg = [aDecoder decodeObjectForKey:kSLIDMQuerysCateimg];
    self.items = [aDecoder decodeObjectForKey:kSLIDMQuerysItems];
    self.title = [aDecoder decodeObjectForKey:kSLIDMQuerysTitle];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_cateimg forKey:kSLIDMQuerysCateimg];
    [aCoder encodeObject:_items forKey:kSLIDMQuerysItems];
    [aCoder encodeObject:_title forKey:kSLIDMQuerysTitle];
}

- (id)copyWithZone:(NSZone *)zone
{
    SLIDMQuerys *copy = [[SLIDMQuerys alloc] init];
    
    if (copy) {

        copy.cateimg = [self.cateimg copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_cateimg release];
    [_items release];
    [_title release];
    [super dealloc];
}

@end
