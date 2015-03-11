//
//  HDGLComponent.m
//
//  Created by   on 15/3/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "HDGLComponent.h"
#import "HDGLAction.h"


NSString *const kHDGLComponentPicUrl = @"picUrl";
NSString *const kHDGLComponentAction = @"action";
NSString *const kHDGLComponentHeight = @"height";
NSString *const kHDGLComponentComponentType = @"componentType";
NSString *const kHDGLComponentPrice = @"price";
NSString *const kHDGLComponentSourceTitle = @"sourceTitle";
NSString *const kHDGLComponentWidth = @"width";
NSString *const kHDGLComponentId = @"id";
NSString *const kHDGLComponentCollectionCount = @"collectionCount";
NSString *const kHDGLComponentSourcePicUrl = @"sourcePicUrl";


@interface HDGLComponent ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HDGLComponent

@synthesize picUrl = _picUrl;
@synthesize action = _action;
@synthesize height = _height;
@synthesize componentType = _componentType;
@synthesize price = _price;
@synthesize sourceTitle = _sourceTitle;
@synthesize width = _width;
@synthesize componentIdentifier = _componentIdentifier;
@synthesize collectionCount = _collectionCount;
@synthesize sourcePicUrl = _sourcePicUrl;


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
            self.picUrl = [self objectOrNilForKey:kHDGLComponentPicUrl fromDictionary:dict];
            self.action = [HDGLAction modelObjectWithDictionary:[dict objectForKey:kHDGLComponentAction]];
            self.height = [self objectOrNilForKey:kHDGLComponentHeight fromDictionary:dict];
            self.componentType = [self objectOrNilForKey:kHDGLComponentComponentType fromDictionary:dict];
            self.price = [self objectOrNilForKey:kHDGLComponentPrice fromDictionary:dict];
            self.sourceTitle = [self objectOrNilForKey:kHDGLComponentSourceTitle fromDictionary:dict];
            self.width = [self objectOrNilForKey:kHDGLComponentWidth fromDictionary:dict];
            self.componentIdentifier = [self objectOrNilForKey:kHDGLComponentId fromDictionary:dict];
            self.collectionCount = [self objectOrNilForKey:kHDGLComponentCollectionCount fromDictionary:dict];
            self.sourcePicUrl = [self objectOrNilForKey:kHDGLComponentSourcePicUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.picUrl forKey:kHDGLComponentPicUrl];
    [mutableDict setValue:[self.action dictionaryRepresentation] forKey:kHDGLComponentAction];
    [mutableDict setValue:self.height forKey:kHDGLComponentHeight];
    [mutableDict setValue:self.componentType forKey:kHDGLComponentComponentType];
    [mutableDict setValue:self.price forKey:kHDGLComponentPrice];
    [mutableDict setValue:self.sourceTitle forKey:kHDGLComponentSourceTitle];
    [mutableDict setValue:self.width forKey:kHDGLComponentWidth];
    [mutableDict setValue:self.componentIdentifier forKey:kHDGLComponentId];
    [mutableDict setValue:self.collectionCount forKey:kHDGLComponentCollectionCount];
    [mutableDict setValue:self.sourcePicUrl forKey:kHDGLComponentSourcePicUrl];

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

    self.picUrl = [aDecoder decodeObjectForKey:kHDGLComponentPicUrl];
    self.action = [aDecoder decodeObjectForKey:kHDGLComponentAction];
    self.height = [aDecoder decodeObjectForKey:kHDGLComponentHeight];
    self.componentType = [aDecoder decodeObjectForKey:kHDGLComponentComponentType];
    self.price = [aDecoder decodeObjectForKey:kHDGLComponentPrice];
    self.sourceTitle = [aDecoder decodeObjectForKey:kHDGLComponentSourceTitle];
    self.width = [aDecoder decodeObjectForKey:kHDGLComponentWidth];
    self.componentIdentifier = [aDecoder decodeObjectForKey:kHDGLComponentId];
    self.collectionCount = [aDecoder decodeObjectForKey:kHDGLComponentCollectionCount];
    self.sourcePicUrl = [aDecoder decodeObjectForKey:kHDGLComponentSourcePicUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_picUrl forKey:kHDGLComponentPicUrl];
    [aCoder encodeObject:_action forKey:kHDGLComponentAction];
    [aCoder encodeObject:_height forKey:kHDGLComponentHeight];
    [aCoder encodeObject:_componentType forKey:kHDGLComponentComponentType];
    [aCoder encodeObject:_price forKey:kHDGLComponentPrice];
    [aCoder encodeObject:_sourceTitle forKey:kHDGLComponentSourceTitle];
    [aCoder encodeObject:_width forKey:kHDGLComponentWidth];
    [aCoder encodeObject:_componentIdentifier forKey:kHDGLComponentId];
    [aCoder encodeObject:_collectionCount forKey:kHDGLComponentCollectionCount];
    [aCoder encodeObject:_sourcePicUrl forKey:kHDGLComponentSourcePicUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    HDGLComponent *copy = [[HDGLComponent alloc] init];
    
    if (copy) {

        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.action = [self.action copyWithZone:zone];
        copy.height = [self.height copyWithZone:zone];
        copy.componentType = [self.componentType copyWithZone:zone];
        copy.price = [self.price copyWithZone:zone];
        copy.sourceTitle = [self.sourceTitle copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.componentIdentifier = [self.componentIdentifier copyWithZone:zone];
        copy.collectionCount = [self.collectionCount copyWithZone:zone];
        copy.sourcePicUrl = [self.sourcePicUrl copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_picUrl release];
    [_action release];
    [_height release];
    [_componentType release];
    [_price release];
    [_sourceTitle release];
    [_width release];
    [_componentIdentifier release];
    [_collectionCount release];
    [_sourcePicUrl release];
    [super dealloc];
}

@end
