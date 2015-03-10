//
//  SLIDMComponent.m
//
//  Created by   on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SLIDMComponent.h"
#import "SLIDMAction.h"


NSString *const kSLIDMComponentWord = @"word";
NSString *const kSLIDMComponentComponentType = @"componentType";
NSString *const kSLIDMComponentAction = @"action";
NSString *const kSLIDMComponentPicUrl = @"picUrl";


@interface SLIDMComponent ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SLIDMComponent

@synthesize word = _word;
@synthesize componentType = _componentType;
@synthesize action = _action;
@synthesize picUrl = _picUrl;


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
            self.word = [self objectOrNilForKey:kSLIDMComponentWord fromDictionary:dict];
            self.componentType = [self objectOrNilForKey:kSLIDMComponentComponentType fromDictionary:dict];
            self.action = [SLIDMAction modelObjectWithDictionary:[dict objectForKey:kSLIDMComponentAction]];
            self.picUrl = [self objectOrNilForKey:kSLIDMComponentPicUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.word forKey:kSLIDMComponentWord];
    [mutableDict setValue:self.componentType forKey:kSLIDMComponentComponentType];
    [mutableDict setValue:[self.action dictionaryRepresentation] forKey:kSLIDMComponentAction];
    [mutableDict setValue:self.picUrl forKey:kSLIDMComponentPicUrl];

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

    self.word = [aDecoder decodeObjectForKey:kSLIDMComponentWord];
    self.componentType = [aDecoder decodeObjectForKey:kSLIDMComponentComponentType];
    self.action = [aDecoder decodeObjectForKey:kSLIDMComponentAction];
    self.picUrl = [aDecoder decodeObjectForKey:kSLIDMComponentPicUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_word forKey:kSLIDMComponentWord];
    [aCoder encodeObject:_componentType forKey:kSLIDMComponentComponentType];
    [aCoder encodeObject:_action forKey:kSLIDMComponentAction];
    [aCoder encodeObject:_picUrl forKey:kSLIDMComponentPicUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    SLIDMComponent *copy = [[SLIDMComponent alloc] init];
    
    if (copy) {

        copy.word = [self.word copyWithZone:zone];
        copy.componentType = [self.componentType copyWithZone:zone];
        copy.action = [self.action copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_word release];
    [_componentType release];
    [_action release];
    [_picUrl release];
    [super dealloc];
}

@end
