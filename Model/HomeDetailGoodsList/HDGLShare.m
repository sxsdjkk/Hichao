//
//  HDGLShare.m
//
//  Created by   on 15/3/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "HDGLShare.h"


NSString *const kHDGLShareTypeId = @"typeId";
NSString *const kHDGLShareShareType = @"shareType";
NSString *const kHDGLSharePicUrl = @"picUrl";
NSString *const kHDGLShareDetailUrl = @"detailUrl";
NSString *const kHDGLShareTitle = @"title";
NSString *const kHDGLShareTrackValue = @"trackValue";
NSString *const kHDGLShareDescription = @"description";
NSString *const kHDGLShareType = @"type";


@interface HDGLShare ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HDGLShare

@synthesize typeId = _typeId;
@synthesize shareType = _shareType;
@synthesize picUrl = _picUrl;
@synthesize detailUrl = _detailUrl;
@synthesize title = _title;
@synthesize trackValue = _trackValue;
@synthesize shareDescription = _shareDescription;
@synthesize type = _type;


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
            self.typeId = [self objectOrNilForKey:kHDGLShareTypeId fromDictionary:dict];
            self.shareType = [self objectOrNilForKey:kHDGLShareShareType fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kHDGLSharePicUrl fromDictionary:dict];
            self.detailUrl = [self objectOrNilForKey:kHDGLShareDetailUrl fromDictionary:dict];
            self.title = [self objectOrNilForKey:kHDGLShareTitle fromDictionary:dict];
            self.trackValue = [self objectOrNilForKey:kHDGLShareTrackValue fromDictionary:dict];
            self.shareDescription = [self objectOrNilForKey:kHDGLShareDescription fromDictionary:dict];
            self.type = [self objectOrNilForKey:kHDGLShareType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.typeId forKey:kHDGLShareTypeId];
    [mutableDict setValue:self.shareType forKey:kHDGLShareShareType];
    [mutableDict setValue:self.picUrl forKey:kHDGLSharePicUrl];
    [mutableDict setValue:self.detailUrl forKey:kHDGLShareDetailUrl];
    [mutableDict setValue:self.title forKey:kHDGLShareTitle];
    [mutableDict setValue:self.trackValue forKey:kHDGLShareTrackValue];
    [mutableDict setValue:self.shareDescription forKey:kHDGLShareDescription];
    [mutableDict setValue:self.type forKey:kHDGLShareType];

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

    self.typeId = [aDecoder decodeObjectForKey:kHDGLShareTypeId];
    self.shareType = [aDecoder decodeObjectForKey:kHDGLShareShareType];
    self.picUrl = [aDecoder decodeObjectForKey:kHDGLSharePicUrl];
    self.detailUrl = [aDecoder decodeObjectForKey:kHDGLShareDetailUrl];
    self.title = [aDecoder decodeObjectForKey:kHDGLShareTitle];
    self.trackValue = [aDecoder decodeObjectForKey:kHDGLShareTrackValue];
    self.shareDescription = [aDecoder decodeObjectForKey:kHDGLShareDescription];
    self.type = [aDecoder decodeObjectForKey:kHDGLShareType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_typeId forKey:kHDGLShareTypeId];
    [aCoder encodeObject:_shareType forKey:kHDGLShareShareType];
    [aCoder encodeObject:_picUrl forKey:kHDGLSharePicUrl];
    [aCoder encodeObject:_detailUrl forKey:kHDGLShareDetailUrl];
    [aCoder encodeObject:_title forKey:kHDGLShareTitle];
    [aCoder encodeObject:_trackValue forKey:kHDGLShareTrackValue];
    [aCoder encodeObject:_shareDescription forKey:kHDGLShareDescription];
    [aCoder encodeObject:_type forKey:kHDGLShareType];
}

- (id)copyWithZone:(NSZone *)zone
{
    HDGLShare *copy = [[HDGLShare alloc] init];
    
    if (copy) {

        copy.typeId = [self.typeId copyWithZone:zone];
        copy.shareType = [self.shareType copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.detailUrl = [self.detailUrl copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.trackValue = [self.trackValue copyWithZone:zone];
        copy.shareDescription = [self.shareDescription copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_typeId release];
    [_shareType release];
    [_picUrl release];
    [_detailUrl release];
    [_title release];
    [_trackValue release];
    [_shareDescription release];
    [_type release];
    [super dealloc];
}

@end
