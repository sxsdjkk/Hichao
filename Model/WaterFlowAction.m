//
//  WaterFlowAction.m
//
//  Created by zhiyou3g  on 15/3/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "WaterFlowAction.h"


NSString *const kWaterFlowActionActionType = @"actionType";
NSString *const kWaterFlowActionHeight = @"height";
NSString *const kWaterFlowActionId = @"id";
NSString *const kWaterFlowActionWidth = @"width";
NSString *const kWaterFlowActionTrackValue = @"trackValue";
NSString *const kWaterFlowActionNormalPicUrl = @"normalPicUrl";
NSString *const kWaterFlowActionType = @"type";
NSString *const kWaterFlowActionCommentCount = @"commentCount";


@interface WaterFlowAction ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WaterFlowAction

@synthesize actionType = _actionType;
@synthesize height = _height;
@synthesize actionIdentifier = _actionIdentifier;
@synthesize width = _width;
@synthesize trackValue = _trackValue;
@synthesize normalPicUrl = _normalPicUrl;
@synthesize type = _type;
@synthesize commentCount = _commentCount;


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
            self.actionType = [self objectOrNilForKey:kWaterFlowActionActionType fromDictionary:dict];
            self.height = [self objectOrNilForKey:kWaterFlowActionHeight fromDictionary:dict];
            self.actionIdentifier = [self objectOrNilForKey:kWaterFlowActionId fromDictionary:dict];
            self.width = [self objectOrNilForKey:kWaterFlowActionWidth fromDictionary:dict];
            self.trackValue = [self objectOrNilForKey:kWaterFlowActionTrackValue fromDictionary:dict];
            self.normalPicUrl = [self objectOrNilForKey:kWaterFlowActionNormalPicUrl fromDictionary:dict];
            self.type = [self objectOrNilForKey:kWaterFlowActionType fromDictionary:dict];
            self.commentCount = [self objectOrNilForKey:kWaterFlowActionCommentCount fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.actionType forKey:kWaterFlowActionActionType];
    [mutableDict setValue:self.height forKey:kWaterFlowActionHeight];
    [mutableDict setValue:self.actionIdentifier forKey:kWaterFlowActionId];
    [mutableDict setValue:self.width forKey:kWaterFlowActionWidth];
    [mutableDict setValue:self.trackValue forKey:kWaterFlowActionTrackValue];
    [mutableDict setValue:self.normalPicUrl forKey:kWaterFlowActionNormalPicUrl];
    [mutableDict setValue:self.type forKey:kWaterFlowActionType];
    [mutableDict setValue:self.commentCount forKey:kWaterFlowActionCommentCount];

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

    self.actionType = [aDecoder decodeObjectForKey:kWaterFlowActionActionType];
    self.height = [aDecoder decodeObjectForKey:kWaterFlowActionHeight];
    self.actionIdentifier = [aDecoder decodeObjectForKey:kWaterFlowActionId];
    self.width = [aDecoder decodeObjectForKey:kWaterFlowActionWidth];
    self.trackValue = [aDecoder decodeObjectForKey:kWaterFlowActionTrackValue];
    self.normalPicUrl = [aDecoder decodeObjectForKey:kWaterFlowActionNormalPicUrl];
    self.type = [aDecoder decodeObjectForKey:kWaterFlowActionType];
    self.commentCount = [aDecoder decodeObjectForKey:kWaterFlowActionCommentCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_actionType forKey:kWaterFlowActionActionType];
    [aCoder encodeObject:_height forKey:kWaterFlowActionHeight];
    [aCoder encodeObject:_actionIdentifier forKey:kWaterFlowActionId];
    [aCoder encodeObject:_width forKey:kWaterFlowActionWidth];
    [aCoder encodeObject:_trackValue forKey:kWaterFlowActionTrackValue];
    [aCoder encodeObject:_normalPicUrl forKey:kWaterFlowActionNormalPicUrl];
    [aCoder encodeObject:_type forKey:kWaterFlowActionType];
    [aCoder encodeObject:_commentCount forKey:kWaterFlowActionCommentCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    WaterFlowAction *copy = [[WaterFlowAction alloc] init];
    
    if (copy) {

        copy.actionType = [self.actionType copyWithZone:zone];
        copy.height = [self.height copyWithZone:zone];
        copy.actionIdentifier = [self.actionIdentifier copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.trackValue = [self.trackValue copyWithZone:zone];
        copy.normalPicUrl = [self.normalPicUrl copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.commentCount = [self.commentCount copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_actionType release];
    [_height release];
    [_actionIdentifier release];
    [_width release];
    [_trackValue release];
    [_normalPicUrl release];
    [_type release];
    [_commentCount release];
    [super dealloc];
}

@end
