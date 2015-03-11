//
//  TopicShare.m
//
//  Created by zhiyou3g  on 15/3/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "TopicShare.h"


NSString *const kTopicSharePicUrl = @"picUrl";
NSString *const kTopicShareShareType = @"shareType";
NSString *const kTopicShareId = @"id";
NSString *const kTopicShareDetailUrl = @"detailUrl";
NSString *const kTopicShareTitle = @"title";
NSString *const kTopicShareDescription = @"description";
NSString *const kTopicShareType = @"type";


@interface TopicShare ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TopicShare

@synthesize picUrl = _picUrl;
@synthesize shareType = _shareType;
@synthesize shareIdentifier = _shareIdentifier;
@synthesize detailUrl = _detailUrl;
@synthesize title = _title;
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
            self.picUrl = [self objectOrNilForKey:kTopicSharePicUrl fromDictionary:dict];
            self.shareType = [self objectOrNilForKey:kTopicShareShareType fromDictionary:dict];
            self.shareIdentifier = [self objectOrNilForKey:kTopicShareId fromDictionary:dict];
            self.detailUrl = [self objectOrNilForKey:kTopicShareDetailUrl fromDictionary:dict];
            self.title = [self objectOrNilForKey:kTopicShareTitle fromDictionary:dict];
            self.shareDescription = [self objectOrNilForKey:kTopicShareDescription fromDictionary:dict];
            self.type = [self objectOrNilForKey:kTopicShareType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.picUrl forKey:kTopicSharePicUrl];
    [mutableDict setValue:self.shareType forKey:kTopicShareShareType];
    [mutableDict setValue:self.shareIdentifier forKey:kTopicShareId];
    [mutableDict setValue:self.detailUrl forKey:kTopicShareDetailUrl];
    [mutableDict setValue:self.title forKey:kTopicShareTitle];
    [mutableDict setValue:self.shareDescription forKey:kTopicShareDescription];
    [mutableDict setValue:self.type forKey:kTopicShareType];

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

    self.picUrl = [aDecoder decodeObjectForKey:kTopicSharePicUrl];
    self.shareType = [aDecoder decodeObjectForKey:kTopicShareShareType];
    self.shareIdentifier = [aDecoder decodeObjectForKey:kTopicShareId];
    self.detailUrl = [aDecoder decodeObjectForKey:kTopicShareDetailUrl];
    self.title = [aDecoder decodeObjectForKey:kTopicShareTitle];
    self.shareDescription = [aDecoder decodeObjectForKey:kTopicShareDescription];
    self.type = [aDecoder decodeObjectForKey:kTopicShareType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_picUrl forKey:kTopicSharePicUrl];
    [aCoder encodeObject:_shareType forKey:kTopicShareShareType];
    [aCoder encodeObject:_shareIdentifier forKey:kTopicShareId];
    [aCoder encodeObject:_detailUrl forKey:kTopicShareDetailUrl];
    [aCoder encodeObject:_title forKey:kTopicShareTitle];
    [aCoder encodeObject:_shareDescription forKey:kTopicShareDescription];
    [aCoder encodeObject:_type forKey:kTopicShareType];
}

- (id)copyWithZone:(NSZone *)zone
{
    TopicShare *copy = [[TopicShare alloc] init];
    
    if (copy) {

        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.shareType = [self.shareType copyWithZone:zone];
        copy.shareIdentifier = [self.shareIdentifier copyWithZone:zone];
        copy.detailUrl = [self.detailUrl copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.shareDescription = [self.shareDescription copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
    }
    
    return copy;
}


@end
