//
//  SLIDMAction.m
//
//  Created by   on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SLIDMAction.h"


NSString *const kSLIDMActionQuery = @"query";
NSString *const kSLIDMActionActionType = @"actionType";
NSString *const kSLIDMActionTitle = @"title";


@interface SLIDMAction ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SLIDMAction

@synthesize query = _query;
@synthesize actionType = _actionType;
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
            self.query = [self objectOrNilForKey:kSLIDMActionQuery fromDictionary:dict];
            self.actionType = [self objectOrNilForKey:kSLIDMActionActionType fromDictionary:dict];
            self.title = [self objectOrNilForKey:kSLIDMActionTitle fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.query forKey:kSLIDMActionQuery];
    [mutableDict setValue:self.actionType forKey:kSLIDMActionActionType];
    [mutableDict setValue:self.title forKey:kSLIDMActionTitle];

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

    self.query = [aDecoder decodeObjectForKey:kSLIDMActionQuery];
    self.actionType = [aDecoder decodeObjectForKey:kSLIDMActionActionType];
    self.title = [aDecoder decodeObjectForKey:kSLIDMActionTitle];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_query forKey:kSLIDMActionQuery];
    [aCoder encodeObject:_actionType forKey:kSLIDMActionActionType];
    [aCoder encodeObject:_title forKey:kSLIDMActionTitle];
}

- (id)copyWithZone:(NSZone *)zone
{
    SLIDMAction *copy = [[SLIDMAction alloc] init];
    
    if (copy) {

        copy.query = [self.query copyWithZone:zone];
        copy.actionType = [self.actionType copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_query release];
    [_actionType release];
    [_title release];
    [super dealloc];
}

@end
