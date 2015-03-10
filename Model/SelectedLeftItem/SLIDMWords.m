//
//  SLIDMWords.m
//
//  Created by   on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SLIDMWords.h"


NSString *const kSLIDMWordsFw = @"fw";
NSString *const kSLIDMWordsAw = @"aw";
NSString *const kSLIDMWordsN = @"n";
NSString *const kSLIDMWordsPic = @"pic";
NSString *const kSLIDMWordsC = @"c";
NSString *const kSLIDMWordsType = @"type";


@interface SLIDMWords ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SLIDMWords

@synthesize fw = _fw;
@synthesize aw = _aw;
@synthesize n = _n;
@synthesize pic = _pic;
@synthesize c = _c;
@synthesize type = _type;


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
            self.fw = [self objectOrNilForKey:kSLIDMWordsFw fromDictionary:dict];
            self.aw = [self objectOrNilForKey:kSLIDMWordsAw fromDictionary:dict];
            self.n = [self objectOrNilForKey:kSLIDMWordsN fromDictionary:dict];
            self.pic = [self objectOrNilForKey:kSLIDMWordsPic fromDictionary:dict];
            self.c = [self objectOrNilForKey:kSLIDMWordsC fromDictionary:dict];
            self.type = [self objectOrNilForKey:kSLIDMWordsType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.fw forKey:kSLIDMWordsFw];
    [mutableDict setValue:self.aw forKey:kSLIDMWordsAw];
    [mutableDict setValue:self.n forKey:kSLIDMWordsN];
    [mutableDict setValue:self.pic forKey:kSLIDMWordsPic];
    [mutableDict setValue:self.c forKey:kSLIDMWordsC];
    [mutableDict setValue:self.type forKey:kSLIDMWordsType];

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

    self.fw = [aDecoder decodeObjectForKey:kSLIDMWordsFw];
    self.aw = [aDecoder decodeObjectForKey:kSLIDMWordsAw];
    self.n = [aDecoder decodeObjectForKey:kSLIDMWordsN];
    self.pic = [aDecoder decodeObjectForKey:kSLIDMWordsPic];
    self.c = [aDecoder decodeObjectForKey:kSLIDMWordsC];
    self.type = [aDecoder decodeObjectForKey:kSLIDMWordsType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_fw forKey:kSLIDMWordsFw];
    [aCoder encodeObject:_aw forKey:kSLIDMWordsAw];
    [aCoder encodeObject:_n forKey:kSLIDMWordsN];
    [aCoder encodeObject:_pic forKey:kSLIDMWordsPic];
    [aCoder encodeObject:_c forKey:kSLIDMWordsC];
    [aCoder encodeObject:_type forKey:kSLIDMWordsType];
}

- (id)copyWithZone:(NSZone *)zone
{
    SLIDMWords *copy = [[SLIDMWords alloc] init];
    
    if (copy) {

        copy.fw = [self.fw copyWithZone:zone];
        copy.aw = [self.aw copyWithZone:zone];
        copy.n = [self.n copyWithZone:zone];
        copy.pic = [self.pic copyWithZone:zone];
        copy.c = [self.c copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_fw release];
    [_aw release];
    [_n release];
    [_pic release];
    [_c release];
    [_type release];
    [super dealloc];
}

@end
