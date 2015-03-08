//
//  MLMobileTopicCategories.m
//
//  Created by   on 15/3/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "MLMobileTopicCategories.h"


NSString *const kMLMobileTopicCategoriesName = @"name";
NSString *const kMLMobileTopicCategoriesPicUrl = @"picUrl";


@interface MLMobileTopicCategories ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MLMobileTopicCategories

@synthesize name = _name;
@synthesize picUrl = _picUrl;


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
            self.name = [self objectOrNilForKey:kMLMobileTopicCategoriesName fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kMLMobileTopicCategoriesPicUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kMLMobileTopicCategoriesName];
    [mutableDict setValue:self.picUrl forKey:kMLMobileTopicCategoriesPicUrl];

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

    self.name = [aDecoder decodeObjectForKey:kMLMobileTopicCategoriesName];
    self.picUrl = [aDecoder decodeObjectForKey:kMLMobileTopicCategoriesPicUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kMLMobileTopicCategoriesName];
    [aCoder encodeObject:_picUrl forKey:kMLMobileTopicCategoriesPicUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    MLMobileTopicCategories *copy = [[MLMobileTopicCategories alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_name release];
    [_picUrl release];
    [super dealloc];
}

@end
