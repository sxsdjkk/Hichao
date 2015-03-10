//
//  PgItems.m
//
//  Created by   on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "PgItems.h"
#import "PgComponent.h"


NSString *const kPgItemsUts = @"uts";
NSString *const kPgItemsComponent = @"component";


@interface PgItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PgItems

@synthesize uts = _uts;
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
            self.uts = [self objectOrNilForKey:kPgItemsUts fromDictionary:dict];
            self.component = [PgComponent modelObjectWithDictionary:[dict objectForKey:kPgItemsComponent]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.uts forKey:kPgItemsUts];
    [mutableDict setValue:[self.component dictionaryRepresentation] forKey:kPgItemsComponent];

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

    self.uts = [aDecoder decodeObjectForKey:kPgItemsUts];
    self.component = [aDecoder decodeObjectForKey:kPgItemsComponent];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_uts forKey:kPgItemsUts];
    [aCoder encodeObject:_component forKey:kPgItemsComponent];
}

- (id)copyWithZone:(NSZone *)zone
{
    PgItems *copy = [[PgItems alloc] init];
    
    if (copy) {

        copy.uts = [self.uts copyWithZone:zone];
        copy.component = [self.component copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_uts release];
    [_component release];
    [super dealloc];
}

@end
