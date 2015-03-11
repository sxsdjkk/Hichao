//
//  TopicCells.m
//
//  Created by zhiyou3g  on 15/3/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "TopicCells.h"
#import "TopicComponent.h"


NSString *const kTopicCellsY = @"y";
NSString *const kTopicCellsComponent = @"component";
NSString *const kTopicCellsWidth = @"width";
NSString *const kTopicCellsX = @"x";
NSString *const kTopicCellsHeight = @"height";


@interface TopicCells ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TopicCells

@synthesize y = _y;
@synthesize component = _component;
@synthesize width = _width;
@synthesize x = _x;
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
            self.y = [self objectOrNilForKey:kTopicCellsY fromDictionary:dict];
            self.component = [TopicComponent modelObjectWithDictionary:[dict objectForKey:kTopicCellsComponent]];
            self.width = [self objectOrNilForKey:kTopicCellsWidth fromDictionary:dict];
            self.x = [self objectOrNilForKey:kTopicCellsX fromDictionary:dict];
            self.height = [self objectOrNilForKey:kTopicCellsHeight fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.y forKey:kTopicCellsY];
    [mutableDict setValue:[self.component dictionaryRepresentation] forKey:kTopicCellsComponent];
    [mutableDict setValue:self.width forKey:kTopicCellsWidth];
    [mutableDict setValue:self.x forKey:kTopicCellsX];
    [mutableDict setValue:self.height forKey:kTopicCellsHeight];

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

    self.y = [aDecoder decodeObjectForKey:kTopicCellsY];
    self.component = [aDecoder decodeObjectForKey:kTopicCellsComponent];
    self.width = [aDecoder decodeObjectForKey:kTopicCellsWidth];
    self.x = [aDecoder decodeObjectForKey:kTopicCellsX];
    self.height = [aDecoder decodeObjectForKey:kTopicCellsHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_y forKey:kTopicCellsY];
    [aCoder encodeObject:_component forKey:kTopicCellsComponent];
    [aCoder encodeObject:_width forKey:kTopicCellsWidth];
    [aCoder encodeObject:_x forKey:kTopicCellsX];
    [aCoder encodeObject:_height forKey:kTopicCellsHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    TopicCells *copy = [[TopicCells alloc] init];
    
    if (copy) {

        copy.y = [self.y copyWithZone:zone];
        copy.component = [self.component copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.x = [self.x copyWithZone:zone];
        copy.height = [self.height copyWithZone:zone];
    }
    
    return copy;
}


@end
