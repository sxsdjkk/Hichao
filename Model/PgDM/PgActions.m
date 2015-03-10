//
//  PgActions.m
//
//  Created by   on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "PgActions.h"


NSString *const kPgActionsId = @"id";
NSString *const kPgActionsUserAvatar = @"userAvatar";
NSString *const kPgActionsActionType = @"actionType";
NSString *const kPgActionsType = @"type";
NSString *const kPgActionsUserId = @"userId";
NSString *const kPgActionsUserName = @"userName";


@interface PgActions ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PgActions

@synthesize actionsIdentifier = _actionsIdentifier;
@synthesize userAvatar = _userAvatar;
@synthesize actionType = _actionType;
@synthesize type = _type;
@synthesize userId = _userId;
@synthesize userName = _userName;


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
            self.actionsIdentifier = [self objectOrNilForKey:kPgActionsId fromDictionary:dict];
            self.userAvatar = [self objectOrNilForKey:kPgActionsUserAvatar fromDictionary:dict];
            self.actionType = [self objectOrNilForKey:kPgActionsActionType fromDictionary:dict];
            self.type = [self objectOrNilForKey:kPgActionsType fromDictionary:dict];
            self.userId = [self objectOrNilForKey:kPgActionsUserId fromDictionary:dict];
            self.userName = [self objectOrNilForKey:kPgActionsUserName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.actionsIdentifier forKey:kPgActionsId];
    [mutableDict setValue:self.userAvatar forKey:kPgActionsUserAvatar];
    [mutableDict setValue:self.actionType forKey:kPgActionsActionType];
    [mutableDict setValue:self.type forKey:kPgActionsType];
    [mutableDict setValue:self.userId forKey:kPgActionsUserId];
    [mutableDict setValue:self.userName forKey:kPgActionsUserName];

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

    self.actionsIdentifier = [aDecoder decodeObjectForKey:kPgActionsId];
    self.userAvatar = [aDecoder decodeObjectForKey:kPgActionsUserAvatar];
    self.actionType = [aDecoder decodeObjectForKey:kPgActionsActionType];
    self.type = [aDecoder decodeObjectForKey:kPgActionsType];
    self.userId = [aDecoder decodeObjectForKey:kPgActionsUserId];
    self.userName = [aDecoder decodeObjectForKey:kPgActionsUserName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_actionsIdentifier forKey:kPgActionsId];
    [aCoder encodeObject:_userAvatar forKey:kPgActionsUserAvatar];
    [aCoder encodeObject:_actionType forKey:kPgActionsActionType];
    [aCoder encodeObject:_type forKey:kPgActionsType];
    [aCoder encodeObject:_userId forKey:kPgActionsUserId];
    [aCoder encodeObject:_userName forKey:kPgActionsUserName];
}

- (id)copyWithZone:(NSZone *)zone
{
    PgActions *copy = [[PgActions alloc] init];
    
    if (copy) {

        copy.actionsIdentifier = [self.actionsIdentifier copyWithZone:zone];
        copy.userAvatar = [self.userAvatar copyWithZone:zone];
        copy.actionType = [self.actionType copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.userId = [self.userId copyWithZone:zone];
        copy.userName = [self.userName copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_actionsIdentifier release];
    [_userAvatar release];
    [_actionType release];
    [_type release];
    [_userId release];
    [_userName release];
    [super dealloc];
}

@end
