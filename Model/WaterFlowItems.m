//
//  WaterFlowItems.m
//
//  Created by zhiyou3g  on 15/3/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "WaterFlowItems.h"
#import "WaterFlowComponent.h"


NSString *const kWaterFlowItemsComponent = @"component";
NSString *const kWaterFlowItemsTimestamp = @"timestamp";
NSString *const kWaterFlowItemsWidth = @"width";
NSString *const kWaterFlowItemsHeight = @"height";


@interface WaterFlowItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WaterFlowItems

@synthesize component = _component;
@synthesize timestamp = _timestamp;
@synthesize width = _width;
@synthesize height = _height;


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
            self.component = [WaterFlowComponent modelObjectWithDictionary:[dict objectForKey:kWaterFlowItemsComponent]];
            self.timestamp = [self objectOrNilForKey:kWaterFlowItemsTimestamp fromDictionary:dict];
            self.width = [self objectOrNilForKey:kWaterFlowItemsWidth fromDictionary:dict];
            self.height = [self objectOrNilForKey:kWaterFlowItemsHeight fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.component dictionaryRepresentation] forKey:kWaterFlowItemsComponent];
    [mutableDict setValue:self.timestamp forKey:kWaterFlowItemsTimestamp];
    [mutableDict setValue:self.width forKey:kWaterFlowItemsWidth];
    [mutableDict setValue:self.height forKey:kWaterFlowItemsHeight];

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

    self.component = [aDecoder decodeObjectForKey:kWaterFlowItemsComponent];
    self.timestamp = [aDecoder decodeObjectForKey:kWaterFlowItemsTimestamp];
    self.width = [aDecoder decodeObjectForKey:kWaterFlowItemsWidth];
    self.height = [aDecoder decodeObjectForKey:kWaterFlowItemsHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_component forKey:kWaterFlowItemsComponent];
    [aCoder encodeObject:_timestamp forKey:kWaterFlowItemsTimestamp];
    [aCoder encodeObject:_width forKey:kWaterFlowItemsWidth];
    [aCoder encodeObject:_height forKey:kWaterFlowItemsHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    WaterFlowItems *copy = [[WaterFlowItems alloc] init];
    
    if (copy) {

        copy.component = [self.component copyWithZone:zone];
        copy.timestamp = [self.timestamp copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.height = [self.height copyWithZone:zone];
    }
    
    return copy;
}


@end
