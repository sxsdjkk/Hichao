//
//  HVCDComponent.m
//
//  Created by   on 15/3/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "HVCDComponent.h"
#import "HVCDAction.h"


NSString *const kHVCDComponentPicUrl = @"picUrl";
NSString *const kHVCDComponentAction = @"action";
NSString *const kHVCDComponentHeight = @"height";
NSString *const kHVCDComponentComponentType = @"componentType";
NSString *const kHVCDComponentPrice = @"price";
NSString *const kHVCDComponentSourceTitle = @"sourceTitle";
NSString *const kHVCDComponentWidth = @"width";
NSString *const kHVCDComponentId = @"id";
NSString *const kHVCDComponentCollectionCount = @"collectionCount";
NSString *const kHVCDComponentSourcePicUrl = @"sourcePicUrl";


@interface HVCDComponent ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HVCDComponent

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
            self.picUrl = [self objectOrNilForKey:kHVCDComponentPicUrl fromDictionary:dict];
            self.action = [HVCDAction modelObjectWithDictionary:[dict objectForKey:kHVCDComponentAction]];
            self.height = [self objectOrNilForKey:kHVCDComponentHeight fromDictionary:dict];
            self.componentType = [self objectOrNilForKey:kHVCDComponentComponentType fromDictionary:dict];
            self.price = [self objectOrNilForKey:kHVCDComponentPrice fromDictionary:dict];
            self.sourceTitle = [self objectOrNilForKey:kHVCDComponentSourceTitle fromDictionary:dict];
            self.width = [self objectOrNilForKey:kHVCDComponentWidth fromDictionary:dict];
            self.componentIdentifier = [self objectOrNilForKey:kHVCDComponentId fromDictionary:dict];
            self.collectionCount = [self objectOrNilForKey:kHVCDComponentCollectionCount fromDictionary:dict];
            self.sourcePicUrl = [self objectOrNilForKey:kHVCDComponentSourcePicUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.picUrl forKey:kHVCDComponentPicUrl];
    [mutableDict setValue:[self.action dictionaryRepresentation] forKey:kHVCDComponentAction];
    [mutableDict setValue:self.height forKey:kHVCDComponentHeight];
    [mutableDict setValue:self.componentType forKey:kHVCDComponentComponentType];
    [mutableDict setValue:self.price forKey:kHVCDComponentPrice];
    [mutableDict setValue:self.sourceTitle forKey:kHVCDComponentSourceTitle];
    [mutableDict setValue:self.width forKey:kHVCDComponentWidth];
    [mutableDict setValue:self.componentIdentifier forKey:kHVCDComponentId];
    [mutableDict setValue:self.collectionCount forKey:kHVCDComponentCollectionCount];
    [mutableDict setValue:self.sourcePicUrl forKey:kHVCDComponentSourcePicUrl];

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

    self.picUrl = [aDecoder decodeObjectForKey:kHVCDComponentPicUrl];
    self.action = [aDecoder decodeObjectForKey:kHVCDComponentAction];
    self.height = [aDecoder decodeObjectForKey:kHVCDComponentHeight];
    self.componentType = [aDecoder decodeObjectForKey:kHVCDComponentComponentType];
    self.price = [aDecoder decodeObjectForKey:kHVCDComponentPrice];
    self.sourceTitle = [aDecoder decodeObjectForKey:kHVCDComponentSourceTitle];
    self.width = [aDecoder decodeObjectForKey:kHVCDComponentWidth];
    self.componentIdentifier = [aDecoder decodeObjectForKey:kHVCDComponentId];
    self.collectionCount = [aDecoder decodeObjectForKey:kHVCDComponentCollectionCount];
    self.sourcePicUrl = [aDecoder decodeObjectForKey:kHVCDComponentSourcePicUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_picUrl forKey:kHVCDComponentPicUrl];
    [aCoder encodeObject:_action forKey:kHVCDComponentAction];
    [aCoder encodeObject:_height forKey:kHVCDComponentHeight];
    [aCoder encodeObject:_componentType forKey:kHVCDComponentComponentType];
    [aCoder encodeObject:_price forKey:kHVCDComponentPrice];
    [aCoder encodeObject:_sourceTitle forKey:kHVCDComponentSourceTitle];
    [aCoder encodeObject:_width forKey:kHVCDComponentWidth];
    [aCoder encodeObject:_componentIdentifier forKey:kHVCDComponentId];
    [aCoder encodeObject:_collectionCount forKey:kHVCDComponentCollectionCount];
    [aCoder encodeObject:_sourcePicUrl forKey:kHVCDComponentSourcePicUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    HVCDComponent *copy = [[HVCDComponent alloc] init];
    
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
