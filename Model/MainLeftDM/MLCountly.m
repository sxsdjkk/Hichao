//
//  MLCountly.m
//
//  Created by   on 15/3/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "MLCountly.h"


NSString *const kMLCountlyAppkey = @"appkey";
NSString *const kMLCountlyAvailable = @"available";
NSString *const kMLCountlyHost = @"host";


@interface MLCountly ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MLCountly

@synthesize appkey = _appkey;
@synthesize available = _available;
@synthesize host = _host;


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
            self.appkey = [self objectOrNilForKey:kMLCountlyAppkey fromDictionary:dict];
            self.available = [self objectOrNilForKey:kMLCountlyAvailable fromDictionary:dict];
            self.host = [self objectOrNilForKey:kMLCountlyHost fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.appkey forKey:kMLCountlyAppkey];
    [mutableDict setValue:self.available forKey:kMLCountlyAvailable];
    [mutableDict setValue:self.host forKey:kMLCountlyHost];

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

    self.appkey = [aDecoder decodeObjectForKey:kMLCountlyAppkey];
    self.available = [aDecoder decodeObjectForKey:kMLCountlyAvailable];
    self.host = [aDecoder decodeObjectForKey:kMLCountlyHost];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_appkey forKey:kMLCountlyAppkey];
    [aCoder encodeObject:_available forKey:kMLCountlyAvailable];
    [aCoder encodeObject:_host forKey:kMLCountlyHost];
}

- (id)copyWithZone:(NSZone *)zone
{
    MLCountly *copy = [[MLCountly alloc] init];
    
    if (copy) {

        copy.appkey = [self.appkey copyWithZone:zone];
        copy.available = [self.available copyWithZone:zone];
        copy.host = [self.host copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_appkey release];
    [_available release];
    [_host release];
    [super dealloc];
}

@end
