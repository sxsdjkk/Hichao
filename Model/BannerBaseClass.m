//
//  BannerBaseClass.m
//
//  Created by zhiyou3g  on 15/3/5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BannerBaseClass.h"
#import "BannerData.h"


NSString *const kBannerBaseClassMessage = @"message";
NSString *const kBannerBaseClassData = @"data";


@interface BannerBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BannerBaseClass

@synthesize message = _message;
@synthesize data = _data;


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
            self.message = [self objectOrNilForKey:kBannerBaseClassMessage fromDictionary:dict];
            self.data = [BannerData modelObjectWithDictionary:[dict objectForKey:kBannerBaseClassData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kBannerBaseClassMessage];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kBannerBaseClassData];

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

    self.message = [aDecoder decodeObjectForKey:kBannerBaseClassMessage];
    self.data = [aDecoder decodeObjectForKey:kBannerBaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_message forKey:kBannerBaseClassMessage];
    [aCoder encodeObject:_data forKey:kBannerBaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    BannerBaseClass *copy = [[BannerBaseClass alloc] init];
    
    if (copy) {

        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_message release];
    [_data release];
    [super dealloc];
}

@end
