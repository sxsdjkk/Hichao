//
//  MLHWQuerys.m
//
//  Created by   on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "MLHWQuerys.h"


NSString *const kMLHWQuerysQuery = @"query";
NSString *const kMLHWQuerysPicUrl = @"picUrl";
NSString *const kMLHWQuerysTitle = @"title";


@interface MLHWQuerys ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MLHWQuerys

@synthesize query = _query;
@synthesize picUrl = _picUrl;
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
            self.query = [self objectOrNilForKey:kMLHWQuerysQuery fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kMLHWQuerysPicUrl fromDictionary:dict];
            self.title = [self objectOrNilForKey:kMLHWQuerysTitle fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.query forKey:kMLHWQuerysQuery];
    [mutableDict setValue:self.picUrl forKey:kMLHWQuerysPicUrl];
    [mutableDict setValue:self.title forKey:kMLHWQuerysTitle];

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

    self.query = [aDecoder decodeObjectForKey:kMLHWQuerysQuery];
    self.picUrl = [aDecoder decodeObjectForKey:kMLHWQuerysPicUrl];
    self.title = [aDecoder decodeObjectForKey:kMLHWQuerysTitle];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_query forKey:kMLHWQuerysQuery];
    [aCoder encodeObject:_picUrl forKey:kMLHWQuerysPicUrl];
    [aCoder encodeObject:_title forKey:kMLHWQuerysTitle];
}

- (id)copyWithZone:(NSZone *)zone
{
    MLHWQuerys *copy = [[MLHWQuerys alloc] init];
    
    if (copy) {

        copy.query = [self.query copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_query release];
    [_picUrl release];
    [_title release];
    [super dealloc];
}

@end
