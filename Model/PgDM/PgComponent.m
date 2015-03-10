//
//  PgComponent.m
//
//  Created by   on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "PgComponent.h"
#import "PgActions.h"


NSString *const kPgComponentId = @"id";
NSString *const kPgComponentUserAvatar = @"userAvatar";
NSString *const kPgComponentPublishDate = @"publishDate";
NSString *const kPgComponentActions = @"actions";
NSString *const kPgComponentPics = @"pics";
NSString *const kPgComponentForum = @"forum";
NSString *const kPgComponentComponentType = @"componentType";
NSString *const kPgComponentUserId = @"userId";
NSString *const kPgComponentUserName = @"userName";
NSString *const kPgComponentTitle = @"title";
NSString *const kPgComponentCommentCount = @"commentCount";
NSString *const kPgComponentShowIcon = @"showIcon";
NSString *const kPgComponentV = @"v";
NSString *const kPgComponentForumId = @"forumId";


@interface PgComponent ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PgComponent

@synthesize componentIdentifier = _componentIdentifier;
@synthesize userAvatar = _userAvatar;
@synthesize publishDate = _publishDate;
@synthesize actions = _actions;
@synthesize pics = _pics;
@synthesize forum = _forum;
@synthesize componentType = _componentType;
@synthesize userId = _userId;
@synthesize userName = _userName;
@synthesize title = _title;
@synthesize commentCount = _commentCount;
@synthesize showIcon = _showIcon;
@synthesize v = _v;
@synthesize forumId = _forumId;


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
            self.componentIdentifier = [self objectOrNilForKey:kPgComponentId fromDictionary:dict];
            self.userAvatar = [self objectOrNilForKey:kPgComponentUserAvatar fromDictionary:dict];
            self.publishDate = [self objectOrNilForKey:kPgComponentPublishDate fromDictionary:dict];
    NSObject *receivedPgActions = [dict objectForKey:kPgComponentActions];
    NSMutableArray *parsedPgActions = [NSMutableArray array];
    if ([receivedPgActions isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedPgActions) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPgActions addObject:[PgActions modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedPgActions isKindOfClass:[NSDictionary class]]) {
       [parsedPgActions addObject:[PgActions modelObjectWithDictionary:(NSDictionary *)receivedPgActions]];
    }

    self.actions = [NSArray arrayWithArray:parsedPgActions];
            self.pics = [self objectOrNilForKey:kPgComponentPics fromDictionary:dict];
            self.forum = [self objectOrNilForKey:kPgComponentForum fromDictionary:dict];
            self.componentType = [self objectOrNilForKey:kPgComponentComponentType fromDictionary:dict];
            self.userId = [self objectOrNilForKey:kPgComponentUserId fromDictionary:dict];
            self.userName = [self objectOrNilForKey:kPgComponentUserName fromDictionary:dict];
            self.title = [self objectOrNilForKey:kPgComponentTitle fromDictionary:dict];
            self.commentCount = [self objectOrNilForKey:kPgComponentCommentCount fromDictionary:dict];
            self.showIcon = [self objectOrNilForKey:kPgComponentShowIcon fromDictionary:dict];
            self.v = [self objectOrNilForKey:kPgComponentV fromDictionary:dict];
            self.forumId = [self objectOrNilForKey:kPgComponentForumId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.componentIdentifier forKey:kPgComponentId];
    [mutableDict setValue:self.userAvatar forKey:kPgComponentUserAvatar];
    [mutableDict setValue:self.publishDate forKey:kPgComponentPublishDate];
    NSMutableArray *tempArrayForActions = [NSMutableArray array];
    for (NSObject *subArrayObject in self.actions) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForActions addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForActions addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForActions] forKey:kPgComponentActions];
    NSMutableArray *tempArrayForPics = [NSMutableArray array];
    for (NSObject *subArrayObject in self.pics) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPics addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPics addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPics] forKey:kPgComponentPics];
    [mutableDict setValue:self.forum forKey:kPgComponentForum];
    [mutableDict setValue:self.componentType forKey:kPgComponentComponentType];
    [mutableDict setValue:self.userId forKey:kPgComponentUserId];
    [mutableDict setValue:self.userName forKey:kPgComponentUserName];
    [mutableDict setValue:self.title forKey:kPgComponentTitle];
    [mutableDict setValue:self.commentCount forKey:kPgComponentCommentCount];
    [mutableDict setValue:self.showIcon forKey:kPgComponentShowIcon];
    [mutableDict setValue:self.v forKey:kPgComponentV];
    [mutableDict setValue:self.forumId forKey:kPgComponentForumId];

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

    self.componentIdentifier = [aDecoder decodeObjectForKey:kPgComponentId];
    self.userAvatar = [aDecoder decodeObjectForKey:kPgComponentUserAvatar];
    self.publishDate = [aDecoder decodeObjectForKey:kPgComponentPublishDate];
    self.actions = [aDecoder decodeObjectForKey:kPgComponentActions];
    self.pics = [aDecoder decodeObjectForKey:kPgComponentPics];
    self.forum = [aDecoder decodeObjectForKey:kPgComponentForum];
    self.componentType = [aDecoder decodeObjectForKey:kPgComponentComponentType];
    self.userId = [aDecoder decodeObjectForKey:kPgComponentUserId];
    self.userName = [aDecoder decodeObjectForKey:kPgComponentUserName];
    self.title = [aDecoder decodeObjectForKey:kPgComponentTitle];
    self.commentCount = [aDecoder decodeObjectForKey:kPgComponentCommentCount];
    self.showIcon = [aDecoder decodeObjectForKey:kPgComponentShowIcon];
    self.v = [aDecoder decodeObjectForKey:kPgComponentV];
    self.forumId = [aDecoder decodeObjectForKey:kPgComponentForumId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_componentIdentifier forKey:kPgComponentId];
    [aCoder encodeObject:_userAvatar forKey:kPgComponentUserAvatar];
    [aCoder encodeObject:_publishDate forKey:kPgComponentPublishDate];
    [aCoder encodeObject:_actions forKey:kPgComponentActions];
    [aCoder encodeObject:_pics forKey:kPgComponentPics];
    [aCoder encodeObject:_forum forKey:kPgComponentForum];
    [aCoder encodeObject:_componentType forKey:kPgComponentComponentType];
    [aCoder encodeObject:_userId forKey:kPgComponentUserId];
    [aCoder encodeObject:_userName forKey:kPgComponentUserName];
    [aCoder encodeObject:_title forKey:kPgComponentTitle];
    [aCoder encodeObject:_commentCount forKey:kPgComponentCommentCount];
    [aCoder encodeObject:_showIcon forKey:kPgComponentShowIcon];
    [aCoder encodeObject:_v forKey:kPgComponentV];
    [aCoder encodeObject:_forumId forKey:kPgComponentForumId];
}

- (id)copyWithZone:(NSZone *)zone
{
    PgComponent *copy = [[PgComponent alloc] init];
    
    if (copy) {

        copy.componentIdentifier = [self.componentIdentifier copyWithZone:zone];
        copy.userAvatar = [self.userAvatar copyWithZone:zone];
        copy.publishDate = [self.publishDate copyWithZone:zone];
        copy.actions = [self.actions copyWithZone:zone];
        copy.pics = [self.pics copyWithZone:zone];
        copy.forum = [self.forum copyWithZone:zone];
        copy.componentType = [self.componentType copyWithZone:zone];
        copy.userId = [self.userId copyWithZone:zone];
        copy.userName = [self.userName copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.commentCount = [self.commentCount copyWithZone:zone];
        copy.showIcon = [self.showIcon copyWithZone:zone];
        copy.v = [self.v copyWithZone:zone];
        copy.forumId = [self.forumId copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_componentIdentifier release];
    [_userAvatar release];
    [_publishDate release];
    [_actions release];
    [_pics release];
    [_forum release];
    [_componentType release];
    [_userId release];
    [_userName release];
    [_title release];
    [_commentCount release];
    [_showIcon release];
    [_v release];
    [_forumId release];
    [super dealloc];
}

@end
