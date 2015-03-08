//
//  MLApp.m
//
//  Created by   on 15/3/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "MLApp.h"


NSString *const kMLAppVersionName = @"versionName";
NSString *const kMLAppContent = @"content";
NSString *const kMLAppUrl = @"url";
NSString *const kMLAppUri = @"uri";
NSString *const kMLAppVersion = @"version";


@interface MLApp ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MLApp

@synthesize versionName = _versionName;
@synthesize content = _content;
@synthesize url = _url;
@synthesize uri = _uri;
@synthesize version = _version;


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
            self.versionName = [self objectOrNilForKey:kMLAppVersionName fromDictionary:dict];
            self.content = [self objectOrNilForKey:kMLAppContent fromDictionary:dict];
            self.url = [self objectOrNilForKey:kMLAppUrl fromDictionary:dict];
            self.uri = [self objectOrNilForKey:kMLAppUri fromDictionary:dict];
            self.version = [self objectOrNilForKey:kMLAppVersion fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.versionName forKey:kMLAppVersionName];
    [mutableDict setValue:self.content forKey:kMLAppContent];
    [mutableDict setValue:self.url forKey:kMLAppUrl];
    [mutableDict setValue:self.uri forKey:kMLAppUri];
    [mutableDict setValue:self.version forKey:kMLAppVersion];

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

    self.versionName = [aDecoder decodeObjectForKey:kMLAppVersionName];
    self.content = [aDecoder decodeObjectForKey:kMLAppContent];
    self.url = [aDecoder decodeObjectForKey:kMLAppUrl];
    self.uri = [aDecoder decodeObjectForKey:kMLAppUri];
    self.version = [aDecoder decodeObjectForKey:kMLAppVersion];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_versionName forKey:kMLAppVersionName];
    [aCoder encodeObject:_content forKey:kMLAppContent];
    [aCoder encodeObject:_url forKey:kMLAppUrl];
    [aCoder encodeObject:_uri forKey:kMLAppUri];
    [aCoder encodeObject:_version forKey:kMLAppVersion];
}

- (id)copyWithZone:(NSZone *)zone
{
    MLApp *copy = [[MLApp alloc] init];
    
    if (copy) {

        copy.versionName = [self.versionName copyWithZone:zone];
        copy.content = [self.content copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.uri = [self.uri copyWithZone:zone];
        copy.version = [self.version copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_versionName release];
    [_content release];
    [_url release];
    [_uri release];
    [_version release];
    [super dealloc];
}

@end
