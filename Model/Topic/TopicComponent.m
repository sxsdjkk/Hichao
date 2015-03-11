//
//  TopicComponent.m
//
//  Created by zhiyou3g  on 15/3/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "TopicComponent.h"
#import "TopicAction.h"


NSString *const kTopicComponentAction = @"action";
NSString *const kTopicComponentComponentType = @"componentType";
NSString *const kTopicComponentContent = @"content";
NSString *const kTopicComponentStyle = @"style";
NSString *const kTopicComponentBorder = @"border";
NSString *const kTopicComponentFontSize = @"fontSize";
NSString *const kTopicComponentPicUrl = @"picUrl";
NSString *const kTopicComponentPrice = @"price";
NSString *const kTopicComponentAlign = @"align";


@interface TopicComponent ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TopicComponent

@synthesize action = _action;
@synthesize componentType = _componentType;
@synthesize content = _content;
@synthesize style = _style;
@synthesize border = _border;
@synthesize fontSize = _fontSize;
@synthesize picUrl = _picUrl;
@synthesize price = _price;
@synthesize align = _align;


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
            self.action = [TopicAction modelObjectWithDictionary:[dict objectForKey:kTopicComponentAction]];
            self.componentType = [self objectOrNilForKey:kTopicComponentComponentType fromDictionary:dict];
            self.content = [self objectOrNilForKey:kTopicComponentContent fromDictionary:dict];
            self.style = [self objectOrNilForKey:kTopicComponentStyle fromDictionary:dict];
            self.border = [self objectOrNilForKey:kTopicComponentBorder fromDictionary:dict];
            self.fontSize = [self objectOrNilForKey:kTopicComponentFontSize fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kTopicComponentPicUrl fromDictionary:dict];
            self.price = [self objectOrNilForKey:kTopicComponentPrice fromDictionary:dict];
            self.align = [self objectOrNilForKey:kTopicComponentAlign fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.action dictionaryRepresentation] forKey:kTopicComponentAction];
    [mutableDict setValue:self.componentType forKey:kTopicComponentComponentType];
    [mutableDict setValue:self.content forKey:kTopicComponentContent];
    [mutableDict setValue:self.style forKey:kTopicComponentStyle];
    [mutableDict setValue:self.border forKey:kTopicComponentBorder];
    [mutableDict setValue:self.fontSize forKey:kTopicComponentFontSize];
    [mutableDict setValue:self.picUrl forKey:kTopicComponentPicUrl];
    [mutableDict setValue:self.price forKey:kTopicComponentPrice];
    [mutableDict setValue:self.align forKey:kTopicComponentAlign];

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

    self.action = [aDecoder decodeObjectForKey:kTopicComponentAction];
    self.componentType = [aDecoder decodeObjectForKey:kTopicComponentComponentType];
    self.content = [aDecoder decodeObjectForKey:kTopicComponentContent];
    self.style = [aDecoder decodeObjectForKey:kTopicComponentStyle];
    self.border = [aDecoder decodeObjectForKey:kTopicComponentBorder];
    self.fontSize = [aDecoder decodeObjectForKey:kTopicComponentFontSize];
    self.picUrl = [aDecoder decodeObjectForKey:kTopicComponentPicUrl];
    self.price = [aDecoder decodeObjectForKey:kTopicComponentPrice];
    self.align = [aDecoder decodeObjectForKey:kTopicComponentAlign];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_action forKey:kTopicComponentAction];
    [aCoder encodeObject:_componentType forKey:kTopicComponentComponentType];
    [aCoder encodeObject:_content forKey:kTopicComponentContent];
    [aCoder encodeObject:_style forKey:kTopicComponentStyle];
    [aCoder encodeObject:_border forKey:kTopicComponentBorder];
    [aCoder encodeObject:_fontSize forKey:kTopicComponentFontSize];
    [aCoder encodeObject:_picUrl forKey:kTopicComponentPicUrl];
    [aCoder encodeObject:_price forKey:kTopicComponentPrice];
    [aCoder encodeObject:_align forKey:kTopicComponentAlign];
}

- (id)copyWithZone:(NSZone *)zone
{
    TopicComponent *copy = [[TopicComponent alloc] init];
    
    if (copy) {

        copy.action = [self.action copyWithZone:zone];
        copy.componentType = [self.componentType copyWithZone:zone];
        copy.content = [self.content copyWithZone:zone];
        copy.style = [self.style copyWithZone:zone];
        copy.border = [self.border copyWithZone:zone];
        copy.fontSize = [self.fontSize copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.price = [self.price copyWithZone:zone];
        copy.align = [self.align copyWithZone:zone];
    }
    
    return copy;
}


@end
