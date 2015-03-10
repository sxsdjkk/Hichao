//
//  SLIDMData.m
//
//  Created by   on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SLIDMData.h"
#import "SLIDMWords.h"
#import "SLIDMQuerys.h"


NSString *const kSLIDMDataWords = @"words";
NSString *const kSLIDMDataQuerys = @"querys";
NSString *const kSLIDMDataAppApi = @"appApi";
NSString *const kSLIDMDataVersion = @"version";


@interface SLIDMData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SLIDMData

@synthesize words = _words;
@synthesize querys = _querys;
@synthesize appApi = _appApi;
@synthesize version = _version;


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
    NSObject *receivedSLIDMWords = [dict objectForKey:kSLIDMDataWords];
    NSMutableArray *parsedSLIDMWords = [NSMutableArray array];
    if ([receivedSLIDMWords isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSLIDMWords) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSLIDMWords addObject:[SLIDMWords modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSLIDMWords isKindOfClass:[NSDictionary class]]) {
       [parsedSLIDMWords addObject:[SLIDMWords modelObjectWithDictionary:(NSDictionary *)receivedSLIDMWords]];
    }

    self.words = [NSArray arrayWithArray:parsedSLIDMWords];
    NSObject *receivedSLIDMQuerys = [dict objectForKey:kSLIDMDataQuerys];
    NSMutableArray *parsedSLIDMQuerys = [NSMutableArray array];
    if ([receivedSLIDMQuerys isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSLIDMQuerys) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSLIDMQuerys addObject:[SLIDMQuerys modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSLIDMQuerys isKindOfClass:[NSDictionary class]]) {
       [parsedSLIDMQuerys addObject:[SLIDMQuerys modelObjectWithDictionary:(NSDictionary *)receivedSLIDMQuerys]];
    }

    self.querys = [NSArray arrayWithArray:parsedSLIDMQuerys];
            self.appApi = [self objectOrNilForKey:kSLIDMDataAppApi fromDictionary:dict];
            self.version = [self objectOrNilForKey:kSLIDMDataVersion fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForWords = [NSMutableArray array];
    for (NSObject *subArrayObject in self.words) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForWords addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForWords addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForWords] forKey:kSLIDMDataWords];
    NSMutableArray *tempArrayForQuerys = [NSMutableArray array];
    for (NSObject *subArrayObject in self.querys) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForQuerys addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForQuerys addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForQuerys] forKey:kSLIDMDataQuerys];
    [mutableDict setValue:self.appApi forKey:kSLIDMDataAppApi];
    [mutableDict setValue:self.version forKey:kSLIDMDataVersion];

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

    self.words = [aDecoder decodeObjectForKey:kSLIDMDataWords];
    self.querys = [aDecoder decodeObjectForKey:kSLIDMDataQuerys];
    self.appApi = [aDecoder decodeObjectForKey:kSLIDMDataAppApi];
    self.version = [aDecoder decodeObjectForKey:kSLIDMDataVersion];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_words forKey:kSLIDMDataWords];
    [aCoder encodeObject:_querys forKey:kSLIDMDataQuerys];
    [aCoder encodeObject:_appApi forKey:kSLIDMDataAppApi];
    [aCoder encodeObject:_version forKey:kSLIDMDataVersion];
}

- (id)copyWithZone:(NSZone *)zone
{
    SLIDMData *copy = [[SLIDMData alloc] init];
    
    if (copy) {

        copy.words = [self.words copyWithZone:zone];
        copy.querys = [self.querys copyWithZone:zone];
        copy.appApi = [self.appApi copyWithZone:zone];
        copy.version = [self.version copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_words release];
    [_querys release];
    [_appApi release];
    [_version release];
    [super dealloc];
}

@end
