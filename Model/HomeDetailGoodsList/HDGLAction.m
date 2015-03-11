//
//  HDGLAction.m
//
//  Created by   on 15/3/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "HDGLAction.h"
#import "HDGLShareAction.h"
#import "HDGLTitleStyle.h"


NSString *const kHDGLActionId = @"id";
NSString *const kHDGLActionDescription = @"description";
NSString *const kHDGLActionChannel = @"channel";
NSString *const kHDGLActionLink = @"link";
NSString *const kHDGLActionSource = @"source";
NSString *const kHDGLActionShareAction = @"shareAction";
NSString *const kHDGLActionPrice = @"price";
NSString *const kHDGLActionCollectionCount = @"collectionCount";
NSString *const kHDGLActionActionType = @"actionType";
NSString *const kHDGLActionSourceId = @"source_id";
NSString *const kHDGLActionNormalPicUrl = @"normalPicUrl";
NSString *const kHDGLActionOriginLink = @"originLink";
NSString *const kHDGLActionTitleStyle = @"titleStyle";
NSString *const kHDGLActionChannelPicUrl = @"channelPicUrl";


@interface HDGLAction ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HDGLAction

@synthesize actionIdentifier = _actionIdentifier;
@synthesize actionDescription = _actionDescription;
@synthesize channel = _channel;
@synthesize link = _link;
@synthesize source = _source;
@synthesize shareAction = _shareAction;
@synthesize price = _price;
@synthesize collectionCount = _collectionCount;
@synthesize actionType = _actionType;
@synthesize sourceId = _sourceId;
@synthesize normalPicUrl = _normalPicUrl;
@synthesize originLink = _originLink;
@synthesize titleStyle = _titleStyle;
@synthesize channelPicUrl = _channelPicUrl;


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
            self.actionIdentifier = [self objectOrNilForKey:kHDGLActionId fromDictionary:dict];
            self.actionDescription = [self objectOrNilForKey:kHDGLActionDescription fromDictionary:dict];
            self.channel = [self objectOrNilForKey:kHDGLActionChannel fromDictionary:dict];
            self.link = [self objectOrNilForKey:kHDGLActionLink fromDictionary:dict];
            self.source = [self objectOrNilForKey:kHDGLActionSource fromDictionary:dict];
            self.shareAction = [HDGLShareAction modelObjectWithDictionary:[dict objectForKey:kHDGLActionShareAction]];
            self.price = [self objectOrNilForKey:kHDGLActionPrice fromDictionary:dict];
            self.collectionCount = [self objectOrNilForKey:kHDGLActionCollectionCount fromDictionary:dict];
            self.actionType = [self objectOrNilForKey:kHDGLActionActionType fromDictionary:dict];
            self.sourceId = [self objectOrNilForKey:kHDGLActionSourceId fromDictionary:dict];
            self.normalPicUrl = [self objectOrNilForKey:kHDGLActionNormalPicUrl fromDictionary:dict];
            self.originLink = [self objectOrNilForKey:kHDGLActionOriginLink fromDictionary:dict];
            self.titleStyle = [HDGLTitleStyle modelObjectWithDictionary:[dict objectForKey:kHDGLActionTitleStyle]];
            self.channelPicUrl = [self objectOrNilForKey:kHDGLActionChannelPicUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.actionIdentifier forKey:kHDGLActionId];
    [mutableDict setValue:self.actionDescription forKey:kHDGLActionDescription];
    [mutableDict setValue:self.channel forKey:kHDGLActionChannel];
    [mutableDict setValue:self.link forKey:kHDGLActionLink];
    [mutableDict setValue:self.source forKey:kHDGLActionSource];
    [mutableDict setValue:[self.shareAction dictionaryRepresentation] forKey:kHDGLActionShareAction];
    [mutableDict setValue:self.price forKey:kHDGLActionPrice];
    [mutableDict setValue:self.collectionCount forKey:kHDGLActionCollectionCount];
    [mutableDict setValue:self.actionType forKey:kHDGLActionActionType];
    [mutableDict setValue:self.sourceId forKey:kHDGLActionSourceId];
    [mutableDict setValue:self.normalPicUrl forKey:kHDGLActionNormalPicUrl];
    [mutableDict setValue:self.originLink forKey:kHDGLActionOriginLink];
    [mutableDict setValue:[self.titleStyle dictionaryRepresentation] forKey:kHDGLActionTitleStyle];
    [mutableDict setValue:self.channelPicUrl forKey:kHDGLActionChannelPicUrl];

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

    self.actionIdentifier = [aDecoder decodeObjectForKey:kHDGLActionId];
    self.actionDescription = [aDecoder decodeObjectForKey:kHDGLActionDescription];
    self.channel = [aDecoder decodeObjectForKey:kHDGLActionChannel];
    self.link = [aDecoder decodeObjectForKey:kHDGLActionLink];
    self.source = [aDecoder decodeObjectForKey:kHDGLActionSource];
    self.shareAction = [aDecoder decodeObjectForKey:kHDGLActionShareAction];
    self.price = [aDecoder decodeObjectForKey:kHDGLActionPrice];
    self.collectionCount = [aDecoder decodeObjectForKey:kHDGLActionCollectionCount];
    self.actionType = [aDecoder decodeObjectForKey:kHDGLActionActionType];
    self.sourceId = [aDecoder decodeObjectForKey:kHDGLActionSourceId];
    self.normalPicUrl = [aDecoder decodeObjectForKey:kHDGLActionNormalPicUrl];
    self.originLink = [aDecoder decodeObjectForKey:kHDGLActionOriginLink];
    self.titleStyle = [aDecoder decodeObjectForKey:kHDGLActionTitleStyle];
    self.channelPicUrl = [aDecoder decodeObjectForKey:kHDGLActionChannelPicUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_actionIdentifier forKey:kHDGLActionId];
    [aCoder encodeObject:_actionDescription forKey:kHDGLActionDescription];
    [aCoder encodeObject:_channel forKey:kHDGLActionChannel];
    [aCoder encodeObject:_link forKey:kHDGLActionLink];
    [aCoder encodeObject:_source forKey:kHDGLActionSource];
    [aCoder encodeObject:_shareAction forKey:kHDGLActionShareAction];
    [aCoder encodeObject:_price forKey:kHDGLActionPrice];
    [aCoder encodeObject:_collectionCount forKey:kHDGLActionCollectionCount];
    [aCoder encodeObject:_actionType forKey:kHDGLActionActionType];
    [aCoder encodeObject:_sourceId forKey:kHDGLActionSourceId];
    [aCoder encodeObject:_normalPicUrl forKey:kHDGLActionNormalPicUrl];
    [aCoder encodeObject:_originLink forKey:kHDGLActionOriginLink];
    [aCoder encodeObject:_titleStyle forKey:kHDGLActionTitleStyle];
    [aCoder encodeObject:_channelPicUrl forKey:kHDGLActionChannelPicUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    HDGLAction *copy = [[HDGLAction alloc] init];
    
    if (copy) {

        copy.actionIdentifier = [self.actionIdentifier copyWithZone:zone];
        copy.actionDescription = [self.actionDescription copyWithZone:zone];
        copy.channel = [self.channel copyWithZone:zone];
        copy.link = [self.link copyWithZone:zone];
        copy.source = [self.source copyWithZone:zone];
        copy.shareAction = [self.shareAction copyWithZone:zone];
        copy.price = [self.price copyWithZone:zone];
        copy.collectionCount = [self.collectionCount copyWithZone:zone];
        copy.actionType = [self.actionType copyWithZone:zone];
        copy.sourceId = [self.sourceId copyWithZone:zone];
        copy.normalPicUrl = [self.normalPicUrl copyWithZone:zone];
        copy.originLink = [self.originLink copyWithZone:zone];
        copy.titleStyle = [self.titleStyle copyWithZone:zone];
        copy.channelPicUrl = [self.channelPicUrl copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_actionIdentifier release];
    [_actionDescription release];
    [_channel release];
    [_link release];
    [_source release];
    [_shareAction release];
    [_price release];
    [_collectionCount release];
    [_actionType release];
    [_sourceId release];
    [_normalPicUrl release];
    [_originLink release];
    [_titleStyle release];
    [_channelPicUrl release];
    [super dealloc];
}

@end
