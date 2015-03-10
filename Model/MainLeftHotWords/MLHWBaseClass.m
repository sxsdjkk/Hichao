//
//  MLHWBaseClass.m
//
//  Created by   on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "MLHWBaseClass.h"
#import "MLHWData.h"


NSString *const kMLHWBaseClassMessage = @"message";
NSString *const kMLHWBaseClassData = @"data";


@interface MLHWBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MLHWBaseClass

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
            self.message = [self objectOrNilForKey:kMLHWBaseClassMessage fromDictionary:dict];
            self.data = [MLHWData modelObjectWithDictionary:[dict objectForKey:kMLHWBaseClassData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kMLHWBaseClassMessage];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kMLHWBaseClassData];

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

    self.message = [aDecoder decodeObjectForKey:kMLHWBaseClassMessage];
    self.data = [aDecoder decodeObjectForKey:kMLHWBaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_message forKey:kMLHWBaseClassMessage];
    [aCoder encodeObject:_data forKey:kMLHWBaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    MLHWBaseClass *copy = [[MLHWBaseClass alloc] init];
    
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
