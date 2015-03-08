//
//  MLData.m
//
//  Created by   on 15/3/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "MLData.h"
#import "MLApp.h"
#import "MLConfig.h"
#import "MLSplash.h"


NSString *const kMLDataApp = @"app";
NSString *const kMLDataConfig = @"config";
NSString *const kMLDataAppApi = @"appApi";
NSString *const kMLDataSplash = @"splash";


@interface MLData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MLData

@synthesize app = _app;
@synthesize config = _config;
@synthesize appApi = _appApi;
@synthesize splash = _splash;


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
            self.app = [MLApp modelObjectWithDictionary:[dict objectForKey:kMLDataApp]];
            self.config = [MLConfig modelObjectWithDictionary:[dict objectForKey:kMLDataConfig]];
            self.appApi = [self objectOrNilForKey:kMLDataAppApi fromDictionary:dict];
            self.splash = [MLSplash modelObjectWithDictionary:[dict objectForKey:kMLDataSplash]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.app dictionaryRepresentation] forKey:kMLDataApp];
    [mutableDict setValue:[self.config dictionaryRepresentation] forKey:kMLDataConfig];
    [mutableDict setValue:self.appApi forKey:kMLDataAppApi];
    [mutableDict setValue:[self.splash dictionaryRepresentation] forKey:kMLDataSplash];

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

    self.app = [aDecoder decodeObjectForKey:kMLDataApp];
    self.config = [aDecoder decodeObjectForKey:kMLDataConfig];
    self.appApi = [aDecoder decodeObjectForKey:kMLDataAppApi];
    self.splash = [aDecoder decodeObjectForKey:kMLDataSplash];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_app forKey:kMLDataApp];
    [aCoder encodeObject:_config forKey:kMLDataConfig];
    [aCoder encodeObject:_appApi forKey:kMLDataAppApi];
    [aCoder encodeObject:_splash forKey:kMLDataSplash];
}

- (id)copyWithZone:(NSZone *)zone
{
    MLData *copy = [[MLData alloc] init];
    
    if (copy) {

        copy.app = [self.app copyWithZone:zone];
        copy.config = [self.config copyWithZone:zone];
        copy.appApi = [self.appApi copyWithZone:zone];
        copy.splash = [self.splash copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_app release];
    [_config release];
    [_appApi release];
    [_splash release];
    [super dealloc];
}

@end
