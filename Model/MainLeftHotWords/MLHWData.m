//
//  MLHWData.m
//
//  Created by   on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "MLHWData.h"
#import "MLHWQuerys.h"


NSString *const kMLHWDataWords = @"words";
NSString *const kMLHWDataQuerys = @"querys";
NSString *const kMLHWDataAppApi = @"appApi";
NSString *const kMLHWDataVersion = @"version";


@interface MLHWData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MLHWData

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
            self.words = [self objectOrNilForKey:kMLHWDataWords fromDictionary:dict];
    NSObject *receivedMLHWQuerys = [dict objectForKey:kMLHWDataQuerys];
    NSMutableArray *parsedMLHWQuerys = [NSMutableArray array];
    if ([receivedMLHWQuerys isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMLHWQuerys) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMLHWQuerys addObject:[MLHWQuerys modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMLHWQuerys isKindOfClass:[NSDictionary class]]) {
       [parsedMLHWQuerys addObject:[MLHWQuerys modelObjectWithDictionary:(NSDictionary *)receivedMLHWQuerys]];
    }

    self.querys = [NSArray arrayWithArray:parsedMLHWQuerys];
            self.appApi = [self objectOrNilForKey:kMLHWDataAppApi fromDictionary:dict];
            self.version = [self objectOrNilForKey:kMLHWDataVersion fromDictionary:dict];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForWords] forKey:kMLHWDataWords];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForQuerys] forKey:kMLHWDataQuerys];
    [mutableDict setValue:self.appApi forKey:kMLHWDataAppApi];
    [mutableDict setValue:self.version forKey:kMLHWDataVersion];

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

    self.words = [aDecoder decodeObjectForKey:kMLHWDataWords];
    self.querys = [aDecoder decodeObjectForKey:kMLHWDataQuerys];
    self.appApi = [aDecoder decodeObjectForKey:kMLHWDataAppApi];
    self.version = [aDecoder decodeObjectForKey:kMLHWDataVersion];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_words forKey:kMLHWDataWords];
    [aCoder encodeObject:_querys forKey:kMLHWDataQuerys];
    [aCoder encodeObject:_appApi forKey:kMLHWDataAppApi];
    [aCoder encodeObject:_version forKey:kMLHWDataVersion];
}

- (id)copyWithZone:(NSZone *)zone
{
    MLHWData *copy = [[MLHWData alloc] init];
    
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
