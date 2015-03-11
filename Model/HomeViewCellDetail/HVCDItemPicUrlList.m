//
//  HVCDItemPicUrlList.m
//
//  Created by   on 15/3/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "HVCDItemPicUrlList.h"


NSString *const kHVCDItemPicUrlListPicUrl = @"picUrl";
NSString *const kHVCDItemPicUrlListPart = @"part";


@interface HVCDItemPicUrlList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HVCDItemPicUrlList

@synthesize picUrl = _picUrl;
@synthesize part = _part;


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
            self.picUrl = [self objectOrNilForKey:kHVCDItemPicUrlListPicUrl fromDictionary:dict];
            self.part = [self objectOrNilForKey:kHVCDItemPicUrlListPart fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.picUrl forKey:kHVCDItemPicUrlListPicUrl];
    [mutableDict setValue:self.part forKey:kHVCDItemPicUrlListPart];

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

    self.picUrl = [aDecoder decodeObjectForKey:kHVCDItemPicUrlListPicUrl];
    self.part = [aDecoder decodeObjectForKey:kHVCDItemPicUrlListPart];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_picUrl forKey:kHVCDItemPicUrlListPicUrl];
    [aCoder encodeObject:_part forKey:kHVCDItemPicUrlListPart];
}

- (id)copyWithZone:(NSZone *)zone
{
    HVCDItemPicUrlList *copy = [[HVCDItemPicUrlList alloc] init];
    
    if (copy) {

        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.part = [self.part copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [super dealloc];
    [_picUrl release];
    [_part release];
    
}

@end
