//
//  BannerItems.m
//
//  Created by zhiyou3g  on 15/3/5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BannerItems.h"
#import "BannerComponent.h"


NSString *const kBannerItemsComponent = @"component";


@interface BannerItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BannerItems

@synthesize component = _component;


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
            self.component = [BannerComponent modelObjectWithDictionary:[dict objectForKey:kBannerItemsComponent]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.component dictionaryRepresentation] forKey:kBannerItemsComponent];

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

    self.component = [aDecoder decodeObjectForKey:kBannerItemsComponent];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_component forKey:kBannerItemsComponent];
}

- (id)copyWithZone:(NSZone *)zone
{
    BannerItems *copy = [[BannerItems alloc] init];
    
    if (copy) {

        copy.component = [self.component copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_component release];
    [super dealloc];
}

@end
