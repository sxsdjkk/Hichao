//
//  iTunesLookupBaseClass.m
//
//  Created by zhiyou3g  on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "iTunesLookupBaseClass.h"
#import "iTunesLookupResults.h"


NSString *const kiTunesLookupBaseClassResults = @"results";
NSString *const kiTunesLookupBaseClassResultCount = @"resultCount";


@interface iTunesLookupBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation iTunesLookupBaseClass

@synthesize results = _results;
@synthesize resultCount = _resultCount;


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
    NSObject *receivediTunesLookupResults = [dict objectForKey:kiTunesLookupBaseClassResults];
    NSMutableArray *parsediTunesLookupResults = [NSMutableArray array];
    if ([receivediTunesLookupResults isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivediTunesLookupResults) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsediTunesLookupResults addObject:[iTunesLookupResults modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivediTunesLookupResults isKindOfClass:[NSDictionary class]]) {
       [parsediTunesLookupResults addObject:[iTunesLookupResults modelObjectWithDictionary:(NSDictionary *)receivediTunesLookupResults]];
    }

    self.results = [NSArray arrayWithArray:parsediTunesLookupResults];
            self.resultCount = [[self objectOrNilForKey:kiTunesLookupBaseClassResultCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForResults = [NSMutableArray array];
    for (NSObject *subArrayObject in self.results) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForResults addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForResults addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResults] forKey:kiTunesLookupBaseClassResults];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resultCount] forKey:kiTunesLookupBaseClassResultCount];

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

    self.results = [aDecoder decodeObjectForKey:kiTunesLookupBaseClassResults];
    self.resultCount = [aDecoder decodeDoubleForKey:kiTunesLookupBaseClassResultCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_results forKey:kiTunesLookupBaseClassResults];
    [aCoder encodeDouble:_resultCount forKey:kiTunesLookupBaseClassResultCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    iTunesLookupBaseClass *copy = [[iTunesLookupBaseClass alloc] init];
    
    if (copy) {

        copy.results = [self.results copyWithZone:zone];
        copy.resultCount = self.resultCount;
    }
    
    return copy;
}


@end
