//
//  HDGLBaseClass.m
//
//  Created by   on 15/3/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "HDGLBaseClass.h"
#import "HDGLData.h"


NSString *const kHDGLBaseClassMessage = @"message";
NSString *const kHDGLBaseClassData = @"data";


@interface HDGLBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HDGLBaseClass

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
            self.message = [self objectOrNilForKey:kHDGLBaseClassMessage fromDictionary:dict];
            self.data = [HDGLData modelObjectWithDictionary:[dict objectForKey:kHDGLBaseClassData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kHDGLBaseClassMessage];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kHDGLBaseClassData];

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

    self.message = [aDecoder decodeObjectForKey:kHDGLBaseClassMessage];
    self.data = [aDecoder decodeObjectForKey:kHDGLBaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_message forKey:kHDGLBaseClassMessage];
    [aCoder encodeObject:_data forKey:kHDGLBaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    HDGLBaseClass *copy = [[HDGLBaseClass alloc] init];
    
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
