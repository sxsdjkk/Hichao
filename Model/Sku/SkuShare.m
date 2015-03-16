//
//  SkuShare.m
//
//  Created by zhiyou3g  on 3/16/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SkuShare.h"


NSString *const kSkuShareTypeId = @"typeId";
NSString *const kSkuShareShareType = @"shareType";
NSString *const kSkuSharePicUrl = @"picUrl";
NSString *const kSkuShareDetailUrl = @"detailUrl";
NSString *const kSkuShareTitle = @"title";
NSString *const kSkuShareTrackValue = @"trackValue";
NSString *const kSkuShareDescription = @"description";
NSString *const kSkuShareType = @"type";


@interface SkuShare ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SkuShare

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
            self.typeId = [self objectOrNilForKey:kSkuShareTypeId fromDictionary:dict];
            self.shareType = [self objectOrNilForKey:kSkuShareShareType fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kSkuSharePicUrl fromDictionary:dict];
            self.detailUrl = [self objectOrNilForKey:kSkuShareDetailUrl fromDictionary:dict];
            self.title = [self objectOrNilForKey:kSkuShareTitle fromDictionary:dict];
            self.trackValue = [self objectOrNilForKey:kSkuShareTrackValue fromDictionary:dict];
            self.shareDescription = [self objectOrNilForKey:kSkuShareDescription fromDictionary:dict];
            self.type = [self objectOrNilForKey:kSkuShareType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.typeId forKey:kSkuShareTypeId];
    [mutableDict setValue:self.shareType forKey:kSkuShareShareType];
    [mutableDict setValue:self.picUrl forKey:kSkuSharePicUrl];
    [mutableDict setValue:self.detailUrl forKey:kSkuShareDetailUrl];
    [mutableDict setValue:self.title forKey:kSkuShareTitle];
    [mutableDict setValue:self.trackValue forKey:kSkuShareTrackValue];
    [mutableDict setValue:self.shareDescription forKey:kSkuShareDescription];
    [mutableDict setValue:self.type forKey:kSkuShareType];

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

    self.typeId = [aDecoder decodeObjectForKey:kSkuShareTypeId];
    self.shareType = [aDecoder decodeObjectForKey:kSkuShareShareType];
    self.picUrl = [aDecoder decodeObjectForKey:kSkuSharePicUrl];
    self.detailUrl = [aDecoder decodeObjectForKey:kSkuShareDetailUrl];
    self.title = [aDecoder decodeObjectForKey:kSkuShareTitle];
    self.trackValue = [aDecoder decodeObjectForKey:kSkuShareTrackValue];
    self.shareDescription = [aDecoder decodeObjectForKey:kSkuShareDescription];
    self.type = [aDecoder decodeObjectForKey:kSkuShareType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_typeId forKey:kSkuShareTypeId];
    [aCoder encodeObject:_shareType forKey:kSkuShareShareType];
    [aCoder encodeObject:_picUrl forKey:kSkuSharePicUrl];
    [aCoder encodeObject:_detailUrl forKey:kSkuShareDetailUrl];
    [aCoder encodeObject:_title forKey:kSkuShareTitle];
    [aCoder encodeObject:_trackValue forKey:kSkuShareTrackValue];
    [aCoder encodeObject:_shareDescription forKey:kSkuShareDescription];
    [aCoder encodeObject:_type forKey:kSkuShareType];
}

- (id)copyWithZone:(NSZone *)zone
{
    SkuShare *copy = [[SkuShare alloc] init];
    
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


@end
