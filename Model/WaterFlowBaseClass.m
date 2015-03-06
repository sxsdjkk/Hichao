//
//  WaterFlowBaseClass.m
//
//  Created by zhiyou3g  on 15/3/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "WaterFlowBaseClass.h"
#import "WaterFlowData.h"


NSString *const kWaterFlowBaseClassMessage = @"message";
NSString *const kWaterFlowBaseClassData = @"data";


@interface WaterFlowBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WaterFlowBaseClass

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
            self.message = [self objectOrNilForKey:kWaterFlowBaseClassMessage fromDictionary:dict];
            self.data = [WaterFlowData modelObjectWithDictionary:[dict objectForKey:kWaterFlowBaseClassData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kWaterFlowBaseClassMessage];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kWaterFlowBaseClassData];

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

    self.message = [aDecoder decodeObjectForKey:kWaterFlowBaseClassMessage];
    self.data = [aDecoder decodeObjectForKey:kWaterFlowBaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_message forKey:kWaterFlowBaseClassMessage];
    [aCoder encodeObject:_data forKey:kWaterFlowBaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    WaterFlowBaseClass *copy = [[WaterFlowBaseClass alloc] init];
    
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
