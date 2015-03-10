//
//  HStarAction.m
//
//  Created by   on 15/3/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "HStarAction.h"


NSString *const kHStarActionActionType = @"actionType";
NSString *const kHStarActionTrackValue = @"trackValue";


@interface HStarAction ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HStarAction

@synthesize actionType = _actionType;
@synthesize trackValue = _trackValue;


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
            self.actionType = [self objectOrNilForKey:kHStarActionActionType fromDictionary:dict];
            self.trackValue = [self objectOrNilForKey:kHStarActionTrackValue fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.actionType forKey:kHStarActionActionType];
    [mutableDict setValue:self.trackValue forKey:kHStarActionTrackValue];

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

    self.actionType = [aDecoder decodeObjectForKey:kHStarActionActionType];
    self.trackValue = [aDecoder decodeObjectForKey:kHStarActionTrackValue];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_actionType forKey:kHStarActionActionType];
    [aCoder encodeObject:_trackValue forKey:kHStarActionTrackValue];
}

- (id)copyWithZone:(NSZone *)zone
{
    HStarAction *copy = [[HStarAction alloc] init];
    
    if (copy) {

        copy.actionType = [self.actionType copyWithZone:zone];
        copy.trackValue = [self.trackValue copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_actionType release];
    [_trackValue release];
    [super dealloc];
}

@end
